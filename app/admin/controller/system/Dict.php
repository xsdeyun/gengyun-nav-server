<?php
namespace app\admin\controller\system;

use app\admin\model\system\Dict as dictModel;

class Dict extends \app\admin\controller\Base
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
            'listp'=>'GET',
            'add' => 'POST',
            'edit' => 'PUT',
            'del'=>'DELETE'
     ];
     
     protected $ApiCheckPermss = [
        "add"=>"dictp:add",
        "edit"=>"dictp:edit",
        "del"=>"dictp:delete"
    ];
      // 定义控制器
    protected $model;
    
    public function initialize()
    {
        parent::initialize();
        $this->model = new dictModel();
    }
    // parent list
    public function listp()
    { 
        $data=$this->model->Listp($this->getData());  
        return $this->renderSuccess(['list'=>$data],'获取成功！');
    }
    
    // 列表
    public function listz()
    { 
        $data=$this->model->Listz($this->getData());  
        return $this->renderSuccess(['list'=>$data],'获取成功！');
    }
    
    // 新增
    public function add()
    {
        $post=$this->postData();
        $data=$this->model->Add($post);
        return $this->renderSuccess('新增成功！');
    }
    
    // 编辑
    public function edit()
    {
        $post=$this->postData();
        $data=$this->model->Edit($post);
        return $this->renderSuccess('修改成功！');
    }
    // 状态
    public function state()
    {
        $data=$this->model->updateState($this->getData()); 
        return $this->renderSuccess('修改成功！');
    }
    
    // 删除
    public function del($id)
    {
        $del = $this->model->find($id);
        if (!$del) {
            return $this->renderError('删除失败!');
        }
        $del->delete();
        return $this->renderSuccess('删除成功!');
    }
}
