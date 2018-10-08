<?php

/**

 * 门店小程序接口

 */

namespace api\admin\controller;



use think\Controller;

use think\Db;

use api\base\controller\InterceptController;



class StoreController extends InterceptController

{

	public function __construct(){

		parent::__construct();

	}



    public function index(){

    }





    /**

     * 更新用户信息

     */

    public function updateUserInfo()

    {

    	$data = $this->param;

    	$res = Db::name('wx_user')->where('id',$this->userId)->update(

    		[ 

    			'id' => $this->userId,

    			'u_name' =>!empty($data['nick_name'])?$data['nick_name']:'',

    			'user_name' =>!empty($data['nick_name'])?base64_encode($data['nick_name']):'',

    			'head_img' =>!empty($data['head_img'])?$data['head_img']:'',

    		 ]

		);
//dump($this->userId);die;



		if( false === $res ){

			$this->error('更新失败');

		}

		$this->success('更新成功！');

    }



}

