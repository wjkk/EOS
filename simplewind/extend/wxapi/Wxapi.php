<?php
/**
 * author hhz 2017.10.12
 */
namespace wxapi;

class Wxapi {

    public function get_access_token($appid,$appsecret){
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret;
        return cmf_curl_get($url);
    }

    public function getJscode($param=[],$appid='',$appsecret=''){
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appid.'&secret='.$appsecret.'&js_code='.$param['code'].'&grant_type=authorization_code';
        return file_get_contents($url);
    }

    public function getUserSummary($param){
        $url = 'https://api.weixin.qq.com/datacube/getusersummary?access_token='.$param['access_token'];
        $param =['begin_date'=>$param['begin_date'],'end_date'=>$param['end_date']];
        return cmf_curl_get($url,json_encode($param));
    }

    public function getUserCumulate($param){
        $url = 'https://api.weixin.qq.com/datacube/getusercumulate?access_token='.$param['access_token'];
        $param =['begin_date'=>$param['begin_date'],'end_date'=>$param['end_date']];
        return cmf_curl_get($url,json_encode($param));
    }

    public function getUserwx($param=[],$appid='',$appsecret=''){
        $access_token = session('access_token');
        $tokenInfo = json_decode($access_token,true);

        if($tokenInfo['expires_in'] - time() < 600){

            $access_token = $this->get_access_token($appid,$appsecret);
            $tokenInfo = json_decode($access_token,true);
            $tokenInfo['expires_in'] = $tokenInfo['expires_in']+time();
            if($tokenInfo['errcode']){
                return $tokenInfo;
            }
            session('access_token',json_encode($tokenInfo,JSON_FORCE_OBJECT));
        }

        $tokenInfo = json_decode($access_token,true)['access_token'];
        $param['access_token'] = $tokenInfo;
        $summary = json_decode($this->getSserSummary($param),true);
        if(!$summary){
            return [];
        }
        foreach($summary['list'] as $v) {
            $cumulate_arr[$v['ref_date']] = $v;
        }

        $cumulate = json_decode($this->get_user_cumulate($param),true);
        foreach($cumulate['list'] as &$vs){
            $vs += $cumulate_arr[$vs['ref_date']]??[];
        }
        return $cumulate;
    }

    public function  getWxaCode($param){

        $tokenInfo = $this->set_token()['access_token'];
//        $url = 'https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token='.$tokenInfo;
        $url = 'https://api.weixin.qq.com/wxa/getwxacode?access_token='.$tokenInfo;
        $parm['path'] = $param['path'] ?? 'pages/index?query=1';
        $parm['width'] = $param['width'] ?? 430;
        $parm['auto_color'] =  false;

        if(!$param['page']){
             return false;
        }

//        var_dump(json_encode($parm,JSON_UNESCAPED_SLASHES));
        return cmf_curl_get($url,json_encode($parm));
    }

    public function send_template($param,$tokenInfo){
        // dump($param);die;
        // $tokenInfo = $this->set_token()['access_token'];
        $url='https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token='.$tokenInfo;
        return $this->curl_data($url,json_encode($param));
    }


      public function curl_data($url, $data=[], $timeout=30, $useCert=[])
    {
        // var_dump($data);
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);

        curl_setopt($ch, CURLOPT_POST, true);

        // if($useCert['pt'] == true){
        //     curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
        //     curl_setopt($ch,CURLOPT_SSLCERT, C('SSLCERT_PATH'));
        //     curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
        //     curl_setopt($ch,CURLOPT_SSLKEY, C('SSLKEY_PATH'));
        // }

        // if($useCert['is_post'] == true){
        //     if($useCert['qy']){
        //         $sslcert = C('SSLCERTQY_PATH');
        //         $sslkey = C('SSLKEYQY_PATH');
        //     }else{
        //         $sslcert = C('SSLCERTPT_PATH');
        //         $sslkey = C('SSLKEYPT_PATH');
        //     }

        //     curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
        //     curl_setopt($ch,CURLOPT_SSLCERT, $sslcert);
        //     curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
        //     curl_setopt($ch,CURLOPT_SSLKEY, $sslkey);
        // }

        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $handles = curl_exec($ch);
        curl_close($ch);

        return $handles;
    }





}