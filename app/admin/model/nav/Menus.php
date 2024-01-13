<?php

declare (strict_types=1);

namespace app\admin\model\nav;
use app\admin\model\Login as LoginModel;
use think\Model;
/**
 * 导航模型
 * Class Menus
 * @package app\store\model
 */
class Menus extends Model
{
    
    protected $table = 'gy_nav_menus';
    protected $pk = 'id';


    public function getVisitAll()
    {  
        $menus = $this->where('visit',"all")->select()->toArray();
        return  $menus;
    }
    // 列表
    public function List(){
        $data = $this->order('pid', 'asc')->order('sort', 'asc')->select()->toArray();
        return  $this->recursionData(0,$data);
    }
    
    // 新增
    public function Add($post){
        $loginName=LoginModel::getLoginName();
        $post['create_time']=date('Y-m-d H:i:s');
        $post['create_by']=$loginName;
        $data = $this->save($post);
        return  $data;
    }
    
    // 编辑
    public function Edit($post){
        $loginName=LoginModel::getLoginName();
        $post['update_time']=date('Y-m-d H:i:s');
        $post['update_by']=$loginName;
        $data = $this->update($post);
        return  $data;
    }
    
    
      // 菜单递归
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
    
    // 数量查询
    public function Total(){
        $number = $this->count();
        return  $number;
    }
    
}