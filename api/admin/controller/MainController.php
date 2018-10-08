<?php

namespace api\admin\controller;



use think\Controller;

use think\Db;

class MainController extends Controller

{


    /**
     * 授权登录
     */

    public function index()
    {

        $appid='wxe3ff68baccb254bd';

        // if( empty(session('id')) || empty(session('openid')) ){

            $redirect_uri = urlencode ( 'http://xcx.kh.gzzh.ren/kol_music/public/api/index.php/admin/Getuserinfo/index' );

            //不用关注公众号，但是要授权
            $url ="https://open.weixin.qq.com/connect/oauth2/authorize?appid=$appid&redirect_uri=$redirect_uri&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect";
            header("Location:".$url);
        // }

        // $userInfo = M('wc_user')->where('openid',session('openid')])->field('head_img,id,nick_name,openid')->find();
        // $userInfo['nick_name'] = base64_decode($userInfo['nick_name']);
        // $this->assign('userInfo',$userInfo);
        // unset($_SESSION['openid']);
        // $this->success('获取成功！', null,$user_Info);
    }


        //清空用户投票数据
        public function clear()
        {
            $add_time = time();
            $vote_num = Db::name('vote')->where('add_time','<',$add_time)->update(['vote_num'=>0]);

            $user = Db::name('wx_user')->where('zm_point','<',config('zm_point'))->undate(['zm_point',config('zm_point')]);
        }










}

