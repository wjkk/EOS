<?php
// +----------------------------------------------------------------------
// | 订单列表
// +----------------------------------------------------------------------
// | Author: donghua <cdh10086@qq.com>
// +----------------------------------------------------------------------
namespace api\admin\controller;

use WxPay\Notify;
use think\Controller;
use think\Validate;
use think\Db;


class  PaycallbackController extends Controller
{

    protected $ordersModel ;
    public function _initialize()
    {
        parent::_initialize();
        $this->ordersModel = db('order');
        // dump($this);exit;
    }

    public function OrderChange() {
        dump(123);die;
        \Think\Log::write("微信支付回调开始",'','','./WXpaylog/Callback'.date('y_m_d').'.log');
        $notify = new Notify();
        $notify -> notifySet();
        \Think\Log::write("微信支付回调结束",'','','./WXpaylog/Callback'.date('y_m_d').'.log');
        // dump(4511);
    }

}
