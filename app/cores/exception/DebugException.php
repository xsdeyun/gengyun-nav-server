<?php

declare (strict_types=1);

namespace app\cores\exception;

/**
 * 自定义异常类：调试输出
 * Class DebugException
 * @package cores\exception
 */
class DebugException extends BaseException
{
    // 附加的数据
    public $extend = [];

    /**
     * 构造函数，接收一个关联数组
     * @param array $params 关联数组只应包含status、msg、data，且不应该是空值
     * @param mixed $debug 调试输出的数据
     */
    public function __construct(array $params = [], $debug = null)
    {
        parent::__construct($params);
        $this->status = config('status.success');
        $this->message = '-- 调试输出 --';
        $this->extend = ['debug' => $debug];
    }
}

