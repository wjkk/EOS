<?php



namespace app\admin\controller;





use cmf\controller\AdminBaseController;

use think\Db;

use think\Config;





class ProgramController extends AdminBaseController

{

	    public function index()

    {

    	 $param = $this->request->param();



        //搜索

        $keyword = $param['keyword']??'';

        $start_time = !empty($param['start_time']) ? $param['start_time'] : 0;

        $end_time = !empty($param['start_time']) ? $param['start_time'] : strtotime('2037-12-12');



            $order = Db::name('start')

            ->where( 'is_del',0 )

            ->where( 'add_time','<=', $end_time )

            ->where( 'add_time','>=', $start_time)

            ->where( "name",'like',"%{$keyword}%" )

            ->order( 'vote_num desc' )  

            ->paginate(10,null,['query'=>$param]);

             $page = $order ->render();

              $order = $order ->toArray()['data'];

           foreach ($order as $k => $v) {
              $order[$k]['img'] = "https://".$_SERVER['SERVER_NAME'].'/kol_music/public'.$v['img'];
           }

// dump($order);die;

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



        protected function _add(){

        $file = request()->file('img');

        $data=$_POST;

      if(isset($file)){

        // 获取表单上传文件 例如上传了001.jpg

        // 移动到框架应用根目录/public/uploads/ 目录下

        // $info = $file->move(ROOT_PATH . 'public/upload');

        $info = $file->move(ROOT_PATH . 'public' . DS . 'upload');



        if($info){

        // 成功上传后 获取上传信息

        $img=$info->getSaveName();

        //拼全图片路径

        $img = '/upload/'.$img;

        //把路径改为反斜杠

        $img= str_replace("\\","/",$img);



        $data['img']= $img;

      }else{

        // 上传失败获取错误信息

         $this->error($file->getError());

       }

      }



        $data['add_time']=time();

        if(empty($data['img']) || empty($data['name'])){

            $this->error('参数不能为空');

        }

        $addFlag = DB::name('start')->insertGetId( $data );

        if( !$addFlag ){

            $this->error('添加失败');

        }

        $this->success('添加成功',url('index'),null,1);


    }



         public function edit()

    {



        $id = input('id');//获取get请求来的参数

        $list = Db::name('start')->where('id',$id)->find();

         if( $this->request->isPost() ){

        $data = $this->request->param();



        $id = $data['id'];

         $editData =[

            'name' => $data['name'],

            'id' => $id,

        ];

        // dump($data);die;



        // 获取表单上传文件 例如上传了001.jpg

        $file = request()->file('img');

        // dump($file);die;

        // 移动到框架应用根目录/public/uploads/ 目录下

        if(!empty($file)){

            $info = $file->move(ROOT_PATH . 'public/'.'upload');

        if($info){

            // 成功上传后 获取上传信息

               $info->getExtension();

                $img = $info->getSaveName();

                $img = '/upload/'.$img;

                $img= str_replace("\\","/",$img);

                $editData['img'] = $img;

        }else{

            // 上传失败获取错误信息

            echo $file->getError();

            die;

        }



    }





        if( empty($data['name'])  ){

            $this->error('参数不能为空');

        }



         $editFlag = DB::name('start')->update($editData);

        if( isset($editFlag) ){

        $this->success('修改成功',url('index'),null,1);



        }else{

            $this->error('修改失败');



        }

        }

        //cmf_get_image_url
        $pic = 'https://'.$_SERVER['SERVER_NAME'].'/kol_music/public'.$list['img'];

        $this->assign('list',$list);

        $this->assign('pic',$pic);

        return $this->fetch();

    }



     /**
     * 删除小程序
     */

    public function delAnswer()

    {

        if( $this->request->isAjax() ){

            $data = $this->request->param();

            if( empty( $data['id'] ) ){

                $this->error( 'id错误' );

            }

            $orderInfo = Db::name('start')->find( $data['id'] );

            if( !$orderInfo ){

                $this->error( '结果不存在' );

            }

            if( 1 == $orderInfo['is_del'] ){

                $this->success('删除成功！');

            }

            $delOrderFlag = Db::name('start')->where( 'id',$data['id'] )->setField( 'is_del',1 );

            if( !$delOrderFlag ){

                $this->error( '操作失败' );

            }

            $this->success('删除成功！');

        }

    }





}