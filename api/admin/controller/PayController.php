<?php
// +----------------------------------------------------------------------
// | 支付列表
// +----------------------------------------------------------------------
// | Author: donghua <cdh10086@qq.com>
// +----------------------------------------------------------------------
namespace api\admin\controller;

use wxapi\Wxapi;
use think\Controller;
use think\Validate;
use think\Db;
use WxPay\WxPay;
use WxPay\Notify;
use api\base\controller\Intercept;


class PayController extends Controller
{

    protected $consumer;
    public function _initialize()
    {
        parent::_initialize();
        $this->consumer = db('wx_user');
        // dump($this);exit;
    }


    /**
    * 支付接口
    * @return [token]
    * @time 2018.5.7
    */
    public function payOrder()
    {
      dump(123);die;

    //添加商品订单
       $out_trade_no = $this->create_order(db('order'), 'order_code', 'MU');

        $postdatas = [
         'order_code' =>$out_trade_no,
         'user_id' =>1,
         'add_time'  =>time(),
    ];

     $into =  db('order')->insert($postdatas);


        //支付流程
        // dump($config);die;
        $aa =  [
            'wxpay_appid'       => 'wxe3ff68baccb254bd',
            'wxpay_appsecret'   => 'bba9727d9ae59b8f4964bf9d9027c4f5',

            //商户
            'wxpay_key'         => 'zhihuiyun324234234533zhihuiyun32',
            'wxpay_mchid'       => '1487037072',
        ];
    // dump($aa);die;
        $wxpay = new WxPay($aa);
        // dump($wxpay);die;

        // dump($out_trade_no );die;
        //调起支付
        $pay = array(
                'body' => '音乐节支付',
                'out_trade_no' => $out_trade_no,
                'total_fee' => 0.01,
                'notify_url' => "https://".$_SERVER['HTTP_HOST'].'kol_music/' . url('api/index.php/admin/PayCallback/OrderChange') ,
        );
        $openid = 'ov0TpvpAQd-cfrx6ov4qZJdN4LW0';
        // dump($pay);die;
            // dump( $this->openId);die;
        $respay = $wxpay->get_code($pay, $openid);

        $respay =  json_decode($respay,true);
 // dump($respay);die;


        $res = Db::name('order')->insertGetId([
            'user_id' => 1,
            'order_code' => $out_trade_no,
            'add_time' => time(),
            'money'=>0.01,
            'desc'=>'音乐节',
        ]);
      	if(!$res){
        	$this->error("写入失败!");
        }
        $respay['id'] = $res;
        $this->success("success",null, $respay);
    }


   // 提现
   public function put()
   {

      $data = $this->request->param();
      if(empty($data['money'])){
              $this->error('提现金额不能为空');
      }
      $user_id = $this->userId;
      // $openid = $this->openid;

       $userinfo = DB::name('wx_user')->where('id',$user_id)->where('pcode',$data['pcode'])->find();
          // dump($openid);die;

      $money = $data['money'];
       $config =DB::name('config')->where('pcode',$data['pcode'])->find();
        $out_trade_no = $this->create_order(db('orders'), 'order_code', 'TX');
       // dump($config);die;
       $start_time= strtotime(date('Y-m-d'));
       $end_time =$start_time +86400;
       $where['add_time'] = array('between',"$start_time,$end_time");
       $order_time  = DB::name('orders')->where('user_id',$user_id)->where('pcode',$data['pcode'])->where(['type'=>2,'status'=>2])->where($where)->count();
       if($money>$config['max']){
        $this->error('提现金额最高为'.$config['max']);
       }
       if($money<$config['min']){
         $this->error('提现金额最低为'.$config['min']);
       }
       if($money>$userinfo['money']){
          $this->error('余额不足');
       }
       if($order_time>=$config['put_time']){
        $this->error('今日提现次数已上限');
       }
        // dump($data['pcode']);die;

    // $money= $money*100;
       $postData = [
           'user_id' => $user_id,
            'order_code' => $out_trade_no,
            'add_time' => time(),
            'pcode' =>$data['pcode'],
            'pay_type'=>1,
            'money'=>$money,
            'type' =>2,

       ];
       $res = Db::name('orders')->insertGetId($postData);
       if(!$res){
        $this->error('网络繁忙');
       }
              //微信以分来计算 所以乘以100
          $moneys = $money*100;
         $datas =[
                        'openid'=>$userinfo['openid'],
                        'partner_trade_no'=>$out_trade_no,
                        're_user_name'=>'',
                        'amount'=> (int)$moneys,
                        'desc'=>'用户余额提现',
        ];
            // file_put_contents(time().'aa.txt',  json_encode($data));
        $bb =  [
            'wxpay_appid'       => $config['appid'],
            'wxpay_appsecret'   => $config['appserver'],

            //商户
            'wxpay_key'         => $config['wxpay_key'],
            'wxpay_mchid'       => $config['wxpay_mchid'],
        ];
          // dump($bb);die;
      // dump($data);die;

                $wx =  new Wxpay($bb);
                  $aa =  $wx->transfers($datas);
            // file_put_contents(time().'.txt',  $aa);

                  // dump($aa);die;
                  if($aa['result_code']=='SUCCESS'){
                       $map['status']=2;
                        $map['put_time'] =time();
                       $res= DB::name('orders')->where('id',$res)->update($map);
                       $kk = DB::name('wx_user')->where('id',$user_id)->where('pcode',$data['pcode'])->setDec('money',$money);
                       if($res!==false){
                            $this->success('提现成功');
                       }

                   }else{
                    $this->error('提现失败');
                   }

   }

    /**
 * 生成订单号
 * @param $table
 * @param string $field
 * @param string $fix
 * @return string
 */
function create_order($table,$field='',$fix = ''){
        $fix = $fix?: C('TRANSA_PREFIX');
        do{
        $node_code =$fix.date('YmdHi') . rand(1000,9999);
        if( !$table ){return $node_code;}
        if($field){
            $where = array($field => $node_code );
        }

            $res = $table->where($where)->count();
        }while($res > 0);
        return $node_code;
}


}
