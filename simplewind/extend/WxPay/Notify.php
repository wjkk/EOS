<?php
namespace Wxpay;

use Think\Exception;
use WxPay\WxPay;
use think\Controller;
use think\Db;
/**
 * author  universe.h
 */
class Notify{

    protected  $postStr;

    protected  $xml_arr;
    public function __construct()
    {
        $this->postStr = file_get_contents("php://input");
        $this->xml_arr = array(
            'return_code' => 'SUCCESS',
            'return_msg' => ''
        );
    }
    public function notifySet(){
        try {
            if (empty($this->postStr)) {
                \Think\Log::write('无数据返回','','','./WXpaylog/Callback'.date('y_m_d').'.log');
                exception('无数据返回', 40500);
            }
            $postdata = json_decode(json_encode(simplexml_load_string($this->postStr, 'SimpleXMLElement', LIBXML_NOCDATA)), true);


            $postStr = json_encode($postdata);
 


      $aa =  [
            'wxpay_appid'       => 'wxe3ff68baccb254bd',
            'wxpay_appsecret'   => 'bba9727d9ae59b8f4964bf9d9027c4f5',

            //商户
            'wxpay_key'         => 'zhihuiyun324234234533zhihuiyun32',
            'wxpay_mchid'       => '1487037072',
        ];

            $wxsign = $postdata['sign'];
            unset($postdata['sign']);

            $wxpay = new Wxpay($aa);
            $sign = $wxpay->getSign($postdata);

              // file_put_contents('aaa.txt',  json_encode($sign));
              
            if ($wxsign != $sign) {
                \Think\Log::write('签名验证失败 data:'.$postStr,'','','./WXpaylog/Callback'.date('y_m_d').'.log');
                exception('签名验证失败', 40500);
                
            }


            if ($postdata['return_code'] != 'SUCCESS') {
                \Think\Log::write('支付失败 data:'.$postStr,'','','./WXpaylog/Callback'.date('y_m_d').'.log');
                exception('交易失败', 40500);
            }

            if ($postdata['result_code'] != 'SUCCESS') {
                \Think\Log::write('支付失败 data:'.$postStr,'','','./WXpaylog/Callback'.date('y_m_d').'.log');
                exception('交易失败', 40500);
            }

            $result = $wxpay->orderQuery($postdata);
            if(!array_key_exists("return_code", $result)
                || !array_key_exists("result_code", $result)
                || $result["return_code"] != "SUCCESS"
                || $result["result_code"] != "SUCCESS")
            {
                \Think\Log::write('订单异常','','','./WXpaylog/abnormal'.date('y_m_d').'.log');

                exception('交易失败', 40500);
            }

            $str = substr($postdata['out_trade_no'],0,2);

            call_user_func_array(array(&$this, $str.'update'),array($postdata) );

        } catch (Exception $e) {
            $this->xml_arr['return_code'] = 'FAIL';
            $this->xml_arr['return_msg'] = $e->getMessage();
        }

        $xml = "<xml>";
        foreach ($this->xml_arr as $key => $val) {
            if (is_numeric($val)) {
                $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
            } else
                $xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
        }
        $xml .= "</xml>";

        echo $xml;
        exit();
    }


    public function MUupdate($data){
     $aas = db('order')->where(['order_code'=>$data['out_trade_no']])->update(['status'=>2,'pay_time'=>time()]);
    // dump($into);die;

    }



}