<?php

declare (strict_types=1);
namespace app\admin\model\nav;
use app\admin\model\Login as LoginModel;
use think\Model;
/**
 * 模块模型
 * Class Config
 * @package app\admin\model
 */
 class Config extends Model
{
    
    protected $table = 'gy_nav_config';
    
    // 新增
    public function Add($post){
        $loginName = LoginModel::getLoginName();
        $post['create_time'] = date('Y-m-d H:i:s');
        $post['create_by'] = $loginName;
        $data = $this->where('id',1)->save($post);
        return  $data;
    }
    
    // 列表
    public function finds(){
        // 浏览量增加
        $this->where('id', 1)->inc('views')->update();
        // 数据查询
        $data = $this->where('id',1)->select()->toArray();
        return $data;
    }
    
    // 数量查询
    public function Views(){
        $number = $this->where('id',1)->value('views');
        return  $number;
    }
    
}