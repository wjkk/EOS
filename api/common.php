<?php
use think\Cache;
use traits\controller\Jump;
/*
    可以获取用户ID，并且每次获取都会讲用户ID的缓存有效期延长至20分钟
    需要传入用户token
 */
function getId($token=''){
    // // 判断token是否存在，是否失效
    // $result = Cache::has($token);
    // if (!$result) {
    //     // token失效，对前端返回相应的错误码：2
    //     // Jump::getIdError();
    //     $jump = new Jump();
    //     $jump->error();
    // }
    // 获取用户ID
    $id = cache($token);
    // 将缓存有效期的时间延长至20分钟
    if ($id) {
        // token存在，才能延长有效期
        cache($token, $id, 1200);
    }
    return $id;
}

function curl_data($url,$data=[],$timeout=30,$useCert=[])
{
    $ch = curl_init();
    //取数据的地址
    curl_setopt($ch, CURLOPT_URL, $url);
    //传输为post
    curl_setopt($ch, CURLOPT_POST, true);

    //是否提交普通商户证书
    if(isset($useCert['pt']) &&  $useCert['pt'] == true){
        //使用证书：cert 与 key 分别属于两个.pem文件
        curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLCERT, config('SSLCERT_PATH'));
        curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLKEY, config('SSLKEY_PATH'));
    }

    //是否提交企业商户证书
    if( isset($useCert['is_post']) && $useCert['is_post'] == true){
        if( isset($useCert['qy']) && $useCert['qy']){
            $sslcert = config('SSLCERTQY_PATH');
            $sslkey = config('SSLKEYQY_PATH');
            // $a = file_get_contents($sslcert);
            // var_dump($a);die;
        }else{
            $sslcert = config('SSLCERTPT_PATH');
            $sslkey = config('SSLKEYPT_PATH');
        }
        //使用证书：cert 与 key 分别属于两个.pem文件
        curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLCERT, $sslcert);
        curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLKEY, $sslkey);
    }
    //传输数据
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    //隐藏返回结果
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    //限制时间
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    //https支持
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//这个是重点。
    //执行
    $handles = curl_exec($ch);
    //断开
    curl_close($ch);

    return $handles;
}





function set_config($data){
    if(!is_array($data)){
        return false;
    }

    if(sp_is_sae()){
        $kv = new SaeKV();
        $ret = $kv->init();
        $configs=$kv->get("THINKCMF_DYNAMIC_CONFIG");
        $configs=empty($configs)?array():unserialize($configs);
        $configs=array_merge($configs,$data);
        var_dump($configs);
        die;
        $result = $kv->set('THINKCMF_DYNAMIC_CONFIG', serialize($configs));
    }elseif(defined('IS_BAE') && IS_BAE){
        $bae_mc=new BaeMemcache();
        $configs=$bae_mc->get("THINKCMF_DYNAMIC_CONFIG");
        $configs=empty($configs)?array():unserialize($configs);
        $configs=array_merge($configs,$data);
        $result = $bae_mc->set("THINKCMF_DYNAMIC_CONFIG",serialize($configs),MEMCACHE_COMPRESSED,0);
    }else{
        $config_file="../api/Config.php";
        if(file_exists($config_file)){
            $configs=include $config_file;
        }else {
            $configs=array();
        }
        $configs=array_merge($configs,$data);
        dump($configs);die;
        $result = file_put_contents($config_file, "<?php\treturn " . var_export($configs, true) . ";");
    }
   // dump($result);die;
    return $result;
}

/**
 * 判断是否为SAE
 */
function sp_is_sae(){
    if(defined('APP_MODE') && APP_MODE=='sae'){
        return true;
    }else{
        return false;
    }
}

/**
 * 数字转时间
 */
function num2time( $num )
{
    $h = (int)($num/3600);
    $i = (int)(($num%3600)/60);
    $s = (int)($num%60);
    return $h.':'.$i.':'.$s;
}



