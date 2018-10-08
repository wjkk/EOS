<?php



namespace app\admin\controller;





use cmf\controller\AdminBaseController;

use think\Db;

use think\Config;





class AdminController extends AdminBaseController

{

    public function index()

    {

        $param = $this->request->param();
        $keyword = $param['keyword']??'';
        $lists =  Db::name('order')
        // ->alias('a')
        // ->join('wx_user b','b.id = a.user_id')
        ->where( "order_code|name|phone|address|invite_code",'like',"%{$keyword}%" )
        ->order( 'add_time desc')

        ->paginate(10,null,['query'=>$param]);

        $page = $lists ->render();

        $lists = $lists ->toArray()['data'];

        foreach ($lists as $k => $v) {
            if($v['status']==1){
                $lists[$k]['status'] = '支付失败';
            }else{
                $lists[$k]['status'] = '支付成功';
            }
        }

            $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');

            $this->assign('lists', $lists);

            $this->assign('page', $page);

            return $this->fetch();

    }

        public function forward()

    {
        $param = $this->request->param();
        $keyword = $param['keyword']??'';
        $lists =  Db::name('order')
        // ->alias('a')
        // ->join('wx_user b','b.id = a.user_id')
        ->where( "order_num|phone",'like',"%{$keyword}%" )

        ->order( 'add_time desc')

        ->paginate(15,null,['query'=>$param]);

        $page = $lists ->render();

        $lists = $lists ->toArray()['data'];

        foreach ($lists as $k => $v) {
            if($v['status']==1){
                $lists[$k]['status'] = '提现失败';
            }else{
                $lists[$k]['status'] = '提现成功';
            }
        }

            $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');

            $this->assign('lists', $lists);

            $this->assign('page', $page);

            return $this->fetch();
    }

        public function recharge()

    {

         $param = $this->request->param();
        $keyword = $param['keyword']??'';
        $lists =  Db::name('order')
        // ->alias('a')
        // ->join('wx_user b','b.id = a.user_id')
        ->where( "order_num|phone",'like',"%{$keyword}%" )
        ->order( 'add_time desc')

        ->paginate(15,null,['query'=>$param]);

        $page = $lists ->render();

        $lists = $lists ->toArray()['data'];

        foreach ($lists as $k => $v) {
            if($v['status']==1){
                $lists[$k]['status'] = '支付失败';
            }else{
                $lists[$k]['status'] = '支付成功';
            }
        }

            $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');

            $this->assign('lists', $lists);

            $this->assign('page', $page);

            return $this->fetch();

    }
}