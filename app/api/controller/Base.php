<?php
declare (strict_types = 1);


namespace app\api\controller;
use think\facade\Session;
use think\response\Json;
use app\cores\exception\BaseException;
class Base extends \app\BaseController
{

     // 用户登录信息
    protected $admin;

    // 当前控制器名称
    protected $controller = '';

    // 当前方法名称
    protected $action = '';

    // 当前路由uri
    protected $routeUri = '';

    // 当前路由：分组名称
    protected $group = '';


    // 登录验证白名单
    protected $allowAllAction = [
        'nav.menus/list',
        'nav.links/list',
        'nav.app/hitokoto',
        'nav.app/info',
        'WeChat.reply/index'
    ];

    /**
     * 强制验证当前访问的控制器方法method
     * 例: [ 'login' => 'POST' ]
     * @var array
     */
    protected $methodRules = [];


    /**
     * 后台初始化
     * @throws BaseException
     */
    public function initialize()
    {
         // 设置管理员登录信息
        $this->setAdminInfo();
        // 当前路由信息
        $this->getRouteInfo();
        // 验证登录状态
        $this->checkLogin();
        // 强制验证当前访问的控制器方法method
        $this->checkMethodRules();
    }
    
    /**
     * 获取当前登录用户信息
     */
    private function setAdminInfo()
    {
        $this->admin = Session::get('user_info');
    }
    
    /**
     * 解析当前路由参数 （分组名称、控制器名称、方法名）
     */
    protected function getRouteInfo()
    {
        // 控制器名称
        $this->controller = uncamelize($this->request->controller());
        // 方法名称
        $this->action = $this->request->action();
        // 控制器分组 (用于定义所属模块)
        $group = strstr($this->controller, '.', true);
        $this->group = $group !== false ? $group : $this->controller;
        // 当前uri
        $this->routeUri = "{$this->controller}/$this->action";
    }

	 /**
     * 返回封装后的 API 数据到客户端
     * @param int|null $status 状态码
     * @param string $message
     * @param array $data
     * @return Json
     */
    protected function renderData(int $code = null, string $message = '', array $data = []): Json
    {
        is_null($code) && $code = config('status.success');
        return json(compact('code', 'message', 'data'));
    }

    /**
     * 返回操作成功json
     * @param array|string $data
     * @param string $message
     * @return Json
     */
    protected function renderSuccess($data = [], string $message = 'success'): Json
    {
        if (is_string($data)) {
            $message = $data;
            $data = [];
        }
        return $this->renderData(config('status.success'), $message, $data);
    }

    /**
     * 返回操作失败json
     * @param string $message
     * @param array $data
     * @return Json
     */
    protected function renderError(string $message = 'error', array $data = []): Json
    {
        return $this->renderData(config('status.error'), $message, $data);
    }

    /**
     * 获取post数据 (数组)
     * @param $key
     * @return mixed
     */
    protected function postData($key = null)
    {  

        return $this->request->post(empty($key) ? '' : "{$key}/a");
    }

    /**
     * 获取post数据 (数组)
     * @param string $key
     * @return mixed
     */
    protected function postForm(string $key = 'form')
    {
        return $this->postData($key);
    }

    /**
     * 获取post数据 (数组)
     * @param $key
     * @return mixed
     */
    protected function getData($key = null)
    {
        return $this->request->get(is_null($key) ? '' : $key);
    }
    
     /**
     * 验证登录状态
     * @return bool
     * @throws BaseException
     */
    private function checkLogin(): void
    {
        // 验证当前请求是否在白名单
        if (in_array($this->routeUri, $this->allowAllAction)) {
            return;
        }
        // 验证登录状态
        if (empty($this->admin)) {
            throwError('请先登录后再访问!', config('status.not_logged'));
        }
    }
    
    /**
     * 强制验证当前访问的控制器方法method
     * @return bool
     * @throws BaseException
     */
    private function checkMethodRules(): bool
    {
        if (!isset($this->methodRules[$this->action])) {
            return true;
        }
        $methodRule = $this->methodRules[$this->action];
        $currentMethod = $this->request->method();
        if (empty($methodRule)) {
            return true;
        }
        if (is_array($methodRule) && in_array($currentMethod, $methodRule)) {
            return true;
        }
        if (is_string($methodRule) && $methodRule == $currentMethod) {
            return true;
        }
        throwError('illegal request method');
        return false;
    }
    
}
