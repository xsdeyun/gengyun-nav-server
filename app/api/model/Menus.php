<?php

declare (strict_types=1);

namespace app\api\model;
use think\Model;
/**
 * 菜单模型
 * Class apiMenus
 * @package app\api\model
 */
class Menus extends Model
{
    
    protected $table = 'gy_nav_menus';
    protected $pk = 'id';

    
    // 列表
    public function List(){
        $data = $this->order('pid', 'asc')->order('sort', 'asc')->select()->toArray();
        return  $this->recursionData(0,$data);
    }
    
    
      // 菜单递归
    function recursionData($pid,$data) {
        $result = array();
        foreach ($data as $item) {
            if ($item['pid'] == $pid) {
                $item['children'] = $this->recursionData($item['id'], $data);
                if($item['pid']==0){
                   $item['tip_id']=count($item['children'])>0?$item['children'][0]['id']:$item['id'];
                }
                $result[] = $item;
            }
        }
        return $result;
    }
    
}