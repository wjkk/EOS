<?php

namespace app\admin\controller;


use cmf\controller\AdminBaseController;
use think\Db;
use think\Config;


class RemarkController extends AdminBaseController
{


    public function index()
    {

        $param = $this->request->param();

        //搜索
        $keyword = $param['keyword']??'';
        $start_time = !empty($param['start_time']) ? $param['start_time'] : 0;
        $end_time = !empty($param['start_time']) ? $param['start_time'] : strtotime('2037-12-12');

            $order = Db::name('invite_code')
            ->where( 'is_del',0 )
            ->where( 'add_time','<=', $end_time )
            ->where( 'add_time','>=', $start_time)
            ->where( "code",'like',"%{$keyword}%" )
            ->order( 'add_time desc' )
            ->paginate(8,null,['query'=>$param]);
             $page = $order ->render();
              $order = $order ->toArray()['data'];

        foreach ($order as $k => $v) {
            $order[$k]['binding'] = Db::name('wx_user')->where('invite_code',$v['code'])->find();
            if($v['status']==0){
                $order[$k]['status'] = '没绑定';
            }else{
                $order[$k]['status'] = '已绑定';

            }
        }

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('order', $order);
        $this->assign('page', $page);
        return $this->fetch();
    }


    /**
     * 添加铃声
     */
    public function add()
    {
        if( $this->request->isPost() ){
            $this->_add();die;
        }
        return $this->fetch();

    }

     public function edit()
    {

        $id = input('id');//获取get请求来的参数
        $list = Db::name('invite_code')->where('id',$id)->find();
         if( $this->request->isPost() ){
        $data = $this->request->param();

        $id = $data['id'];
         $editData =[
            'code' => $data['code'],
            'id' => $id
        ];


        if( empty($data['code']) ){
            $this->error('参数不能为空');
        }

         $editFlag = DB::name('invite_code')->update($editData);
        if( isset($editFlag) ){
        $this->success('修改成功',url('index'),null,1);

        }else{
            $this->error('修改失败');

        }
        }

        $this->assign('list',$list);
        return $this->fetch();
    }

    protected function _add(){
        $data=$_POST;
        $data['add_time']=time();
        if(empty($data['code'])){
            $this->error('参数不能为空');
        }
        $addFlag = DB::name('invite_code')->insertGetId( $data );
        if( !$addFlag ){
            $this->error('添加失败');
        }
        $this->success('添加成功',url('index'),null,1);


    }


    /******************************AJAX************************************/

    /**
     * 删除铃声
     */
    public function delAnswer()
    {
        if( $this->request->isAjax() ){
            $data = $this->request->param();
            if( empty( $data['id'] ) ){
                $this->error( 'id错误' );
            }
            $orderInfo = Db::name('invite_code')->find( $data['id'] );
            if( !$orderInfo ){
                $this->error( '结果不存在' );
            }
            if( 1 == $orderInfo['is_del'] ){
                $this->success('删除成功！');
            }

            $delOrderFlag = Db::name('invite_code')->where( 'id',$data['id'] )->setField( 'is_del',1 );

            if( !$delOrderFlag ){
                $this->error( '操作失败' );
            }

            $this->success('删除成功！');
        }
    }

    //随机生成邀请码
    public function invite_code($length = 12 )
    {
            // 密码字符集，可任意添加你需要的字符
            $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
            $password = "";
            for ( $i = 0; $i < $length; $i++ )
            {
            // 这里提供两种字符获取方式
            // 第一种是使用 substr 截取$chars中的任意一位字符；
            // 第二种是取字符数组 $chars 的任意元素
            // $password .= substr($chars, mt_rand(0, strlen($chars) – 1), 1);
                $password .= $chars[ mt_rand(0, strlen($chars) - 1) ];
            }
            md5($password);
            // $password = $this->password($password,'E');
            $this->success('生成成功',null,$password);

    }


    /**
    * [加密函数]
    * @param  [type] $string    [加密的字符]
    * @param  [type] $operation [加密 E  解密 D]
    * @param  string $key       [加密规则]
    * @return [string]          [加密之后字符串]
    */

    public function password($string,$operation,$key='')
    {
        $key        = md5($key);
        $key_length = strlen($key);
          $string   = $operation=='D'?base64_decode($string):substr(md5($string.$key),0,8).$string;
        $string_length = strlen($string);
        $rndkey = $box = array();
        $result = '';
        for( $i=0; $i<=255; $i++ ){
            $rndkey[$i] =  ord($key[$i%$key_length]);
            $box[$i]    = $i;
        }
        for($j=$i=0;$i<256;$i++){
            $j       = ($j+$box[$i]+$rndkey[$i])%256;
            $tmp     =  $box[$i];
            $box[$i] =  $box[$j];
            $box[$j] =  $tmp;
        }
        for( $a=$j=$i=0; $i<$string_length; $i++ ){
            $a       = ($a+1)%256;
            $j       = ($j+$box[$a])%256;
            $tmp     = $box[$a];
            $box[$a] = $box[$j];
            $box[$j] = $tmp;
            $result.=chr(ord($string[$i])^($box[($box[$a]+$box[$j])%256]));
        }
        if($operation == 'D'){
            if(substr($result,0,8)==substr(md5(substr($result,8).$key),0,8)){
                return substr($result,8);
            }else{
                return'';
            }
        }else{
            return str_replace('=','',base64_encode($result));
        }
    }

}