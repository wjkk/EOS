<?php

namespace api\admin\controller;



use think\Controller;

use api\admin\controller\WxController;

use think\Db;



class PublicController extends WxController

{

    public function index(){



    }

    // 登录验证提交

    public function dologin(){

        $data = $this->request->param();
                //$data['code']?$data['code']:'';
        $code =  $data['code']??'';/*获取前端传过来的code*/

        if( !$code ){

            $this->error( '必要参数不能为空' );

        }



        $res_wx = $this->send_url(['code'=>$code],config('C_APPID'),config('C_APPSECRET'));/*调用微信接口用code获取openid和unionid*/

        $res_wx = json_decode($res_wx,true);

        if(isset($res_wx['errcode']))   {

            $this->error('code失效');

        }



        $post_data['openid'] = $res_wx['openid']??'';

        $post_data['session_key'] = $res_wx['session_key']??'';

        $post_data['unionid'] = $res_wx['unionid'] ?? '';

	$post_data['add_time'] = time();




        if( !$post_data['openid'] ){

            $this->error('openid为空');

        }



        //检查用户是否存在    通过appid区分小程序

        $user_info = Db::name('WxUser')->field('id,user_name,head_img')->where("openid",$post_data['openid'])->find();

//dump($user_info);die;
        //只储存openid

        //不存在则创建

        if( !$user_info['id'] ){

            $last_id = Db::name('WxUser')->insertGetId($post_data);

        }else{

            //更新session_key

            Db::name('WxUser')->update( [ 'id'=>$user_info['id'],'update_time'=>time(),'session_key'=>$res_wx['session_key'] ] );

            $last_id = $user_info['id'];

        }

        $token = md5( $post_data['openid'].$last_id.time().microtime() );

        //设置登录信息

        $post_data['user_id'] = $last_id;

        cache($token,$post_data,86400*7);



        $this->success('登陆成功！', null,['token'=>$token,'user_name'=>base64_decode($user_info['user_name'])??'','head_img'=>$user_info['head_img']??'',]);

    }







}

