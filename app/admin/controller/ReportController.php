<?php
/**
 * @Author: Marte
 * @Date:   2018-07-28 11:30:46
 * @Last Modified by:   Marte
 * @Last Modified time: 2018-09-10 13:16:36
 */

namespace app\admin\controller;


use cmf\controller\AdminBaseController;
use think\Db;
use think\Config;


class ReportController extends AdminBaseController
{


    public function index()
    {

        $param = $this->request->param();

        //搜索
        //$keyword = str_replace(PHP_EOL, '', $param['keyword'])??'';
        
        $keyword = $param['keyword']??'';
        $start_time = !empty($param['start_time']) ? $param['start_time'] : 0;
        $end_time = !empty($param['start_time']) ? $param['start_time'] : strtotime('2037-12-12');

            $order = Db::name('wx_user')
            ->where( 'add_time','<=', $end_time )
            ->where( 'add_time','>=', $start_time)
            ->where( "u_name|invite_code",'like',"%{$keyword}%" )
            ->order( 'add_time desc' )
            ->paginate(2,null,['query'=>$param]); 
             $page = $order ->render();
              $order = $order ->toArray()['data'];
     
    
            $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
            $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
            $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
            $this->assign('order', $order);
            $this->assign('page', $page);
            return $this->fetch();
    }

    //绑定邀请码
    public function invite_code()
    {
        $data = input();

        //先查询该邀请码是否被绑定
        $user = Db::name('wx_user')->where('id',$data['id'])->find();
        $code = Db::name('invite_code')->where('is_del',0)->where('code',$data['invite_code'])->find();
        // dump($code);die;
        if(!$user){
            $this->error('用户不存在');
        }
        if(!empty($user['invite_code'])){
            $this->error('该用户已绑定邀请码');
        }
        if(!$code){
            $this->error('邀请码无效');
        }
        if($code['status']==1){
            $this->error('邀请码已绑定');
        }



        $invite_code = Db::name('wx_user')->where('id',$data['id'])->update(['invite_code'=>$data['invite_code']]);
        DB::name('invite_code')->where('code',$data['invite_code'])->update(['status'=>1]);

        if($invite_code){

            $this->success('绑定成功');
        }

        $this->error('绑定失败');

    }

    //解除绑定
    public function binding()
    {
        $data = input();
        // dump($data);
        //先查询该邀请码是否被绑定
        $user = Db::name('wx_user')->where('id',$data['id'])->find();

        // dump($user['invite_code']);
        if(!$user){
            $this->error('用户不存在');
        }

        if (empty($user['invite_code'])) {
             $this->error('用户没有绑定邀请码');
        }


        $invite_code = Db::name('wx_user')->where('id',$data['id'])->update(['invite_code'=>'']);
        $code = Db::name('invite_code')->where('code',$user['invite_code'])->update(['status'=>0]);
        if($invite_code){

            $this->success('解绑成功');
        }

        $this->error('解绑失败');
    }



}