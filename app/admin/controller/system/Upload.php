<?php
namespace app\admin\controller\system;
use \think\Image;
use think\File;
use think\facade\Request;
use app\admin\model\system\Upload as uploadModel;

class Upload extends \app\admin\controller\Base
{
    // 定义控制器
    protected $model;

    public function initialize()
    {
        parent::initialize();
        $this->model = new uploadModel();
    }
    
   // 图片上传
    public function image()
    {   
        $module=Request::post('module',10);
        $file=Request::file('file');
        
        $originalName = $file->getOriginalName();
        $size = $file->getSize();
        // 获取文件基本信息
        $fileInfo = pathinfo($file);
        // 获取文件后缀
        $extension = strtolower($file->getOriginalExtension());
        // 获取文件地址和名称
        $filePath = $fileInfo['dirname'] . '/' . $fileInfo['basename'];
        // 文件地址转文件类
        $file = new File($filePath);
        // 文件转存目录(按自己喜好定义就行)
        $savePath = root_path() . 'public/upload/image/'.date('Y-m-d').'/';
        // 新的文件名(按自己喜好生成就行)
        $fileName = $file->md5() . '.' . $extension;
        // 转移临时文件到指定目录
        $file->move($savePath, $savePath.$fileName);
        $urlPath=strstr($savePath.$fileName, '/image');
        $dataInfo = [
            'module'=>$module,
            'type'=>10,
            'name' => $fileName,
            'original_name' => $originalName,
            'url' => $urlPath,
            'size' =>  $size
        ];
        $image=$this->model->addImage($dataInfo);
        return $this->renderSuccess(['image'=>$image],'上传成功！');
    }
    
    public function video(){
        
        $file=Request::file('file');
        
        $originalName = $file->getOriginalName();
        $size = $file->getSize();
        // 获取文件基本信息
        $fileInfo = pathinfo($file);
        // 获取文件后缀
        $extension = strtolower($file->getOriginalExtension());
        // 获取文件地址和名称
        $filePath = $fileInfo['dirname'] . '/' . $fileInfo['basename'];
        // 文件地址转文件类
        $file = new File($filePath);
        // 文件转存目录(按自己喜好定义就行)
        $savePath = root_path() . 'public/upload/video/'.date('Y-m-d').'/';
        // 新的文件名(按自己喜好生成就行)
        $fileName = $file->md5() . '.' . $extension;
        // 转移临时文件到指定目录
        $file->move($savePath, $savePath.$fileName);
        $urlPath=strstr($savePath.$fileName, '/image');
        $dataInfo = [
            'type'=>20,
            'name' => $fileName,
            'original_name' => $originalName,
            'url' => $urlPath,
            'size' =>  $size
        ];
        $video=$this->model->addImage($dataInfo);
        return $this->renderSuccess(['video'=>$video],'上传成功！');
    }
    
    // 压缩
    protected function compressImage($filePath)
    {
        $image = Image::open('public/'.$filePath);
        // 获取原始图片宽高
        $width = $image->width();
        $height = $image->height();
        // 如果图片宽高超过指定大小，则进行压缩
        if ($width > 800 || $height > 800) {
            $image->thumb(800, 800)->save($filePath);
        }
    }

}
