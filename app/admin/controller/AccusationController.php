<?php



namespace app\admin\controller;





use cmf\controller\AdminBaseController;

use think\Db;

use think\Config;





class AccusationController extends AdminBaseController

{





    public function index()

    {



        $param = $this->request->param();



        //搜索

        $keyword = $param['keyword']??'';

        $start_time = !empty($param['start_time']) ? $param['start_time'] : 0;

        $end_time = !empty($param['start_time']) ? $param['start_time'] : strtotime('2037-12-12');



            $order = Db::name('price')

            ->where( 'is_del',0 )

            ->where( 'add_time','<=', $end_time )

            ->where( 'add_time','>=', $start_time)

            ->where( "price",'like',"%{$keyword}%" )

            ->order( 'add_time desc')

            ->paginate(10,null,['query'=>$param]);

             $page = $order ->render();

              $order = $order ->toArray()['data'];





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

        $list = Db::name('price')->where('id',$id)->find();

         if( $this->request->isPost() ){

        $data = $this->request->param();



        $id = $data['id'];

         $editData =[

            'price' => $data['price'],

            'id' => $id

        ];





        if(empty($data['price']) ){

            $this->error('参数不能为空');

        }



         $editFlag = DB::name('price')->update($editData);

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

        if( empty($data['price'])){

            $this->error('参数不能为空');

        }

        $addFlag = DB::name('price')->insertGetId( $data );

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

            $orderInfo = Db::name('price')->find( $data['id'] );

            if( !$orderInfo ){

                $this->error( '结果不存在' );

            }

            if( 1 == $orderInfo['is_del'] ){

                $this->success('删除成功！');

            }



            $delOrderFlag = Db::name('price')->where( 'id',$data['id'] )->setField( 'is_del',1 );



            if( !$delOrderFlag ){

                $this->error( '操作失败' );

            }



            $this->success('删除成功！');

        }

    }



}