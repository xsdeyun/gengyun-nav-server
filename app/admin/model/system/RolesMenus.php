<?php

declare (strict_types=1);

namespace app\admin\model\system;
use think\Model;
use app\admin\model\Login as LoginModel;
/**
 * 角色菜单模块模型
 * Class RolesMenus
 * @package app\admin\model
 */
class RolesMenus extends Model
{
    protected $table = 'gy_admin_roles_menus';
    
    public function getIdRoles($params){
        $id = $params['id'];
        // $data = $this->alias('t1')->Join('unt_admin_menus t2', "t1.menu_id = t2.id AND t2.type=1")
        // ->where('t1.role_id', $id)->field('role_id,menu_id')->select();
        $data = $this->where('role_id', $id)->field('role_id,menu_id')->select();
        return $data;
    }
    
    public function updateIdRoles($params){
        $LoginModel=new LoginModel;
        $roleId = $params['role_id'];
        $this->where('role_id',$roleId)->delete();
        $ids = $params['ids'];
        $data = [];
        foreach ($ids as $menuId) {
            $data[] = ['role_id' => $roleId, 'menu_id' => $menuId];
        }
        $s=$this->insertAll($data);
        $p=$LoginModel->setLoginPermissions();
        return $s;
    }

}