<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;
use app\admin\model\Menu;

class MainController extends AdminBaseController
{

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     *  后台欢迎页
     */
    public function index()
    {
       $data= $this->request->param();


       // 今天凌晨时间戳
         $today = strtotime(date('Y-m-d'));
      //今天晚上12点
      $end =$today +86400;
      $where['add_time'] = array('between',"$today,$end");
      // dump($where);die;
        // dump(123);die;
        //总用户数
        $count['sum'] = DB::name('register')->count();
        //昨天新增用户数
        $count['new'] = DB::name('register')->where($where)->count();
        //挑战次数
        $count['order'] = DB::name('challenge')->count();
        //挑战成功次数
        $count['put']  =DB::name('challenge')->where('status',1)->count();



     $this->assign('count',$count);


      return $this->fetch();
    }


 

        public function get_sum()
    {
        $data= $this->request->param();


       // 今天12点时间戳
         $today = strtotime(date('Y-m-d'))+86400+86400;
          $tian = strtotime(date('Y-m-d'))+86400;
        for ($i=0; $i <7 ; $i++) {
          $tian = $tian -86400;
          $today = $today-86400;
           $where['add_time'] = array('between',"$tian,$today");
            $count[$i] = DB::name('register')->where($where)->count();
            $day[$i] = date('Y-m-d',time()-$i*86400);

        }
        $count = array_reverse($count);
        $day = array_reverse($day);

        
      $this->success('查询成功',null,['count'=>$count,'day'=>$day]);
    }

}
