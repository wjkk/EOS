<?php
namespace app\start_game\controller;

use cmf\controller\HomeBaseController;
use think\Db;

use think\Config;
use wxapi\Wxapi;

use WxPay\WxPay;
use think\Validate;
use WxPay\Notify;
use think\Cache;
use think\Session;
class CenterController extends HomeBaseController
{

    /**
     * 个人中心
     */
    public function center()
    {

            $this->randcookie();

            $user = Db::name('register')
                    ->field('name,invite_code,eth,answer_card,revive_card,head_img')
                    ->where('phone',session('phone'))
                    ->find();

            if(empty($user['name'])){
                $user['name'] = '去设置';
            }else{
                $user['name'] = json_decode($user['name']);
            }
            // dump($user);die;
            if(empty($user['head_img'])){
                $user['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/static/images/headicon.png';
            }else{
                $user['head_img'] = 'https://'.$_SERVER['SERVER_NAME'].'/yitaibi_ml3k9o/public/upload/'.$user['head_img'];
            }

            $this->assign('data',$user);
            $this->assign('revive_card',config('revive_card'));

            return $this->fetch(':center');
    }


    /**
     * 充值
     * 目前是提供一个链接跳转到第三方支付完成充值，需要用户输入memo信息
     * @return [data] [memo]
     */
    public function refill()
    {
        $this->randcookie();

        $memo = '';
        $phone = session('phone');
        $user = Db::name('register')->where(['phone'=>$phone])->find();
        // 获取memo
        if(!$user) {
            return json(['code'=>40500,'msg'=>'用户不存在']);
        }
        $memo = $user['memo'];

        return json(['code'=>2000, 'memo'=>$memo]);
    }

    /**
     * 提现
     */
    public function extract()
    {
            $this->randcookie();

        $user = Db::name('register')
                    ->field('name,invite_code,eth,answer_card,revive_card,head_img')
                    ->where('phone',session('phone'))
                    ->find();
        $this->assign('user',$user);


        if($this->request->isPost()){
            $data = input();
            $page = !empty( $data['page'] )? $data['page'] :1;
            $pageSize = !empty( $data['pageSize'] )? $data['pageSize'] :3;
            $forward = Db::name('receive')->where('phone',session('phone'))->page($page,$pageSize)->select()->toArray();

            foreach ($forward as $k => $v) {
                $forward[$k]['add_time'] = date('Y/m/d',$v['add_time']);

                if($v['status']==0){
                    $forward[$k]['status'] = '提现失败';
                }else{
                    $forward[$k]['status'] = '提现成功';
                }
            }
            return json(['code'=>2000,'data'=>$forward]);
        }

        return $this->fetch(':extract');
    }


    /**
     * 更改名称
     */
    public function name()
    {
            $this->randcookie();

        $phone = session('phone');
        $data = input();
        if(empty($data['name'])){
            $this->error('名字不能为空');
        }
        $name = json_encode($data['name']);

        $user = Db::name('register')->where(['phone'=>$phone])->update(['u_name'=>$data['name'],'name'=>$name]);


        if(!$user){

            // return json(['code'=>40500,'msg'=>'修改失败']);
            $this->error('修改失败');

        }
            $this->success('修改成功',null,$data['name']);

            // return json(['code'=>20000,'msg'=>'修改成功','name'=>json_decode($name)]);

    }

    /**
     * 上传头像
     * @return [head_img] [用户头像]
     */
    public function upload()
    {
            $this->randcookie();
      
        // 获取表单上传文件 例如上传了001.jpg
           $data = input();


          $base64_img = trim($_POST['imgPto']);
          $up_dir = ROOT_PATH . 'public/upload/'.date('Ymd',time()).'/';//存放在当前目录的upload文件夹下

        if(!is_dir($up_dir)){
            mkdir(iconv("UTF-8", "GBK", $up_dir),0777,true);
        }



          if(preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_img, $result)){
          $type = $result[2];
          if(in_array($type,array('pjpeg','jpeg','jpg','gif','bmp','png'))){
            $new_file = $up_dir.date('YmdHis').'.'.$type;
            if(file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64_img)))){
              $img_path = str_replace('../../..', '', $new_file);
              // $up_dir = str_replace(ROOT_PATH . 'public/upload/', '', $up_dir)
              $head_img = str_replace(ROOT_PATH . 'public/upload/','',$img_path);

              $himg =  Db::name('register')->where('phone',Session('phone'))->value('head_img');
                if(!empty($himg)){
                    unlink(CMF_ROOT.'public/upload/'.$himg);
                }

                $user = Db::name('register')->where('phone',Session('phone'))->update(['head_img'=>$head_img]);

                return json(['code'=>20000,'msg'=>'上传成功']);
            }else{
            return json(['code'=>40500,'msg'=>'图片上传失败']);

            }
          }else{
            //文件类型错误
          return json(['code'=>40500,'msg'=>'图片上传类型错误']);
          }

        }else{
          //文件错误
          return json(['code'=>40500,'msg'=>'文件错误']);

        }


    }
    /**
     * 购买复活卡
     */
    public function buyRevive()
    {
        $this->randcookie();
        $phone = session('phone');


        $user = Db::name('register')->where(['phone'=>$phone])->find();

        $data = input();

        if(empty($data['revive_card'])){
            return json(['code'=>40500,'msg'=>'请输入购买数量']);
        }
        if($data['revive_card']<1){
            return json(['code'=>40500,'msg'=>'购买数量必须大于等于1']);
        }
        if ($user['eth']<$data['eth']) {
            return json ( [
                'code'  => 40500,
                'msg'   => '以太币不足',
            ]);
        }

        Db::startTrans();

        try{

            $res = Db::name('register')->where(['phone'=>Session('phone')])->setDec('eth', $data['eth']);

            $revive_card = Db::name('register')->where(['phone'=>Session('phone')])->setInc('answer_card',$data['revive_card']);

            Db::commit();
            // 提交事务
        } catch (\Exception $e) {
            // dump( $e->getMessage());
            Db::rollback();
            // 回滚事务
             return json ( [
                'code'  => 40500,
                'msg'   => '以太币不足',
            ]);
        }

        return json ([
                'code'  => 20000,
                'msg'   => '购买成功',
            ]);


    }
    /**
     * 获取邀请码
     * @return [data] [邀请码]
     */
    public function invite()
    {
        $this->randcookie();
        
        $phone = session('phone');

        $invite_code = $this->rand(6);

        $user_code = Db::name('register')->where('phone',$phone)->value('invite_code');

        if($user_code){
            return json(['code'=>40500,'msg'=>'已有邀请码','data'=>$user_code]);
        }

        $user = Db::name('register')->where('phone',$phone)->update(['invite_code'=>$invite_code]);

        if($user){
            return json(['code'=>20000,'msg'=>'生成邀请码成功','data'=>$invite_code]);
        }
            return json(['code'=>40500,'msg'=>'生成邀请码失败']);

    }





    /**
     * 生成邀请码
     */

    public function rand($len)
        {
            $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
            $string=time();
            for(;$len>=1;$len--)
            {
                $position=rand()%strlen($chars);
                $position2=rand()%strlen($string);
                $string=substr_replace($string,substr($chars,$position,1),$position2,0);
            }
            return $string;
        }
}
