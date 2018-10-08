<?php

/**
 * 更新系统配置文件
 * @param array $data <br>如：array("URL_MODEL"=>0);
 * @return boolean
 */
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
        $config_file="../data/conf/config.php";
        if(file_exists($config_file)){
            $configs=include $config_file;
        }else {
            $configs=array();
        }
        $configs=array_merge($configs,$data);
        $result = file_put_contents($config_file, "<?php\treturn " . var_export($configs, true) . ";");
    }

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
 * 清空系统缓存，兼容sae
 */
function sp_clear_cache(){
        import ( "ORG.Util.Dir" );
        $dirs = array ();
        // runtime/
        $rootdirs = sp_scan_dir( RUNTIME_PATH."*" );
        //$noneed_clear=array(".","..","Data");
        $noneed_clear=array(".","..");
        $rootdirs=array_diff($rootdirs, $noneed_clear);
        foreach ( $rootdirs as $dir ) {

            if ($dir != "." && $dir != "..") {
                $dir = RUNTIME_PATH . $dir;
                if (is_dir ( $dir )) {
                    //array_push ( $dirs, $dir );
                    $tmprootdirs = sp_scan_dir ( $dir."/*" );
                    foreach ( $tmprootdirs as $tdir ) {
                        if ($tdir != "." && $tdir != "..") {
                            $tdir = $dir . '/' . $tdir;
                            if (is_dir ( $tdir )) {
                                array_push ( $dirs, $tdir );
                            }else{
                                @unlink($tdir);
                            }
                        }
                    }
                }else{
                    @unlink($dir);
                }
            }
        }
        $dirtool=new cmf\lib\Dir("");
        foreach ( $dirs as $dir ) {
            $dirtool->delDir ( $dir );
        }

        if(sp_is_sae()){
            $global_mc=@memcache_init();
            if($global_mc){
                $global_mc->flush();
            }

            $no_need_delete=array("THINKCMF_DYNAMIC_CONFIG");
            $kv = new SaeKV();
            // 初始化KVClient对象
            $ret = $kv->init();
            // 循环获取所有key-values
            $ret = $kv->pkrget('', 100);
            while (true) {
                foreach($ret as $key =>$value){
                    if(!in_array($key, $no_need_delete)){
                        $kv->delete($key);
                    }
                }
                end($ret);
                $start_key = key($ret);
                $i = count($ret);
                if ($i < 100) break;
                $ret = $kv->pkrget('', 100, $start_key);
            }

        }


}

/**
 * 替代scan_dir的方法
 * @param string $pattern 检索模式 搜索模式 *.txt,*.doc; (同glog方法)
 * @param int $flags
 */
function sp_scan_dir($pattern,$flags=null){
    $files = array_map('basename',glob($pattern, $flags));
    return $files;
}

/**
 * 2018-8 年月获得下个月
 */
function getBtime( $year  )
{
    $year = explode('-',$year);
    if( $year[1] == 12 ){
        $year[0] ++;
    }else{
        $year[1]++;
    }
    $year = implode('-', $year);
    return $year;
}
error_reporting(E_ERROR | E_PARSE );