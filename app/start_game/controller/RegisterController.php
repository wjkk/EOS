<?php
namespace app\start_game\controller;

use cmf\controller\HomeBaseController;
use think\Db;

use think\Config;
use wxapi\Wxapi;
use app\start_game\controller\SmsController;
use WxPay\WxPay;
use think\Validate;
use WxPay\Notify;
use think\Session;
use think\Cookie;

// use Qcloud\Sms\SmsSingleSender;
// use Qcloud\Sms\SmsMultiSender;
// use Qcloud\Sms\SmsVoicePromtSender;
// use Qcloud\Sms\SmsVoiceVeriryCodeSender;


use  Qcloud\Sms\SmsMultiSender;
use  Qcloud\Sms\SmsSenderUtil;
use  Qcloud\Sms\SmsSingleSender;


class RegisterController extends HomeBaseController
{

     // 登录
     public function login()
     {
              // 验证参数
            // $validate = new Validate([
            //         'phone'      =>  'require',
            //         'password'  =>   'require',

            //     ]);

            // $validate->message([
            //       'phone.require|phone'  =>  '手机号不能为空',
            //       'password.require'  =>  '密码不能为空',


            //     ]);

                 // exit();
            // if (!$validate->check($data)) {
            //    return json(['msg'=>$validate->getError(),'code'=>40500]);
            // }

            if($this->request->isAjax()){
                $data = input();

                $userInfo = DB::name('register')->where('phone',$data['phone'])->find();

                $data['password'] = $this->sp_password($data['password']);

                if(!$userInfo){
                    return json(['msg'=>'账号不存在','code'=>40500]);
                }
                if($userInfo['status']==0){

                     return json(['msg'=>'你已被拉黑','code'=>40500]);
                }
                if($userInfo['password'] !==$data['password']){

                  return json(['msg'=>'密码不正确','code'=>40500]);
                }

                session_start();
                session('phone',$data['phone']);

                // ini_set(session('phone'), "60");

                $sqlcookie = Db::name('register')->where('phone',$data['phone'])->find();
                // dump($_COOKIE['randcookie'].'--'.$sqlcookie['randcookie']);die;
                if($sqlcookie['randcookie']!=$_COOKIE['randcookie']){
                    $time = time();
                    $randcookie = setcookie("randcookie",$time);
                    Cookie::set('randcookie',$time);
                    // dump($randcookie);
                    // die;
                    Db::name('register')->where('phone',$data['phone'])->update(['randcookie'=>$time]);

                }


              return json(['msg'=>'登录成功','code'=>20000]);
            }

              return $this->fetch(':login');

     }


    // 注册时生成memo，memo对每个用户唯一，用于获取用户的充值信息
    protected function gen_memo($length = 6)
    {
        $chars = array(
            '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
        );
        // 在 $chars 中随机取 $length 个数组元素键名
        $keys = array_rand($chars, $length);
        $memo = '';
        for($i = 0; $i < $length; $i++)
        {
            // 将 $length 个数组元素连接成字符串
            $memo .= $chars[$keys[$i]];
        }
        return $memo;
    }

    protected function make_memo()
    {
        $memo = gen_memo();
        // 检查数据库里这个memo是否已经使用，是的话就重新生成memo
        $user = Db::name('register')->where(['memo'=>$memo])->find();
        while($user) {
            $memo = gen_memo();
            $user = Db::name('register')->where(['memo'=>$memo])->find();
        }
        return $memo;
    }

    /**
     * 注册页面
     * @return [type] [description]
     */
    public function register()
    {


     if($this->request->isPost()){
            $data = input();

            // 验证参数
            // $validate = new Validate([
            //         'phone'      =>  'require',
            //         'password'  =>   'require',
            //         'code'       => 'require',

            //     ]);

            // $validate->message([
            //         'phone.require|phone'  =>  '手机号不能为空',
            //         'password.require'  =>  '密码不能为空',
            //         'code.require'      =>  '验证码不能为空'

            //     ]);
              if( empty($data['phone']) ){
                        return json(['msg'=>'手机号不能为空','code'=>40500]);
                }
                if( empty($data['password']) ){
                        return json(['msg'=>'密码不能为空','code'=>40500]);

                }
                if( empty($data['code']) ){
                        return json(['msg'=>'验证码不能为空','code'=>40500]);

                }

            $data['password'] = $this->sp_password($data['password']);


            // dump(598958);die;
                // exit();
            // if (!$validate->check($data)) {
            //     $this->error($validate->getError(),null,40500);
            // }
                $phone = $data['phone'];
                $cacheCode = cache( $phone.'code' );

                    if( !$cacheCode ){
                        return json(['msg'=>'验证码已失效','code'=>40500]);

                    }
                    if( $cacheCode != $data['code'] ){
                        return json(['msg'=>'验证码错误','code'=>40500]);

                    }

                   unset($data['code']);

            //查询手机号是否已经注册
            $recover = DB::name('register')->where(['phone'=>$data['phone']])->find();

            if($recover){
                return json(['msg'=>'该手机号已注册','code'=>40500]);
            }

            // dump($data['invite_code']);die;
            //邀请码是否为空
            if(!empty($data['invite_code'])){
                $invite_code = Db::name('register')->where('invite_code',$data['invite_code'])->find();
                // dump($invite_code);die;
                if($invite_code){
                    $revive_card = Db::name('register')->where('invite_code',$data['invite_code'])->setInc('revive_card',1);
                    $data['revive_card'] = 1;
                }else{
                 return json(['msg'=>'邀请码无效','code'=>40500]);

                }

            }
            unset($data['invite_code']);
            $data['add_time'] = time();
            $data['head_img'] = '';
            $data['name'] = '';
            $data['memo'] = make_memo();
            // dump($data);die;
            // cmf_compare_password($password, $passwordInDb)
            // $password: string 要比较的密码
            // $passwordInDb: string 数据库保存的已经加密过的密码
            $register = Db::name('register')->insertGetId($data);

            if(!$register){
                return json(['msg'=>'注册失败','code'=>40500]);

            }
                return json(['msg'=>'注册成功','code'=>20000]);


    }


        return $this->fetch(':register');
    }


