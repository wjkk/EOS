<?php
namespace app\start_game\controller;

use cmf\controller\HomeBaseController;
use think\Db;

use think\Config;
use wxapi\Wxapi;
use think\Validate;
use think\Session;
use think\Controller;
use think\Cookie;

class QuestionsController extends HomeBaseController
{


    /*
     * 首页接口 活动显示
     */
    public function getGlobalInfo()
    {


        $this->randcookie();

            $returnData = Db::name('activity')->where('status',1)->order('stime desc')->find();

            if($returnData){
                $returnData['stime']  = date('H:i',$returnData['stime']);
            }
            // dump($returnData);


        $this->assign('rule',config('rule'));


        $this->assign('data',$returnData);

        return $this->fetch(':home');

    }



   /**
     * 挑战答题
     *获取每局游戏的标识
    */
    public function getGameFlag()
    {

        $this->randcookie();

        return $this->fetch(':answer');

    }

    /**
     * 判断答题卡
     * @return [type] [description]
     */
    public function answerCard()
    {
            $this->randcookie();

            $data = input();
            //活动id
            $activity = Db::name('activity')->where('status',1)->find();
            $time = time();

            if(empty($activity)){

                return json(['code'=>40500,'msg'=>'暂无活动']);
            }
            if($activity['etime']<$time || $activity['stime']>$time){

                return json(['code'=>40500,'msg'=>'不在活动时间内']);

            }

                    //查询题库
            $num = config('q_num')??10;
            // dump($num);
            $questModel = Db::name('questions');
            //获取题库数量
            $quesAmount = $questModel->where([ 'is_del'=>0])->count();

                if ( $quesAmount < config('q_num') ) {
                     return json ( [
                        'code'  => 40500,
                        'msg'   => '题目数量不足',
                    ]);
                }


            //插入挑战数据
            $map['phone'] = session('phone');
            $map['stime'] = time();
            $map['add_time'] = time();
            $map['aid'] = $activity['id'];

            $challenge = Db::name('challenge')->insertGetId($map);

            if(!$challenge){
                return json(['code'=>40500,'msg'=>'网络异常']);
            }

            $user = Db::name('register')->where(['phone'=>Session('phone')])->find();

            if($user['answer_card']<=0){

                return json ( [
                        'code'  => 40500,
                        'msg'   => '答题卡不足',
                    ]);

            }else{
                return json ( [
                        'code'  => 20000,
                        'msg'   => '答题卡充足',
                        'answer_card' =>$user['answer_card'],
                        'cid' => $challenge
                    ]);
            }



    }

