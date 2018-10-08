<?php



namespace app\admin\controller;


use cmf\controller\AdminBaseController;

use think\Db;

use think\Config;

use think\Validate;




class ActivityController extends AdminBaseController

{


    public function index()

    {

        $param = $this->request->param();


        //搜索

        $keyword = $param['keyword']??'';


            $order = Db::name('activity')

            ->where( 'is_del',0)

            ->where( "a_name",'like',"%{$keyword}%" )

            ->order( 'status desc' )

            ->paginate(15,null,['query'=>$param]); 

             $page = $order ->render();

              $order = $order ->toArray()['data'];
        
           foreach ($order as $k => $v) {

                if($v['status']==0){
                  $order[$k]['status'] = '已结束';
                $order[$k]['statuss'] = '活动已结束';

                }else{
                    $order[$k]['status'] = '活动中';
                    $order[$k]['statuss'] = '结束活动';

                }

                if($v['accounts']==0){
                  $order[$k]['accounts'] = '未结算';
                }else{
                    $order[$k]['accounts'] = '已结算';
                }

           }


        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');

        $this->assign('order', $order);

        $this->assign('page', $page);

        return $this->fetch();

    }





    /**
     * 添加活动
     */

    public function add()

    {

        if( $this->request->isPost() ){

            $this->_add();die;

        }

        return $this->fetch();

    }

    protected function _add(){


        $data=input();


          //验证参数
            $validate = new Validate([

                    'stime'      =>  'require',
                    'etime'  =>   'require',
                    'eth'  =>   'require',
                    'a_name' => 'require',
                    // 'reveive_num' => 'require',
                    'msg' => 'require',
                    'time' => 'require',


                ]);

            $validate->message([

                    'stime.require'      =>  '请填写开始时间',
                    'etime.require'  =>   '请填写结束时间',
                    'eth.require'  =>   '请输入奖金数',
                    'a_name.require' => '请输入活动名称',
                    // 'reveive_num.require' => '请输入可复活次数',
                    'msg.require' => '请输入结算提示语',
                    'time.require' => '请输入结算时间',

                ]);


            if (!$validate->check($data)) {

                $error = $validate->getError();
                $this->error($error);
            }


        $data['stime'] = strtotime($data['stime']);
        $data['etime'] = strtotime($data['etime']);
        $data['time'] = strtotime($data['time']);
        $data['add_time']=time();

        if($data['stime']>$data['etime']){
            $this->error('开始时间不能少于结束时间');
        }
        if($data['time']<$data['etime']){
            $this->error('结算时间不能少于结束时间');
        }


        $addFlag = DB::name('activity')->insertGetId( $data );

        if( !$addFlag ){

            $this->error('添加失败');

        }

        $status = Db::name('activity')->where('status',1)->where('id','<',$addFlag)->update(['status'=>0]);

        $this->success('添加成功',url('index'),null,1);


    }





    /******************************AJAX************************************/



    /**
     * 删除活动
     */

    public function delAnswer()

    {

        if( $this->request->isAjax() ){

            $data = $this->request->param();

            if( empty( $data['id'] ) ){

                $this->error( 'id错误' );

            }

            $orderInfo = Db::name('activity')->find( $data['id'] );

            if( !$orderInfo ){

                $this->error( '结果不存在' );

            }

            if( 1 == $orderInfo['is_del'] ){

                $this->success('删除成功！');

            }


            $delOrderFlag = Db::name('activity')->where( 'id',$data['id'] )->setField( 'is_del',1 );


            if( !$delOrderFlag ){

                $this->error( '操作失败' );

            }

            $this->success('删除成功！');

        }

    }


    /**
     * 结束活动
     */

        public function end()

    {

        if( $this->request->isAjax() ){

            $data = $this->request->param();

            if( empty( $data['id'] ) ){

                $this->error( 'id错误' );

            }

            $questionssInfo = Db::name('activity')->find( $data['id'] );

            if( !$questionssInfo ){

                $this->error( '结果不存在' );

            }

            if( 0 == $questionssInfo['status'] ){

                $this->success('该活动已结束，请勿再次操作');

            }

            $delquestionssFlag = Db::name('activity')->where( 'id',$data['id'] )->setField( 'status',0 );

            if( !$delquestionssFlag ){

                $this->error( '操作失败' );

            }

            $this->success('操作成功！');

        }

    }

    /**
     * 结算
     */
    
    public function accounts()
    {
        $data = input();

        if(empty($data['aid'])){
            $this->error('参数错误');
        }

        //统计这次活动的通关的用户数量
        $challenge = Db::name('challenge')->where('status',1)->where('aid',$data['aid'])->select()->toArray();

        $count = count($challenge);

        if(empty($count)){
            $this->error('本次活动没有通关的用户');
        }

        //查询活动的奖池
        $eth = Db::name('activity')->where('id',$data['aid'])->find();

        if($eth['accounts']==1){
            $this->error('本活动已结算');
        }
        
        $aeth = round($eth['eth']/$count,2);

        // dump($challenge);die;
        //分配到每个用户的eth
        // $avg = Db::name('challenge')->where('status',1)->where('aid',$data['aid'])->setField(['reveive_num',$aeth]);

        foreach ($challenge as $k => $v) {
           
            $counts = Db::name('challenge')->where('phone',$v['phone'])->group('phone')->where('aid',$data['aid'])->count();
        
            
            Db::name('register')->where('phone',$v['phone'])->setInc('eth',$aeth);
            Db::name('challenge')->where('id',$v['id'])->setInc('eth',$aeth);

        }
        // dump($counts)
        Db::name('activity')->where('id',$data['aid'])->update(['accounts'=>1]);
        $this->success('结算成功');

    }



}