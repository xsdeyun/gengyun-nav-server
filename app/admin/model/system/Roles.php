<?php

declare (strict_types=1);

namespace app\admin\model\system;
use app\admin\model\Login as LoginModel;
use think\Model;
/**
 * 角色模型
 * Class Roles
 * @package app\admin\model
 */
class Roles extends Model
{
    protected $table = 'gy_admin_roles';
    protected $pk = 'id';
   
    // 列表
    public function List($params){
        $pageSize = isset($params['pageSize']) ? $params['pageSize'] : 10; 
        $page = isset($params['page']) ? $params['page'] : 1;
        $query = $this; // 将查询构建器对象赋值给一个变量
        if (!empty($params["keyword"])) {
            $keyword = $params["keyword"];
            $query = $query->where('name', 'like', "%{$keyword}%"); // 添加 username 搜索条件
        }
        $data = $query->order('create_time', 'desc')->paginate($pageSize, false, ['page' => $page]);
        return $data;
    }
    // 新增
    public function Add($post){
        $loginName = LoginModel::getLoginName();
        $post['create_time'] = date('Y-m-d H:i:s');
        $post['create_by'] = $loginName;
        $data = $this->save($post);
        return  $data;
    }
    
    // 编辑
    public function Edit($post){
        $loginName = LoginModel::getLoginName();
        $post['update_time'] = date('Y-m-d H:i:s');
        $post['update_by'] = $loginName;
        $data = $this->update($post);
        return  $data;
    }
    // 更新状态
    public function updateState($params){
        $param = $this->where('id', $params['id'])->update(['state' => $params['state']]);
        return $param;
    }
}