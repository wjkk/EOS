<?php
namespace app\start_game\controller;

use cmf\controller\HomeBaseController;
use think\Db;

use think\Config;
use wxapi\Wxapi;

use WxPay\WxPay;

use WxPay\Notify;
use think\Session;

class RankingController extends HomeBaseController
{

    /**
     * 排行榜
     * @return [type] [description]
     */
    public function index()
    {

            $this->randcookie();

            $field = 'id,name,head_img,eth,phone';
            $user = Db::name('register')->where('phone',Session('phone'))->where('status',1)->field($field)->find();
            if(empty($user['name'])){
                $user['name'] = '游客';
            }else{
                $user['name'] = $user['u_name'];
            }
            if(empty($user['head_img'])){
                $user['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/static/images/headicon.png';
            }else{
                $user['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/upload/'.$user['head_img'];

            }



            $o_user = Db::name('register')->field($field)->order('eth desc')->where('status',1)->limit(200)->select()->toArray();

            // dump($o_user);die;
            foreach ($o_user as $k => $v) {

                if($user['phone']==$v['phone']){
                    $user['sort'] = $k+1;
                    // dump($user['sort']);die;
                }

            }
            $this->assign('user',$user);
            $this->assign('o_user',$o_user);

            


        return $this->fetch(':ranking');

    }

    public function info()
    {
            
            $this->randcookie();
            $data = input();

            $field = 'id,name,head_img,eth,phone';

            $page = !empty( $data['page'] )? $data['page'] :1;
            $pageSize = !empty( $data['pageSize'] )? $data['pageSize'] :9;

            $o_user = Db::name('register')->field($field)->order('eth desc')->where('status',1)->page($page,$pageSize)->select()->toArray();


            foreach ($o_user as $k => $v) {
                
                $o_user[$k]['sort'] = ($page-1)*$pageSize+$k+1;



                if(empty($v['name'])){
                    $o_user[$k]['name'] = '暂未设置';
                }else{
                $o_user[$k]['name'] = json_decode($v['name']);
                // $lengths  = mb_strlen(json_decode($v['name']));
                // if($lengths>3){
                //    $o_user[$k]['name'] = mb_substr(json_decode($v['name']),0,3).'..';
                // }

                }

                    if(empty($v['head_img'])){
                    $o_user[$k]['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/static/images/headicon.png';
                }else{
                    $o_user[$k]['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/upload/'.$v['head_img'];

                }

     }

            return json(['code'=>20000,'msg'=>'获取成功','o_user'=>$o_user]);



}

}