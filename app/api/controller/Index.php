<?php
namespace app\api\controller;

class Index extends Base
{
  
    
    // 后台登录地址
    
    /**
     * 请求方法 get post put delete
     * get 数据请求
     * post 新增
     * put 更新
     * delete 删除
     * 
     */
    
    
    public function index()
    {
        return json(["code"=>200,"msg"=>"访问成功！"]);
    }

    
}
