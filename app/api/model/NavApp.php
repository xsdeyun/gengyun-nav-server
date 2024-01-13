<?php

declare (strict_types=1);

namespace app\api\model;
use think\Model;

/**
 * 关键词模型
 * Class apiLinks
 * @package app\api\model
 */
class NavApp extends Model
{
    protected $table = 'gy_nav_config';
    protected $pk = 'id';
   
    
    public function queryConfig()
    {
        $data = $this->where('id',1)->find()->toArray();
        return $data;
    }
    
}