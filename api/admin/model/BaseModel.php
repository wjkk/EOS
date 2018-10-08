<?php
// +----------------------------------------------------------------------
// | 基础模型
// +----------------------------------------------------------------------
// | authro: universe.h
// +----------------------------------------------------------------------
// | Date: 2017-12.18
// +----------------------------------------------------------------------
namespace api\store\model;

use think\Model;

class BaseModel extends Model
{


    /**
     * 单个数据
     * @param $param
     * @return bool
     */
    public function getInfo($param){
        $res = $this -> where($param) -> find();
        return $res?:false;
    }
    /**
     * 列表数据
     * @param $param
     * @return bool
     */
    public function getList($param,$field=[],$pageInfo=[]){

        $page = $pageInfo['page']??1;
        $pageSize = $pageInfo['pageSize']??5;
        if(!empty($field)){
            $type = false;
            if(!empty($field['type'])){
                $type  = true;
            }
            $this->field($field['field'],$type);
        }
        $res = $this -> where($param) -> page($page,$pageSize) -> select();
        return $res?:false;
        
    }

    /**
     * 信息写入
     * @param $data
     * @return bool
     */
    public function add($data){
        $lastId = $this -> insertGetId($data);
        return  $lastId ?: false;
    }
}
