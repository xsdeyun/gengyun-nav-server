<?php
namespace app\admin\controller;

use think\facade\Request;
use think\facade\View;
use think\facade\Db;
use think\facade\Cookie;
use think\facade\Session;

class Regiest extends Base
{
  
    
    // 用户注册
    
    /**
     * 请求方法 get post put delete
     * get 数据请求
     * post 新增
     * put 更新
     * delete 删除
     * 
     */
    
    // 注册
    public function regiest()
    {
        return json(["error"=>500]);
    }

}
