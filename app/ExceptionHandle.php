<?php
namespace app;

use think\response\Json;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\Handle;
use think\exception\HttpException;
use think\exception\HttpResponseException;
use think\exception\ValidateException;
use think\Response;
use app\cores\exception\BaseException;
use Throwable;

/**
 * 应用异常处理类
 */
class ExceptionHandle extends Handle
{
     // 状态码
    private int $status = 200;

    // 错误信息
    private string $message;

    // 附加数据
    public array $data = [];
    /**
     * 不需要记录信息（日志）的异常类列表
     * @var array
     */
    protected $ignoreReport = [
        HttpException::class,
        HttpResponseException::class,
        ModelNotFoundException::class,
        DataNotFoundException::class,
        ValidateException::class,
    ];

    /**
     * 记录异常信息（包括日志或者其它方式记录）
     *
     * @access public
     * @param  Throwable $exception
     * @return void
     */
    public function report(Throwable $exception): void
    {
        // 使用内置的方式记录异常日志
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @access public
     * @param \think\Request   $request
     * @param Throwable $e
     * @return Response
     */
    public function render($request, Throwable $e): Response
    {
        if ($e instanceof HttpResponseException) {
            return $e->getResponse();
        }
        // 手动触发的异常 BaseException
        if ($e instanceof BaseException) {
            $this->status = $e->status;
            $this->message = $e->message;
            $this->data = $e->data;
            $extend = property_exists($e, 'extend') ? $e->extend : [];
            return $this->output($extend);
        }
        // 系统运行的异常
        $this->status = config('status.error');
        $this->message = $e->getMessage() ?: '很抱歉，服务器内部错误';
        return $this->output();
    }

    /**
     * 返回json格式数据
     * @param array $extend 扩展的数据
     * @return Json
     */
    private function output(array $extend = []): Json
    {
        $jsonData = ['message' => $this->message, 'code' => $this->status, 'data' => $this->data];
        return json(array_merge($jsonData, $extend));
    }
}
