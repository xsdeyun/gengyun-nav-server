<?php
declare (strict_types=1);

namespace app\cores\getFavicon;
/**
 * getFavicon
 * @author    小宋
 * @date      2023-8-5
 * @version   1.0.0
 */
class Favicon
{
    
    // 触发
    public function getFavicon($url){
        $favicon = new Favicon();
        $formatUrl = $favicon->formatUrl($url);
        $web_data = $favicon->getData();
        return $web_data;
    }
    
       /**
     * 保存传入的参数,其中:
     *
     *    origin_url:     保存传入的url参数的原始字符串信息
     *
     *
     *  以及一些额外的参数及暂存的数据
     */
    private $params = array();

    /**
     * 完整的形如  http://xxx.xxx.com:8888 这样的地址
     */
    private $full_host = '';
    
    
    /**
     * 解析一个完整的URL中并返回其中的协议、域名和端口部分
     * 同时会设置类中的parsed_url和full_host属性
     *
     * @param $url
     * @return bool|string
     */
    public  function formatUrl($url)
    {
        /**
         * 尝试解析URL参数，如果解析失败的话再加上http前缀重新尝试解析
         *
         */
        $parsed_url = parse_url($url);

        if (!isset($parsed_url['host']) || !$parsed_url['host']) {
            //在URL的前面加上http://
            // add the prefix
            if (!preg_match('/^https?:\/\/.*/', $url))
                $url = 'http://' . $url;
            //解析URL并将结果保存到 $this->url
            $parsed_url = parse_url($url);

            if ($parsed_url == FALSE) {
                return FALSE;
            } else {
                /**
                 * 能成功解析的话就可以设置原始URL为这个添加过http://前缀的URL
                 */
                $this->params['origin_url'] = $url;
            }
        }

        $this->full_host = (isset($parsed_url['scheme']) ? $parsed_url['scheme'] : 'http') . '://' . $parsed_url['host'] . (isset($parsed_url['port']) ? ':' . $parsed_url['port'] : '');
        $this->params['origin_url'] = $this->full_host;
        return $this->full_host;
    }
    
    public function getData(){
        
        $this->data=["title"=>"","description"=>"","ico_url"=>"","origin_url"=>$this->params['origin_url']];
        
        //从源网址获取HTML内容并解析其中的LINK标签
        $html = $this->getFile($this->params['origin_url']);
        if ($html && $html['status'] == 'OK') {
            /*
             * FIX #1
             * 对取到的HTML内容进行删除换行符的处理,避免link信息折行导致的正则匹配失败
             */
            $html = str_replace(array("\n", "\r"), '', $html['data']);
            // 匹配标题
            if(preg_match('/<title>(.*?)<\/title>/i', $html, $matches_title)){
                $title = $matches_title[1] ?? '';
                $this->data["title"] = $title;
            }
            // 匹配描述
            if(preg_match('/<meta\s+name=["\']description["\']\s+content=["\'](.*?)["\']\s*\/?>/i', $html, $matches_description)){
                $description = $matches_description[1] ?? '';
                $this->data["description"] = $description;
            }
            //匹配完整的LINK标签，再从LINK标签中获取HREF的值
            if (@preg_match('/((<link[^>]+rel=.(icon|shortcut icon|alternate icon|apple-touch-icon)[^>]+>))/i', $html, $match_tag)) {
                if (isset($match_tag[1]) && $match_tag[1] && @preg_match('/href=(\'|\")(.*?)\1/i', $match_tag[1], $match_url)) {
                    if (isset($match_url[2]) && $match_url[2]) {
                        //解析HTML中的相对URL 路径
                        $match_url[2] = $this->filterRelativeUrl(trim($match_url[2]), $this->params['origin_url']);
                        $icon = $this->getFile($match_url[2],true);
                        if ($icon && $icon['status'] == 'OK') {
                            $this->data["ico_url"] =$icon["real_url"];
                        }
                    }
                }
            }
        }
        
        
        if ($this->data["ico_url"] == "") {
            $thrurl='http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url='.$this->params['origin_url'];
            $icon = file_get_contents($thrurl);
            if($icon){
                $this->data["ico_url"] = $thrurl;
            }
        }
        return $this->data;
    }
    
    
    
    
    /**
     * 从指定URL获取文件
     * 2023 添加请求内容判断
     * 
     * @param string $url
     * @param bool   $isimg 是否为图片
     * @param int    $timeout 超时值，默认为10秒
     * @return string|array 成功返回获取到的内容，同时设置 $this->content，失败返回FALSE
     */
    private function getFile($url, $isimg = false, $timeout = 2)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        /*
         * 2019-06-20
         * 修复ssl的错误
         */
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        /** @var mixed 只获取500kb的数据，如果目标图片超过500kb，则丢弃 */
        $request_headers = array('Range: bytes=0-512000'); //500 KB
        curl_setopt( $ch, CURLOPT_FORBID_REUSE, true );
        $request_headers[] = 'Connection: close';
        curl_setopt( $ch, CURLOPT_HTTPHEADER, $request_headers );

