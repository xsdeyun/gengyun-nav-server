<?php

declare (strict_types=1);

namespace app\admin\model\system;
use app\admin\model\Login as LoginModel;
use think\Model;
/**
 * 菜单模型
 * Class Menus
 * @package app\store\model
 */
class Menus extends Model
{
    
    protected $table = 'gy_admin_menus';
    protected $pk = 'id';


    public function getVisitAll()
    {  
        $menus = $this->where('visit',"all")->select()->toArray();
        return  $menus;
    }
    // 列表
    public function List(){
        $data = $this->order('pid', 'asc')->order('sort', 'asc')->select()->toArray();
        return  $this->recursionMenusData(0,$data);
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
    
    // 角色菜单
    public function getRolesMenus(int $id){
        $data = $this->alias('t1')
                ->Join('gy_admin_roles_menus t2', "t2.role_id = $id AND t2.menu_id = t1.id")
                ->order('pid', 'asc')
                ->order('sort', 'asc')
                ->select();
        return  $this->recursionRolesMenus(0,$data);
    }
    
    // 角色按钮权限
    public function getPermissions(int $id){
        $data = $this->alias('t1')
                ->Join('gy_admin_roles_menus t2', "t2.role_id = $id AND t2.menu_id = t1.id AND t1.type = 2")
                ->order('pid', 'asc')
                ->order('sort', 'asc')
                ->column('t1.permission');
        return  $data;
    }
    
    // 菜单递归
    function recursionMenusData($pid, $data) {
        $result = array();
        foreach ($data as $item) {
            if ($item['pid'] == $pid) {
                $item['children'] = $this->recursionMenusData($item['id'], $data);
                $result[] = $item;
            }
        }
        return $result;
    }
    
    // 菜单递归
    function recursionRolesMenus($pid, $data) {
        $result = array();
        foreach ($data as $item) {
            if ($item['pid'] == $pid && $item['type']!=2) {
                $item['children'] = $this->recursionRolesMenus($item['id'], $data);
                $result[] = $item;
            }
        }
        return $result;
    }
    
}