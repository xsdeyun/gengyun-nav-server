<?php

declare (strict_types=1);

namespace app\admin\model\nav;
use app\admin\model\Login as LoginModel;
use think\Model;
/**
 * 导航模块模型
 * Class Links
 * @package app\admin\model
 */
class Links extends Model
{
    protected $table = 'gy_nav_links';
    protected $pk = 'id';
   
    // 列表
    public function List($params){
        $pageSize = isset($params['pageSize']) ? $params['pageSize'] : 10; 
        $page = isset($params['page']) ? $params['page'] : 1;
        $query = $this; // 将查询构建器对象赋值给一个变量
        if (!empty($params["keyword"])) {
            $keyword = $params["keyword"];
            $query = $query->where('name', 'like', "%{$keyword}%"); 
        }
        if (!empty($params["menu"])) {
            $query = $query->where('menu_id', 'like', "%{$params['menu']}%" ); 
        }

        $data = $query->order('create_time', 'desc')->paginate($pageSize, false, ['page' => $page]);
        foreach ($data as &$item) {  
            $item['menu_id'] = explode(',', $item['menu_id']);
            $item['menu_id'] = array_map('intval', $item['menu_id']); 
        }
        return $data;
    }
    
    // 新增
    public function Add($post){
        $loginName=LoginModel::getLoginName();
        $post['create_time']=date('Y-m-d H:i:s');
        $post['create_by']=$loginName;
        $post['menu_id']= implode(",", $post['menu_id']);
        $data = $this->save($post);
        return  $data;
    }
    
    // 编辑
    public function Edit($post){
        $loginName=LoginModel::getLoginName();
        $post['update_time']=date('Y-m-d H:i:s');
        $post['update_by']=$loginName;
        $post['menu_id']= implode(",", $post['menu_id']);
        $data = $this->update($post);
        return  $data;
    }
    
    // 数量查询
    public function Total(){
        $number = $this->count();
        return  $number;
    }

}