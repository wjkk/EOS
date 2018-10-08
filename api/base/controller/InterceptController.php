<?php
namespace api\base\controller;
use think\Db;
use think\Controller;
use think\Cache;
use think\Request;
//跨域
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
/*header('Access-Control-Allow-Methods: GET, POST, PUT,DELETE');*/

class InterceptController extends Controller
{
    protected $user_info=null;              //
    protected $userInfo=null;               // 用户信息
    protected static $_instance = null;     // 本身类的实例化
    protected  $post = null;                // post请求参数
    protected  $param = null;                // post请求参数
    protected  $get = null;                 // get请求参数
    protected  $userId = null;              // 用户ID
    protected  $between_time = null;
    protected $accessToken;          // 接口调用凭证
	public function __construct() {
		parent::__construct();
        $post = $this->request->param();
        $this->post = $this->request->post();
        $this->param = $this->post;
        $this->get = $this->request->get();


        if(empty($post['token'])){
            $this->error('缺少参数token' ,null,null,4);
        }
        if (!Cache::has($post['token'])) {
            $this->error('token已失效，请重新登录', null, null, 2);
        }
        $info = cache( $post['token'] );
        //测试用 线上删除
        $this->userId = $info['user_id'];
        $this->user_info = Db::name('WxUser')->find( $info['user_id'] );
		/*$this->check($info );*/

	}
    private function __clone(){}

    static function instance()
    {
        if (!self::$_instance) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    public function __get($name)
    {
        if (isset($this->user_info[$name])) {
            return $this->user_info[$name];
        }
        return null;
    }



	function check( $res )
    {
        
        if( !$res ){
            $this->error( 'token错误' ,null,null,4 );
        }
   

        $this->userId = $res['user_id'];
        $this->user_info = Db::name('WxUser')->find( $res['user_id'] );
        $this->userInfo = $this->user_info;
    }










 

}