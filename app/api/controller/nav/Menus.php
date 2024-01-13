<?php
namespace app\api\controller\nav;

use app\api\model\Menus as menusModel;

class Menus extends \app\api\controller\Base
{

    

    /**
     * 请求方法 get post put delete
     * get 数据请求
     * post 新增
     * put 更新
     * delete 删除
     * 
     */
    
    protected $methodRules = [
        'list'=>'GET'
    ];
    
    // 定义控制器
    protected $model;
    
    public function initialize()
    {
        parent::initialize();
        $this->model = new menusModel();
    }
    
    // 列表
    public function list()
    {
        $data=$this->model->List();  
        return $this->renderSuccess(['list'=>$data],'获取成功！');
    }
    
}
