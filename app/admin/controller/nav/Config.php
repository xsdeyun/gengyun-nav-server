<?php
namespace app\admin\controller\nav;
use app\admin\model\nav\Config as setModel;

class Config extends \app\admin\controller\Base
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
         'list'=>'GET',
         'add' => 'POST'
    ];
     
    protected $ApiCheckPermss = [
        "add"=>"nweb:save"
    ];
     
      // 定义控制器
    protected $model;
    
    public function initialize()
    {
        parent::initialize();
        $this->model = new setModel();
    }
    
    
    // 新增
    public function find()
    {
        $data=$this->model->finds();  
        return $this->renderSuccess($data,'获取成功！');
    }
    
    
    // 新增
    public function add()
    {
        $post=$this->postData();
        $data=$this->model->Add($post);
        return $this->renderSuccess('新增成功！');
    }
   
}
