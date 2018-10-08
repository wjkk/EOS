<?php
namespace app\start_game\controller;

use sms\SmsSingleSender;
use sms\SmsMultiSender;
use sms\SmsVoiceVerifyCodeSender;
use sms\SmsVoicePromptSender;
use sms\SmsStatusPuller;
use sms\SmsMobileStatusPuller;
use think\Controller;
use think\Exception;


class SmsController extends Controller
{
	protected static  $appid = '';
	protected static $appkey = '';
	protected static $templateId = '';
	protected static $smsSign = '';
	public function __construct() {
		parent::__construct();
	}

	public static function sendSms( $phone ,$code ,$time ){

        self::$appid = config('Txy_Sms_Appid')??'';
        self::$appkey = config('Txy_Sms_Appkey')??'';
        self::$templateId = config('Txy_Sms_templateId')??'';
        self::$smsSign = config('Txy_Sms_SmsSign')??'';

		try {
		    $ssender = new SmsSingleSender(  self::$appid , self::$appkey );
		    $params = [ $code , $time ];
		    $result = $ssender->sendWithParam("86", $phone , self::$templateId,
		        $params, self::$smsSign, "", "");  // 签名参数未提供或者为空时，会使用默认签名发送短信
		    $rsp = json_decode($result);
		    return $result;
		} catch(\Exception $e) {
		    echo var_dump($e);
		}
	}

    //test
    /*public function sendSms(  ){
        try {
            $ssender = new SmsSingleSender('1400076327', '8306426d2e702a41b7b2e934b8c4301d');
            $params = [ '111' , '1' ];
            $result = $ssender->sendWithParam("86", '15602260291' ,95864,
                $params, '智汇网络', "", "");  // 签名参数未提供或者为空时，会使用默认签名发送短信
            $rsp = json_decode($result);
            echo $result;
        } catch(\Exception $e) {
            echo 11;
            echo var_dump($e);
        }
    }*/



}


