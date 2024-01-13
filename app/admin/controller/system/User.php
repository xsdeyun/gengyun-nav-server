<?php
namespace app\admin\controller\system;
use think\File;
use think\facade\Request;
use app\admin\model\system\User as userModel;

class User extends \app\admin\controller\Base
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
            'updatePass'=>'PUT'
     ];
     
     protected $ApiCheckPermss = [
        "add"=>"user:add",
        "state"=>"user:state",
        "edit"=>"user:edit",
        "del"=>"user:delete",
        'updatePass'=>'user:updatePass'
    ];
      // 定义控制器
    protected $model;
    
    public function initialize()
    {
        parent::initialize();
        $this->model = new userModel();
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
     // 更新密码
    public function updatePass()
    {
        $post=$this->postData();
        $data=$this->model->updatePass($post);
        return $this->renderSuccess('密码修改成功！');
    }
    
    // 状态
    public function state()
    {
        $data=$this->model->updateState($this->getData()); 
        return $this->renderSuccess('修改成功！');
    }
    
    // 状态
    public function avatar()
    {
        $file=Request::file('file');
        $userId=Request::post('userId');
        $user=$this->model->find($userId);
        if($user['avatar_name']!='default'){
            unlink(app()->getRootPath() . "/public/upload".$user["avatar_path"]);
        }
        // 获取文件基本信息
        $fileInfo = pathinfo($file);
        // 获取文件后缀
        $extension = strtolower($file->getOriginalExtension());
        // 获取文件地址和名称
        $filePath = $fileInfo['dirname'] . '/' . $fileInfo['basename'];
        // 文件地址转文件类
        $file = new File($filePath);
        // 文件转存目录(按自己喜好定义就行)
        $savePath = root_path() . 'public/upload/image/'.date('Y-m-d').'/';
        // 新的文件名(按自己喜好生成就行)
        $fileName = $file->md5() . '.' . $extension;
        // 转移临时文件到指定目录
        $file->move($savePath, $savePath.$fileName);
        $urlPath=strstr($savePath.$fileName, '/image');
        $this->model->Edit(["id"=>$userId,"avatar_name"=>$fileName,"avatar_path"=>$urlPath]);
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
