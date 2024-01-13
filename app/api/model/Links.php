<?php

declare (strict_types=1);

namespace app\api\model;
use think\Model;

/**
 * 链接模型
 * Class apiLinks
 * @package app\api\model
 */
class Links extends Model
{
    protected $table = 'gy_nav_links';
    protected $pk = 'id';
   
    // 列表
    public function List(){
        $links=$this->order('sort', 'asc')->select()->toArray();
        return $this->createLinks($links);
        
    }
    // id links
    public function getIdList($params){
        $links=$this->where('menu_id',$params['id'])->order('sort', 'asc')->select()->toArray();
        return $links;
    }
    
    public function getValList($params){
        $keyword=$params['keywords'];
        $links=$this->where('name','like',"%{$keyword}%")->order('sort', 'asc')->select()->toArray();
        return $links;
    }
    
    function createLinks($links)
    {
        $result = [];
        foreach ($links as $link) {
            $menuIds = array_map('intval', explode(',', $link['menu_id']));
            foreach ($menuIds as $menuId) {
                $result[$menuId][] = $link;
            }
        }
        return $result;
    }
}