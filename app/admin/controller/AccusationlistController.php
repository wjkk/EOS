<?php



namespace app\admin\controller;





use cmf\controller\AdminBaseController;

use think\Db;

use think\Config;





class AccusationlistController extends AdminBaseController

{





    public function index()

    {



        $param = $this->request->param();



        //����

        $keyword = $param['keyword']??'';

        $start_time = !empty($param['start_time']) ? $param['start_time'] : 0;

        $end_time = !empty($param['start_time']) ? $param['start_time'] : strtotime('2037-12-12');



            $order = Db::name('main_reportuser')
            ->alias('a')
            ->join('jb_main_history b','a.history_id = b.id')
            ->join('jb_wx_user c','a.user_id = c.id')
            ->join('jb_main_report d','a.report_id = d.id')
            ->field('a.detail,a.id,a.add_time,b.name as h_name,c.head_img,c.u_name,d.detail as d_detail')
            ->where( 'a.add_time','<=', $end_time )

            ->where( 'a.add_time','>=', $start_time)

            ->where( "d.detail|c.u_name|b.name",'like',"%{$keyword}%" )

            ->order( 'a.add_time desc')

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

     * �������

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



        $id = input('id');//��ȡget�������Ĳ���

        $list = Db::name('main_report')->where('id',$id)->find();

         if( $this->request->isPost() ){

        $data = $this->request->param();



        $id = $data['id'];

         $editData =[

            'detail' => $data['detail'],

            'id' => $id

        ];





        if(empty($data['detail']) ){

            $this->error('��������Ϊ��');

        }  



         $editFlag = DB::name('main_report')->update($editData);

        if( isset($editFlag) ){

        $this->success('�޸ĳɹ�',url('index'),null,1);



        }else{

            $this->error('�޸�ʧ��');



        }

        }



        $this->assign('list',$list);

        return $this->fetch();

    }













    protected function _add(){

        $data=$_POST;



        $data['add_time']=time();

        if( empty($data['detail'])){

            $this->error('��������Ϊ��');

        }

        $addFlag = DB::name('main_report')->insertGetId( $data );

        if( !$addFlag ){

            $this->error('���ʧ��');

        }

        $this->success('��ӳɹ�',url('index'),null,1);





    }





    /******************************AJAX************************************/



    /**

     * ɾ������

     */

    public function delAnswer()

    {

        if( $this->request->isAjax() ){

            $data = $this->request->param();

            if( empty( $data['id'] ) ){

                $this->error( 'id����' );

            }

            $orderInfo = Db::name('main_report')->find( $data['id'] );

            if( !$orderInfo ){

                $this->error( '���������' );

            }

            if( 1 == $orderInfo['is_del'] ){

                $this->success('ɾ���ɹ���');

            }



            $delOrderFlag = Db::name('main_report')->where( 'id',$data['id'] )->setField( 'is_del',1 );



            if( !$delOrderFlag ){

                $this->error( '����ʧ��' );

            }



            $this->success('ɾ���ɹ���');

        }

    }



}