    /**
     * 开始游戏 获取题库
     */
    public function startGame()
    {
        $this->randcookie();

        $data = input();

        if(empty($data['cid'])){
            $this->error('数据异常',null,40500,1);
        }

        $a= Db::name('challenge')->where('id',$data['cid'])->find();

        if($a['status']===0 || $a['status']===1){
            return json(['code'=>40500,'msg'=>'该挑战记录已有结果']);
        }


        //用户头像
        $user = Db::name('register')->where('phone',session('phone'))->find();
        //活动id
        $activity = Db::name('activity')->where('status',1)->find();


        //查询题库
        $num = config('q_num')??10;
        // dump($num);
        $questModel = Db::name('questions');
        //获取题库数量
        $quesAmount = $questModel->where([ 'is_del'=>0])->count();

            if ( $quesAmount < $num ) {
                 return json ( [
                    'code'  => 40500,
                    'msg'   => '题目数量不足',
                ]);
            }



         //随机获取题目数量
        $list = Db::name('questions')->field('id')->where('is_del',0)->select()->toArray();
        $count = count($list);
        $rand_list=range(0, $count-1);
        unset($rand_list[0]);
        $q_num = config('q_num')??10;
        $rand_list = array_rand($rand_list,$q_num);

        $tuijian_array = array();
        foreach ((array)$rand_list as $key) {
            $tuijian_array[] = $list[$key];
        }
        $randArr = Db::name('questions')->where('id','in',$rand_list)->field('quiz,id,options,contributor')->select();
        // $cid = $challenge;

        $rand['questions'] = $randArr;
        $rand['explain'] = array(0=>config('rule6'),1=>config('rule7'));
        $rand['cid']  = $data['cid'];
        $rand['remarks'] = '本题库由以太币提供';
        // $rand['name']  = json_decode($user['name']);

            if(empty($user['name'])){
            $rand['name'] = '猪队友';
        }else{
            $rand['name'] = json_decode($user['name']);

        }
            if(empty($user['head_img'])){
            $rand['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/static/images/headicon.png';
        }else{
            $rand['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/upload/'.$user['head_img'];

        }


        if(!$randArr){
                return json ( [
                'code'      => 40500,
                'msg'       => '数据异常',
                'data'    => $randArr,
            ]);
        }

         return json ( [

                'code'      => 20000,
                'msg'       => '获取成功',
                'data'    => $rand,
            ]);




    }

    /**
     * 判断用户每题提交的答案
     */
    public function  userAnswer()
    {
        $this->randcookie();

        $data = input();
        // dump($data);
        //查询答案
        $answer = Db::name('questions')->where('id',$data['id'])->value('answer');

        $activity = Db::name('activity')->where('status',1)->find();

        //答对
        if($data['answer'] == $answer){
                //答对题数加一
                $user_challenge = Db::name('challenge')->where('id',$data['cid'])->setInc('user_num',1);

                return json ( [
                'code'  => 20000,
                'msg'   => '对的',
            ]);
        }


        return json ( [
                'code'  => 40500,
                'msg'   => '错的',
                // 'answer' => $answer,
            ]);


    }

    /**
     * 使用复活卡
     */
    public function receive()
    {
        $data = input();
        $this->randcookie();

            //判断用户复活卡是否充足
            $user = Db::name('register')->where('phone',Session('phone'))->find();

            if($user['revive_card']==0){

                return json ( [
                        'code'  => 40500,
                        'msg'   => '复活卡不足',
                    ]);
            }

        //活动限制的复活次数
        $activity = Db::name('activity')->where('status',1)->find();
        //判断用户这次活动的复活卡次数
        $challenge = Db::name('challenge')->where('id',$data['cid'])->find();


        if($challenge['reveive_num']>=config('revive_card')){
            return json(['code'=>40500,'msg'=>'本轮活动复活次数已达上限']);
        }
            //减少一张复活卡
            $receive_card = Db::name('register')->where('phone',Session('phone'))->setDec('revive_card',1);
            //记录复活次数
            $u_challenge = Db::name('challenge')->where('id',$data['cid'])->setInc('reveive_num',1);


            if($receive_card && $u_challenge){
                 return json ( [
                    'code'  => 20000,
                    'msg'   => '复活了哟',
                ]);
            }

            return json ( [
                    'code'  => 40500,
                    'msg'   => '网络异常',
                ]);


    }
    /**
     * 游戏结束
     */
    public function dealResult()
    {
        $data = input();

        $this->randcookie();


        //判断是否挑战成功

        $etime = time();
        //查出活动的结束时间
        $activity = Db::name('activity')->where('status',1)->find();
        //查出用户本次活动的挑战记录
        $challenge = Db::name('challenge')->where('id',$data['cid'])->find();

        //更新用户挑战结束时间
        $u_etime = Db::name('challenge')->where('id',$data['cid'])->update(['etime'=>time()]);

        $res = Db::name('register')->where(['phone'=>Session('phone')])->where('answer_card','>',0)->setDec('answer_card', 1);

        //查询用户
        $user_info = Db::name('register')->where('phone',session('phone'))->field('phone,name,head_img')->find();

            if(empty($user_info['name'])){
                $user_info['name'] = '猪队友';
            }else{
                $user_info['name'] = json_decode($user_info['name']);

            }
            if(empty($user_info['head_img'])){
                $user_info['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/static/images/headicon.png';
            }else{
                $user_info['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/upload/'.$user_info['head_img'];

            }


        if(!$challenge){

            return json(['code'=>40500,'msg'=>'数据异常']);

        }



        //判断答题数量
        if($challenge['user_num']<config('q_num')){

            $u_status = Db::name('challenge')->where('id',$data['cid'])->update(['status'=>0]);

            return json(['code'=>40500,'msg'=>'答对题数不够哟,失败了哟','data'=>$user_info]);
            // $this->error('超过答题时间,失败了哟',null,$user_info);

        }

        // dump(date('Y-m-d H:i:s',$activity['etime']));
        // dump(date('Y-m-d H:i:s',$challenge['etime']));

                //判断答题答题时间
        if($activity['etime']<$etime){

            $u_status = Db::name('challenge')->where('id',$data['cid'])->update(['status'=>0]);

            return json(['code'=>40500,'msg'=>'超过答题时间,失败了哟','data'=>$user_info]);
            // $this->error('超过答题时间,失败了哟',null,$user_info);

        }

        //挑战成功
        if($activity['etime']>=$challenge['etime'] && $challenge['user_num']==config('q_num')){

            $u_status = Db::name('challenge')->where('id',$data['cid'])->update(['status'=>1]);

            $balance['msg'] = $activity['msg'];
            $balance['time'] = date('Y-m-d H:i',$activity['time']);

            return json(['code'=>20000,'msg'=>'挑战成功','data'=>$user_info,'balance'=>$balance]);
        }

            $u_status = Db::name('challenge')->where('id',$data['cid'])->update(['status'=>0]);

            return json(['code'=>20000,'msg'=>'挑战失败','data'=>$user_info]);





        //更新用户以太币
       /* $eth = Db::name('register')
                ->where('phone',Session('phone'))
                ->setInc('eth',$data['eth']);*/


        //用户信息
        // $user_info = Db::name('receive')
        //         ->alias('a')
        //         ->join('register b','a.phone = b.phone')
        //         ->field('a.eth,a.aid,b.name,b.head_img,a.phone')
        //         ->where('a.phone',Session('phone'))
        //         ->find();

        // $user_info['name'] = json_decode($user_info['name']);

        // //排行榜排名
        // $sort = Db::name('receive')->where('aid',$data['aid'])->order('eth desc')->select()->toArray();

        // foreach ($sort as $k => $v) {
        //     if(Session('phone')==$v['phone']){
        //         $user_info['sort'] = $k+1;
        //     }
        // }


    }



    //挑战后的页面
    public function end()
    {
        $this->randcookie();

        return $this->fetch(':success');
    }
}