<?php
namespace app\admin\controller\system;

use app\admin\model\system\Roles as rolesModel;
use app\admin\model\system\RolesMenus as rolesMenusModel;

class Roles extends \app\admin\controller\Base
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
            'add' => 'POST',
            'edit' => 'PUT',
            'state' => 'GET',
            'del'=>'DELETE',
            'getIdRoles'=>'GET'
     ];
     
    protected $ApiCheckPermss = [
        "add"=>"role:add",
        "edit"=>"role:edit",
        "del"=>"role:delete"
    ];
      // 定义控制器
    protected $model;
    
    public function initialize()
    {
        parent::initialize();
        $this->model = new rolesModel();
    }
    // 列表
    public function list()
    { 
        $data=$this->model->List($this->getData());  
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
    
    // id roles
    public function getIdRoles()
    {
        $rolesMenus=new rolesMenusModel();
        $data=$rolesMenus->getIdRoles($this->getData()); 
        return $this->renderSuccess(['list'=>$data],'菜单权限获取成功！');
    }
    public function updateIdRoles(){
        $rolesMenus=new rolesMenusModel();
        $data=$rolesMenus->updateIdRoles($this->getData()); 
        return $this->renderSuccess('菜单权限修改成功！');
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