        curl_setopt($ch, CURLOPT_FAILONERROR, 1);
        //执行重定向获取
        $ret = $this->curlExecFollow($ch, 2);

        if($isimg){
            $mime=curl_getinfo($ch, CURLINFO_CONTENT_TYPE);
            $mimeArray=explode('/',$mime);
        }
        $arr = array(
            'status'   => 'FAIL',
            'data'     => '',
            'real_url' => ''
        );
        if(!$isimg ||  $mimeArray[0] == 'image'){
            if ($ret != false) {
                $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                $arr = array(
                    'status'   => ($status >= 200 && $status <= 299) ? 'OK' : 'FAIL',
                    'data'     => $ret,
                    'real_url' => curl_getinfo($ch, CURLINFO_EFFECTIVE_URL)
                );

            }
            curl_close($ch);
            
            return $arr;
        }else{
            return $arr;
        }
    }
    
    
    /**
     * 使用跟综重定向的方式查找被301/302跳转后的实际地址，并执行curl_exec
     * 代码来自： http://php.net/manual/zh/function.curl-setopt.php#102121
     *
     * @param resource $ch          CURL资源句柄
     * @param int      $maxredirect 最大允许的重定向次数
     * @return string
     */
    private function curlExecFollow( &$ch, $maxredirect = null) {
        $mr = $maxredirect === null ? 5 : intval($maxredirect); 
        if (ini_get('open_basedir') == '' && ini_get('safe_mode' == 'Off')) { 
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, $mr > 0); 
            curl_setopt($ch, CURLOPT_MAXREDIRS, $mr);
        } else { 
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, false); 
            if ($mr > 0) { 
                $newurl = curl_getinfo($ch, CURLINFO_EFFECTIVE_URL); 
    
                $rch = curl_copy_handle($ch); 
                curl_setopt($rch, CURLOPT_HEADER, true); 
                curl_setopt($rch, CURLOPT_NOBODY, true); 
                curl_setopt($rch, CURLOPT_NOSIGNAL, 1);
                curl_setopt($rch, CURLOPT_CONNECTTIMEOUT_MS, 800); 
                curl_setopt($rch, CURLOPT_FORBID_REUSE, false); 
                curl_setopt($rch, CURLOPT_RETURNTRANSFER, true); 
                do { 
                    curl_setopt($rch, CURLOPT_URL, $newurl); 
                    $header = curl_exec($rch); 
                    if (curl_errno($rch)) { 
                        $code = 0; 
                    } else { 
                        $code = curl_getinfo($rch, CURLINFO_HTTP_CODE); 
                        if ($code == 301 || $code == 302) { 
                            preg_match('/Location:(.*?)\n/', $header, $matches); 
                            $newurl = trim(array_pop($matches)); 
                            /**
                             * 这里由于部分网站返回的 Location 的值可能是相对网址, 所以还需要做一步
                             * 转换成完整地址的操作
                             *
                             * @since v2.2.2
                             */
                            $newurl = $this->filterRelativeUrl($newurl, $this->params['origin_url']);
                        } else { 
                            $code = 0; 
                        } 
                    } 
                } while ($code && --$mr); 
                curl_close($rch); 
                if (!$mr) { 
                    if ($maxredirect === null) { 
                        trigger_error('Too many redirects. When following redirects, libcurl hit the maximum amount.', E_USER_WARNING); 
                    } else { 
                        $maxredirect = 0; 
                    } 
                    return false; 
                } 
                curl_setopt($ch, CURLOPT_URL, $newurl); 
            } 
        } 
        return curl_exec($ch); 
    } 
    
    
     /**
     * 把从HTML源码中获取的相对路径转换成绝对路径
     *
     *
     * @param string $url HTML中获取的网址
     * @param string $URI 用来参考判断的原始地址
     * @return string 返回修改过的网址
     */
    private function filterRelativeUrl($url, $URI = '')
    {
        //STEP1: 先去判断URL中是否包含协议，如果包含说明是绝对地址则可以原样返回
        if (strpos($url, '://') !== FALSE) {
            return $url;
        }

        //STEP2: 解析传入的URI
        $URI_part = parse_url($URI);
        if ($URI_part == FALSE)
            return FALSE;

        $URI_root = $URI_part['scheme'] . '://' . $URI_part['host'] . (isset($URI_part['port']) ? ':' . $URI_part['port'] : '');

        //STEP3: 如果URL以左斜线开头，表示位于根目录

        // 如果URL以 // 开头,表示是省略协议的绝对路径,可以添加协议后返回
        if (substr($url, 0, 2) === '//') {
            return $URI_part['scheme'] . ':' . $url;
        }

        if (strpos($url, '/') === 0) {
            return $URI_root . $url;
        }

        //STEP4: 不位于根目录，也不是绝对路径，考虑如果不包含'./'的话，需要把相对地址接在原URL的目录名上
        $URI_dir = (isset($URI_part['path']) && $URI_part['path']) ? '/' . ltrim(dirname($URI_part['path']), '/') : '';
        if (strpos($url, './') === FALSE) {
            if ($URI_dir != '') {
                return $URI_root . $URI_dir . '/' . $url;
            } else {
                return $URI_root . '/' . $url;
            }
        }

        //STEP5: 如果相对路径中包含'../'或'./'表示的目录，需要对路径进行解析并递归
        //STEP5.1: 把路径中所有的'./'改为'/'，'//'改为'/'
        $url = preg_replace('/[^\.]\.\/|\/\//', '/', $url);
        if (strpos($url, './') === 0)
            $url = substr($url, 2);

        //STEP5.2: 使用'/'分割URL字符串以获取目录的每一部分进行判断
        $URI_full_dir = ltrim($URI_dir . '/' . $url, '/');
        $URL_arr = explode('/', $URI_full_dir);

        // 这里为了解决有些网站在根目录下的文件也使用 ../img/favicon.ico 这种形式的错误,
        // 对这种本来不合理的路径予以通过, 并忽略掉前面的两个点 (没错, 我说的是 gruntjs 的官网)
        if ($URL_arr[0] == '..') {
            array_shift($URL_arr);
        }

        //因为数组的第一个元素不可能为'..'，所以这里从第二个元素可以循环
        $dst_arr = $URL_arr;  //拷贝一个副本，用于最后组合URL
        for ($i = 1; $i < count($URL_arr); $i++) {
            if ($URL_arr[$i] == '..') {
                $j = 1;
                while (TRUE) {
                    if (isset($dst_arr[$i - $j]) && $dst_arr[$i - $j] != FALSE) {
                        $dst_arr[$i - $j] = FALSE;
                        $dst_arr[$i] = FALSE;
                        break;
                    } else {
                        $j++;
                    }
                }
            }
        }

        //STEP6: 组合最后的URL并返回
        $dst_str = $URI_root;
        foreach ($dst_arr as $val) {
            if ($val != FALSE)
                $dst_str .= '/' . $val;
        }

        return $dst_str;
    }
    
}
