<?php
namespace app\admin\controller\nav;

use app\admin\model\nav\Links as linksModel;
use app\cores\getFavicon\Favicon as faviconModel;

class Links extends \app\admin\controller\Base
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
        'del'=>'DELETE'
    ];
    protected $ApiCheckPermss = [
        "add"=>"nmenu:add",
        "edit"=>"nmenu:edit",
        "del"=>"nmenu:delete"
    ];
    // 定义控制器
    protected $model;
    
    public function initialize()
    {
        parent::initialize();
        $this->model = new linksModel();
    }
    
    // 列表
    public function Favicon()
    {
        $fav=new faviconModel();
        $data=$fav->getFavicon($this->getData('url'));
        return $this->renderSuccess($data,'获取成功！');
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