        /**
         * 忘记密码
         */
        public function forget()
        {
            $data = input();

            // 验证参数
            // $validate = new Validate([
            //         'phone'      =>  'require',
            //         'password'  =>   'require',
            //         'code'       => 'require',

            //     ]);

            // $validate->message([
            //         'phone.require|phone'  =>  '手机号不能为空',
            //         'password.require'  =>  '新密码不能为空',
            //         'code.require'      =>  '验证码不能为空'

            //     ]);



            // // dump(598958);die;
            //     // exit();
            // if (!$validate->check($data)) {
            //     $this->error($validate->getError(),null,40500);
            // }
           if($this->request->isPost()){
             $phone = $data['phone'];
               if( empty($data['phone']) ){
                        return json(['msg'=>'手机号不能为空','code'=>40500]);
                }
                if( empty($data['password']) ){
                        return json(['msg'=>'密码不能为空','code'=>40500]);

                }
                if( empty($data['code']) ){
                        return json(['msg'=>'验证码不能为空','code'=>40500]);

                }
            $cacheCode = cache( $phone.'code' );

                if( !$cacheCode ){
                    return json(['msg'=>'验证码已失效','code'=>40500]);

                }
                if( $cacheCode != $data['code'] ){
                    return json(['msg'=>'验证码错误','code'=>40500]);

                }

            //短信验证通过后，修改密码
            $password = Db::name('register')->where('phone',$data['phone'])->update(['password'=>$this->sp_password($data['password'])]);
            if($password){
                return json(['msg'=>'修改成功','code'=>20000]);
            }
                return json(['msg'=>'修改失败','code'=>40500]);
            }

            return $this->fetch(':reset_pwd');
        }





    /**
     * 发送短信验证码
     */
    public function sendMsg()
    {
        $data = $this->request->post();
        if( empty( $data['phone'] ) ){
        }
        $phone = $data['phone'];
        //还需正则匹配电话
        if( ! preg_match("/^1[123456789]\d{9}$/", $phone )){
                return json(['msg'=>'电话格式不正确','code'=>40500]);
        }

        //判断是否可以发送短信
        //间隔时间
        $jiange = ( config('Txy_Sms_Jiange_Time')??1 )*60;
        //每天最大次数
        $maxNum = config('Txy_Sms_Max_Num')??10;
        $secend = cache( $phone.'secend');
        $day = cache( $phone.date( 'Y-m-d',time() ) );

        if( time() - $secend < $jiange){
            return json(['msg'=>'两次发送间隔不可小于'.$jiange.'秒','code'=>40500]);
        }
        if( $day > $maxNum  ){
             return json(['msg'=>'每天发送次数不可大于'.$maxNum.'次','code'=>40500]);
        }
        //生成验证码
        $code = $this->getCode( 4 );

        $time = config('Txy_Sms_Cache_Time')??2;
        $res  = SmsController::sendSms( $phone , $code , $time );
        $res  = json_decode($res ,true);
        // dump($res);
        if( $res['result'] == 0 ){
            //将验证码缓存
            cache( $phone.'code',$code,$time*3600 );
            cache( $phone.'secend' , time(),3600*24);
            $day = $day??0;
            cache( $phone.date( 'Y-m-d',time() ) , $day+1 );
             return json(['msg'=>'发送成功','code'=>20000]);
        }else{
             return json(['msg'=>'每天发送次数不可大于'.$maxNum.'次','code'=>40500]);
        }
    }



        /**
         * 获取随机字符
         */
        function getCode( $length ,$type = 1)
        {
            $chars = '0123456789';
            if( $type == 2){
                $chars.='abcdefghijklmnopqrstuvwxyz';
            }
            $password = '';

            for ( $i = 0; $i < $length; $i++ )
            {
                $password .= $chars[ mt_rand(0, strlen($chars) - 1) ];
            }

            return $password;
        }
















        /**
         * CMF密码加密方法
         * @param string $pw 要加密的字符串
         * @return string
         */
       public function sp_password($pw,$authcode=''){
            if(empty($authcode)){
                $authcode=config("AUTHCODE");
            }
            $result="###".md5(md5($authcode.$pw));
           // var_dump($result);
            return $result;
        }

        /**
        * CMF密码比较方法,所有涉及密码比较的地方都用这个方法
        * @param string $password 要比较的密码
        * @param string $password_in_db 数据库保存的已经加密过的密码
        * @return boolean 密码相同，返回true
        */
        public function sp_compare_password($password,$password_in_db){
            if(strpos($password_in_db, "###")===0){
                return sp_password($password)==$password_in_db;
            }else{
                return sp_password_old($password)==$password_in_db;
            }
        }

}
