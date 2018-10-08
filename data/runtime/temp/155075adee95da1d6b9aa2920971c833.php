<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"themes/simpleboot3/start_game/login.html";i:1537858706;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>区块英雄大会</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/common.css?v=1.2">
  <link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/login.css?v=1.4">
  <script src="/yitaibi_ml3k9o/public/static/js/js/jquery-3.0.0.min.js"></script>
  <script src="/yitaibi_ml3k9o/public/static/js/js/flexible.js"></script>
  <script src="/yitaibi_ml3k9o/public/static/js/js/md5.min.js"></script>
</head>
<body>
  <div class='container'>
  
    <div class="login">
      <div class="bt" style="margin-bottom: 0.6rem;"><img src="/yitaibi_ml3k9o/public/static/images/images/qukuai.png" style="width: 100%;" alt=""></div>
      <div class="phone ip">
        <label>+86</label>
        <input id="phone" type="number" placeholder="请输入手机号" value="" >
      </div>
      <div class="password ip">
        <label>密码</label>
        <input id="password" type="password" placeholder="请输入密码" value="">
      </div>
      <div class="btn">
        <a target="_blank" href="<?php echo url('register'); ?>">
          <button>快速注册</button>
        </a>
        <a href="<?php echo url('forget'); ?>">
          <button>忘记密码</button>
        </a>
      </div>
      <input type="hidden" name="url" value="<?php echo url('Questions/getGlobalInfo'); ?>">
      <div class="sign">
        <button class="lll">登录</button>
      </div>
    </div>
  </div>
  <!-- 弹框 -->
  <div class="tan">
    <h5>提示</h5>
    <p>请输入正确的手机号</p>
  </div>
  <!-- <script src="/yitaibi_ml3k9o/public/static/js/js/login.js"></script> -->
  <script>
  $('body').on('click', '.sign button', function() {
    var phone = $("#phone").val();
    var password = $("#password").val();
    var url = $("input[name=url]").val();
    // alert(url);return false;
    $.post("<?php echo url('register/login'); ?>", {phone:phone,password:password}, function(data) {
        if(data.code==20000){
          // alert(data.msg);
          setTimeout(function(){
                              // window.location.href="https://xcx.kh.gzzh.ren/yitaibi_ml3k9o/public/index.php/start_game/center/center";
                              window.location.href=url;
                              // window.open(url);
                        },500);
        }else{
          alert(data.msg);

        }
        
    });
      
  });
  </script>
</body>
</html>
