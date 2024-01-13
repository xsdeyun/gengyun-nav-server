<?php
namespace app\admin\controller;

use think\facade\Request;
use think\facade\Db;
use think\facade\Cookie;
use think\facade\Session;
use app\admin\model\Login as LoginModel;
use app\admin\model\system\Menus as MenusModel;

class Login extends Base
{
    
    /**
     * 强制验证当前访问的控制器方法method
     * 例: [ 'login' => 'POST' ]
     * @var array
     */
    protected $methodRules = [
        'info'=>'GET',
        'login' => 'POST',
        'logout' => 'POST'
    ];

    /**
     * 后台用户登录
     * @return array|bool|string
     */
    public function login()
    {
        $model = new LoginModel;
        if (($userInfo = $model->checkLogin($this->postData())) === false) {
            return $this->renderError($model->error);
        }
        $token = Request::buildToken('__token__', 'sha1');
        return $this->renderSuccess([
            'user' => $userInfo,
            "token"=> $token
        ], '登录成功');
    }
        
     public function info()
    {
        $model = new LoginModel;
        $menuModel= new MenusModel;
        return $this->renderSuccess(
            [
                "user"=>$model->getLoginInfo(),
                "menus"=>$menuModel->getRolesMenus($model->getLoginRoleId()),
                "permissions"=>$model->getLoginPermissions()
            ]
        );
    }

    /**
     * 退出登录
     * @return array
     */
    public function logout()
    {
        // 清空登录状态
        Session::clear();
        return $this->renderSuccess('退出成功！');
    }



}
