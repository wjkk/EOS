<?php

namespace app\admin\controller;


use cmf\controller\AdminBaseController;

use think\Db;

use think\Config;

use think\Validate;



class QuestionsController extends AdminBaseController

{





    public function index()

    {



        $param = $this->request->param();



        //搜索

            $keyword = $param['keyword']??'';

            $questions = Db::name('questions')

            ->where( 'is_del',0 )

            ->where( "options|quiz|answer",'like',"%{$keyword}%" )

            ->order( 'id desc' )

            ->paginate(20,null,['query'=>$param]);

            $page = $questions ->render();

            $questions = $questions ->toArray()['data'];

        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');

        $this->assign('questions', $questions);

        $this->assign('page', $page);

        return $this->fetch();

    }


     public function edit()

    {



        $id = input('id');//获取get请求来的参数


        $list = Db::name('questions')->where('id',$id)->find();

        // $lis['options'] = htmlspecialchars($list['options']);
        $list['options'] = str_replace( "\"", "&#34;",$list['options']);
        // $list['options'] = str_replace($list['options'], "'", "&#39;");
        // $list['options'] = json_decode($list['options']);
// dump($list);die;

         if( $this->request->isPost() ){

        $data = $this->request->param();



        $id = $data['id'];

         $editData =[

            'quiz' => $data['quiz'],

            'options' => htmlspecialchars_decode($data['options']),

            'answer' => $data['answer'],

            'id' => $id

        ];


         // 验证参数
        $validate = new Validate([
                'quiz'      =>  'require',
                'options'  =>   'require',
                'answer'  =>   'require',

            ]);

        $validate->message([
                'quiz.require'  =>  '请填写问题',
                'options.require'  =>  '请填写答案',
                'answer'  =>   'require',


            ]);

        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }




         $editFlag = DB::name('questions')->update($editData);

        if( isset($editFlag) ){

        $this->success('修改成功',url('index'));

        }else{

        $this->error('修改失败');



        }

    }


        $this->assign('list',$list);

        return $this->fetch();

    }



    /******************************AJAX************************************/



    /**
     * 删除题库
     */

    public function delAnswer()

    {

        if( $this->request->isAjax() ){

            $data = $this->request->param();

            if( empty( $data['id'] ) ){

                $this->error( 'id错误' );

            }

            $questionssInfo = Db::name('questions')->find( $data['id'] );

            if( !$questionssInfo ){

                $this->error( '结果不存在' );

            }

            if( 1 == $questionssInfo['is_del'] ){

                $this->success('删除成功！');

            }

            $delquestionssFlag = Db::name('questions')->where( 'id',$data['id'] )->setField( 'is_del',1 );

            if( !$delquestionssFlag ){

                $this->error( '操作失败' );

            }

            $this->success('删除成功！');

        }

    }


    /**
     * 导入
     */

    public function import()
    {
        return $this->fetch();
    }


        //保存   导入
    public function savestudentImport(){
        \think\Loader::import('PHPExcel.PHPExcel');
        // import('phpexcel.PHPExcel', EXTEND_PATH);//方法二
        // vendor("PHPExcel.PHPExcel"); //方法一
        $objPHPExcel = new \PHPExcel();
        //获取表单上传文件
        $file = request()->file('excel');
        if(empty($file)){
            $this->error('上传文件不能为空');
        }

        $info = $file->validate(['ext'=>'xlsx,xls,csv'])->move(ROOT_PATH . 'public/upload' . DS . 'excel');
        if($info){
            $exclePath = $info->getSaveName();  //获取文件名
            $file_name = ROOT_PATH . 'public/upload' . DS . 'excel' . DS . $exclePath;   //上传文件的地址
            $objReader =\PHPExcel_IOFactory::createReader('Excel2007');
            $obj_PHPExcel =$objReader->load($file_name, $encode = 'utf-8');  //加载文件内容,编码utf-8
            echo "<pre>";
            $excel_array=$obj_PHPExcel->getsheet(0)->toArray();   //转换为数组格式
            array_shift($excel_array);  //删除第一个数组(标题);
            $data = [];
            // dump($excel_array);die;
            $i=0;
            foreach($excel_array as $k=>$v) {
                if(empty($v['2'])){
                    $this->error('问题不能为空');
                }
                if(empty($v['3'])){
                    $this->error('选项不能为空');
                }
                // dump($v['3']);die;
                if(empty($v['4'])){
                    $this->error('答案不能为空');
                }
                if($k!=0){
                    $data[$k]['contributor'] = $v[1];
                     $data[$k]['quiz'] = $v[2];
                     $data[$k]['options'] = $v[3];
                     $data[$k]['answer'] = $v[4];
                }
                // $data[$k]['title'] = $v[0];

                $i++;
            }
            // dump($data);die;
           $success=Db::name('questions')->insertAll($data); //批量插入数据
           //$i=
           $error=$i-$success;
            // echo "总{$i}条，成功{$success}条，失败{$error}条。";
            $this->success('导入成功',url('index'));
           // Db::name('t_station')->insertAll($city); //批量插入数据
        }else{
            // 上传失败获取错误信息
            $this->error($file->getError());
        }

    }

    /**
     * 清空题库
     */
    public function qingkong()
    {
      if($this->request->isAjax()){
        $a = Db::name('questions')->where('id','>',1)->delete();
        if(!$a){
          $this->error('清空失败');
        }
        $this->success('已清空',url('index'));
      }
    }



}


