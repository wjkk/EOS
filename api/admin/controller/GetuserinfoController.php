<?php
namespace api\admin\controller;



use think\Controller;

use think\Db;


class GetUserInfoController extends Controller
{
    public function index()
    {
        $appid = "wxe3ff68baccb254bd";
        $secret = "bba9727d9ae59b8f4964bf9d9027c4f5";

        $code = $_GET["code"];

        // 不用关注
        //第一步:取得openid
        $oauth2Url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=$appid&secret=$secret&code=$code&grant_type=authorization_code";
        $oauth2 = $this->getJson($oauth2Url);
        //第二步:根据全局access_token和openid查询用户信息
        $access_token = $oauth2["access_token"];

        $openid = $oauth2['openid'];
        $get_user_info_url = "https://api.weixin.qq.com/sns/userinfo?access_token=$access_token&openid=$openid";
        $userinfo = $this->getJson($get_user_info_url);
        // dump($userinfo);die;

        if(empty($userinfo)){
            $this->error('授权错误');
        }


        $olduser = Db::name('wx_user')->where('openid',$openid)->find();
        if(empty($olduser)){
            //添加用户信息
            $map['add_time'] = time();
            $map['update_time'] = time();
            $map['openid'] = $openid;
            $map['user_name'] = base64_encode(($userinfo['nickname']));
            $map['u_name'] = $this->filterEmoji(($userinfo['nickname']));
            $map['head_img'] = $userinfo['headimgurl'];
            $map['zm_point'] = 10;
            $user = Db::name('wx_user')->insert($map);
            if(!$user){
                $this->error('操作失败');
            }
        }else{

            //更新用户信息
            $map['update_time'] = time();
            $map['openid'] = $openid;
            $map['user_name'] = base64_encode(($userinfo['nickname']));
            $map['u_name'] = $this->filterEmoji(($userinfo['nickname']));
            $map['head_img'] = $userinfo['headimgurl'];
            $user = Db::name('wx_user')->where('openid',$openid)->update($map);
        }
        session_start();

        session('openid',$openid);
        session('id',1);

        $domain = 'https://'.$_SERVER['SERVER_NAME'].'/kol_music/public/index.php/music/index';
        str_replace("\\", '/', $domain);
        $js= <<<eof
            <script>
            window.top.location.href="{$domain}";
            </script>
eof;
    echo $js;

            // $this->success('登录成功',$domain.'/kol_music/public/index.php/portal');

    }

    public  function getJson($url){

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $output = curl_exec($ch);
            curl_close($ch);
            return json_decode($output, true);
            // return $output;
        }

    /**
     * 干掉emoji
     */
    public function filterEmoji($str)
    {
     $str = preg_replace_callback(
       '/./u',
       function (array $match) {
        return strlen($match[0]) >= 4 ? '' : $match[0];
       },
       $str);

      return $str;
     }



}