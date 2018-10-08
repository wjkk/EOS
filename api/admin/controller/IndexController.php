<?php

namespace api\admin\controller;



use think\Controller;
use think\Db;



class IndexController extends Controller

{

    public function __construct(){

        parent::__construct();

    }



    public function index()
    {
        //获取价格
        $price = Db::name('price')->where('is_del',0)->field('id,price')->select()->toArray();
        // $ip = $this->get_client_ip();


        // //判断用户登录状态
        // if(empty(Cache::get('phone'))){
        //     $this->error('请登录');
        // }

        $data = input();


        $this->success('获取成功',null,$price);
    }


    public function buy()
    {
        $data = input();

        $data['add_time'] = time();
        $user_buy = Db::name('user_buy')->insertGetId($data);

        if(!$user_buy){
            $this->error('购买失败');
        }
        $order_num =  $this->order_num(8);

        $this->success('购买成功',null,$order_num);


    }



    //获取ip地址
    public function get_client_ip()
    {
        if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
            $ip = getenv('HTTP_CLIENT_IP');
        } elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
            $ip = getenv('HTTP_X_FORWARDED_FOR');
        } elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
            $ip = getenv('REMOTE_ADDR');
        } elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return preg_match ( '/[\d\.]{7,15}/', $ip, $matches ) ? $matches [0] : '';
    }

    //不同环境下获取真实的IP
    public function get_ip(){
    //判断服务器是否允许$_SERVER
    if(isset($_SERVER)){
        if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
            $realip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        }elseif(isset($_SERVER['HTTP_CLIENT_IP'])) {
            $realip = $_SERVER['HTTP_CLIENT_IP'];
        }else{
            $realip = $_SERVER['REMOTE_ADDR'];
        }
    }else{
        //不允许就使用getenv获取
        if(getenv("HTTP_X_FORWARDED_FOR")){
              $realip = getenv( "HTTP_X_FORWARDED_FOR");
        }elseif(getenv("HTTP_CLIENT_IP")) {
              $realip = getenv("HTTP_CLIENT_IP");
        }else{
              $realip = getenv("REMOTE_ADDR");
        }
    }

    return $realip;
}


        //随机生成订单号码
    public function order_num($length = 8 )
    {
            // 密码字符集，可任意添加你需要的字符
            $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
            $password = "";
            for ( $i = 0; $i < $length; $i++ )
            {
            // 这里提供两种字符获取方式
            // 第一种是使用 substr 截取$chars中的任意一位字符；
            // 第二种是取字符数组 $chars 的任意元素
            // $password .= substr($chars, mt_rand(0, strlen($chars) – 1), 1);
                $password .= $chars[ mt_rand(0, strlen($chars) - 1) ];
            }
            md5($password);
            // $password = $this->password($password,'E');
            // $this->success('生成成功',null,$password);
            return $password;

    }







}

