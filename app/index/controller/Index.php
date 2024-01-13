<?php
namespace app\index\controller;
use think\facade\View;
use app\BaseController;

class Index extends Base
{
    public function index()
    {
       return redirect('/web');
    }
    
    public function admin()
    {
       return redirect('/houTai');
    }
}
