<?php

declare (strict_types=1);

namespace app\admin\model;
use think\facade\Session;
use think\Model;
use app\admin\model\system\Menus as MenusModel;
/**
 * 用户登录模型
 * Class StoreUser
 * @package app\store\model
 */
class Login extends Model{
    
    protected $table = 'gy_admin_user';
    protected $pk = 'id';
    
     // 登录验证
    public function checkLogin($data)
    {
        $user = $this->where('username',$data["username"])->filter(function($u) {
              $u['avatar_path'] = uploads_url().$u['avatar_path'];
              return $u;
             })->find();
        if (!$user) {
            $this->error = '用户名不存在';
            return false;
        }
        if (!password_verify($data["password"], $user['password'])) {
            $this->error = '密码错误！';
            return false;
        }
        if ($user['state']!==1) {
            $this->error = '用户已被禁用！';
            return false;
        }
        Session::set("user_info",$user);
        return $user;
    }
    
    // 当前用户
    public static function getLoginInfo()
    {
        return Session::get('user_info');
    }
    
    // 当前用户名
    public static function getLoginName()
    {
        $user=self::getLoginInfo();
        return $user["username"];
    }
    
    // 当前用户名ID
    public static function getLoginId()
    {
        $user=self::getLoginInfo();
        return $user["id"];
    }
    // 当前角色ID
    public static function getLoginRoleId()
    {
        $user=self::getLoginInfo();
        return $user["roles"];
    }
    
    // 当前角色的权限set
    public static function setLoginPermissions()
    {
        $menuModel= new MenusModel;
        $permissions=$menuModel->getPermissions(self::getLoginRoleId());
        return $permissions;
    }
    // 当前角色的权限get
    public static function getLoginPermissions()
    {
        $getPermissions=self::setLoginPermissions();
        return $getPermissions;
    }
    
}