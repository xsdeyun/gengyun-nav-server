<?php
namespace app\api\controller\nav;

use app\api\model\NavApp as AppModel;

class App extends \app\api\controller\Base
{

    // 定义控制器
    protected $model;

    public function initialize()
    {
        parent::initialize();
        $this->model = new AppModel();
    }
    
    public function hitokoto()
    {
        $data=curl("https://v1.hitokoto.cn/?c=f&encode=json");
        $josn_data=json_decode($data,true);
        return $this->renderSuccess($josn_data,'获取成功！');
    }
    
    public function info()
    {
        $data=$this->model->queryConfig();  
        return $this->renderSuccess($data,'获取成功！');
    }
    
}
