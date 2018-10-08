<?php
namespace app\start_game\controller;

use cmf\controller\HomeBaseController;
use think\Db;

use think\Config;
use wxapi\Wxapi;
use think\Validate;
use think\Session;
use think\Controller;

class GoldController extends HomeBaseController
{

  
    /*
     * 答题奖金
     */
    public function answerGold()
    {
            $this->randcookie();

            $data =input();   

            $page = !empty( $data['page'] )? $data['page'] :1;
            $pageSize = !empty( $data['pageSize'] )? $data['pageSize'] :4;

            $returnData = Db::name('activity')->field('id,eth,a_name,stime')->order('stime desc')->page($page,$pageSize)->select()->toArray();

            foreach($returnData as $k => $v){
                $returnData[$k]['stime'] = date('Y.m.d H:i',$v['stime']);
                $lengths  = mb_strlen( $v['a_name'] );
                if($lengths>11){
                   $returnData[$k]['a_name'] = mb_substr($v['a_name'],0,10,'utf-8').'..';
                }
               //  if($v['eth']>10000){
               //      $returnData[$k]['eth'] =round($v['eth']/10000,2).'W';
               // }
            }
           
            if(!$returnData){
                return json (['code'=>40500,'msg'=>'暂无活动']);
            }


            return json([
                'code'  =>  20000,
                'msg'   =>  '获取成功',
                'data'  =>  $returnData
            ]);
      



    }

    /**
     * 领取记录
     */
     public function userReceive()
    {
        $this->randcookie();

        if($this->request->isAjax()){
            $data = input();
            // $page = !empty( $data['page'] )? $data['page'] :1;
            // $pageSize = !empty( $data['pageSize'] )? $data['pageSize'] :10;

            $user = Db::name('challenge')
                    ->alias('a')
                    ->join('activity b','a.aid=b.id')
                    // ->join('register c','c.phone=a.phone')
                    // ->where(['a.phone'=>Session('phone')])
                    ->field('b.a_name,a.phone,a.eth,a.add_time,a.status')
                    ->where('a.status',1)
                    ->where('a.phone',session('phone'))
                    ->order('a.add_time')
                    // ->page($page,$pageSize)
                    ->select()
                    ->toArray();

            foreach($user as $k => $v){
                $user[$k]['add_time'] = date('Y/m/d',$v['add_time']);
                $user[$k]['sort'] = $k+1;
                if(empty($v['eth'])){
                    $user[$k]['eth'] = '暂未结算';
                }
                $lengths  = mb_strlen( $v['a_name'] );
                if($lengths>8){
                   $user[$k]['a_name'] = mb_substr($v['a_name'],0,7,'utf-8').'..';
                }
            }

            return json([
                'code'  =>  20000,
                'msg'   =>  '获取成功',
                'data'  =>  $user
            ]);

        }

        return $this->fetch(':bonus');
         

    }


}
