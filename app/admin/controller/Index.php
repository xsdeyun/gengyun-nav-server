<?php
namespace app\admin\controller;
use app\admin\model\nav\Config as configModel;
use app\admin\model\nav\Links as linksModel;
use app\admin\model\nav\Menus as menusModel;

class Index extends Base
{
  
    /**
     * 请求方法 get post put delete
     * get 数据请求
     * post 新增
     * put 更新
     * delete 删除
     * 
     */
     
    // 
    public function index()
    {
        
    }
    
    // 工作台数据
    public function dash()
    {
        $config = new configModel();
        $links = new linksModel();
        $menus = new menusModel();
        
        return $this->renderSuccess(
            [
                "views"=>$config->Views(),
                "links"=>$links->Total(),
                "menus"=>$menus->Total()
            ]
        );
    }

    
}
