<?php

namespace app\common\middleware;

use think\facade\Cache;
use think\facade\Request;


class CheckIPReq
{
    public function handle($request, \Closure $next)
    {
        $ip = Request::ip();

        $key = 'ip:' . $ip;
    
        // 获取当前IP的请求记录
        $requests = Cache::get($key, []);
    
        // 添加当前请求时间到请求记录数组
        $requests[] = time();
    
        // 只保留一分钟内的请求记录
        $requests = array_filter($requests, function ($timestamp) {
            return $timestamp >= time() - 60;
        });
    
        // 更新缓存中的请求记录
        Cache::set($key, $requests, 60);
    
        // 如果请求次数超过100次，则禁用该IP
        if (count($requests) > 100) {
            throwError('请求过于频繁！');
        }

        return $next($request);
    }
    
}
?>