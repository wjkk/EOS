<?php
namespace app\admin\controller;


use cmf\controller\AdminBaseController;
use think\Db;
use think\Config;


class RegisterController extends AdminBaseController
{


    public function index()
    {

        $param = $this->request->param();

        //搜索
        
        $keyword = $param['keyword']??'';

        $order = Db::name('register')
        ->where( "u_name|phone",'like',"%{$keyword}%" )
        ->order( 'eth desc' )
        ->paginate(15,null,['query'=>$param]); 
        $page = $order ->render();
        $order = $order ->toArray()['data'];
        
        foreach ($order as $k => $v) {
             if(empty($v['head_img'])){
                $order[$k]['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/static/images/headicon.png';
            }else{
                $order[$k]['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/upload/'.$v['head_img'];

            }
        }

        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('order', $order);
        $this->assign('page', $page);
        return $this->fetch();
        
    }


    //冻结
    public function frozen()
    {
        $data = input();
        // dump($data);die;
        //查询用户是否存在
        $user = Db::name('register')->where('id',$data['id'])->find();

        if(!$user){
            $this->error('用户不存在');
        }

        if($data['status']>1 || $data['status']<0){
            $this->error('数据异常');
        }


        if($data['status']==1){
            $status = Db::name('register')->where('id',$data['id'])->update(['status'=>0]);

        }else{
            $status = Db::name('register')->where('id',$data['id'])->update(['status'=>1]);

        }
        
        if($status){
            $this->success('操作成功');
        }

        $this->error('解绑失败');
    }



}