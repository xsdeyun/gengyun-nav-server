<?php

declare (strict_types=1);

namespace app\admin\model\system;
use app\admin\model\Login as LoginModel;
use think\Model;
use think\facade\Url;
/**
 * 文件上传模块模型
 * Class Upload 
 * @package app\admin\model
 */
class Upload extends Model
{
    protected $table = 'gy_admin_files';
    protected $pk = 'id';
    
    public function addImage($files){
        $loginName=LoginModel::getLoginName();
        $data = [
            'module'=>$files['module'],
            'type'=>$files['type'],
            'name' => $files['name'],
            'original_name' => $files['original_name'],
            'url' => $files['url'],
            'size' => $files['size'],
            'create_by'=>$loginName,
            'create_time' => date('Y-m-d H:i:s'),
        ];
        $id=$this->insertGetId($data);
        return $this->getIdimage($id);
    }
    
    public function getIdimage($id){
        $data=$this->where('id',$id)->filter(function($u) {
              $u['url'] = uploads_url().$u['url'];
              return $u;
             })->select();
        return $data;
    }
    
}