<?php
namespace app\admin\controller;

use cmf\controller\AdminBaseController;

use think\Db;

use think\Config;

use think\Validate;


class ChallengeController extends AdminBaseController

{

    public function index()
    {

         $param = $this->request->param();  

        //搜索

        $keyword = $param['keyword']??'';


            $order = Db::name('challenge')
            ->alias('a')
            ->join('register b','a.phone=b.phone')
            ->join('activity c','a.aid=c.id')

            ->field('a.id,a.phone,a.status,b.name,b.head_img,a.eth,c.a_name,a.add_time')

            ->where( "c.a_name|b.u_name",'like',"%{$keyword}%" )

            ->order( 'add_time desc' )

            ->paginate(15,null,['query'=>$param]); 

             $page = $order ->render();

              $order = $order ->toArray()['data'];
        
           foreach ($order as $k => $v) {
                $order[$k]['name'] = json_decode($v['name']);

                if($v['status']==0){
                    $order[$k]['status'] = '失败';
                }else{
                    $order[$k]['status'] = '成功';
                }

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
}