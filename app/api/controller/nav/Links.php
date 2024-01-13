<?php
namespace app\api\controller\nav;

use app\api\model\Links as linksModel;

class Links extends \app\api\controller\Base
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
        $this->model = new linksModel();
    }
    
    // 列表
    public function list()
    {
        $params=$this->getData();
        if(isset($params['id'])){
            $data=$this->model->getIdList($params);
        }else if(isset($params['keywords'])){
            $data=$this->model->getValList($params);
        }else{
            $data=$this->model->List(); 
        }
        return $this->renderSuccess(['list'=>$data],'获取成功！');
    }
    
    
}
