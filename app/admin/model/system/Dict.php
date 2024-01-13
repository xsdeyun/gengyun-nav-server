<?php

declare (strict_types=1);
namespace app\admin\model\system;
use app\admin\model\Login as LoginModel;
use think\Model;
/**
 * 字典模块模型
 * Class Dict
 * @package app\admin\model
 */
class Dict extends Model
{
    protected $table = 'gy_admin_dict';
    
    // parent list
    public function Listp($params){
        $data = $this->where("pid",0)->select();
        return $this->recursionData(0,$data);
    }
    // c list
    public function Listz($params){
        $pageSize = isset($params['pageSize']) ? $params['pageSize'] : 10; 
        $page = isset($params['page']) ? $params['page'] : 1;
        $data = $this->where("pid",$params["pid"])->order('create_time', 'desc')->paginate($pageSize, false, ['page' => $page]);
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
   // 递归
    function recursionData($pid,$data) {
        $result = array();
        foreach ($data as $item) {
            if ($item['pid'] == $pid) {
                $item['children'] = $this->recursionData($item['id'], $data);
                $result[] = $item;
            }
        }
        return $result;
    }
}