<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:44:"themes/simpleboot3/start_game/reset_pwd.html";i:1537195829;}*/ ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>忘记密码</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/common.css?v=1.1">
  <link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/reset_pwd.css?v=1.3">
  <script src="/yitaibi_ml3k9o/public/static/js/js/jquery-3.0.0.min.js"></script>
  <script src="/yitaibi_ml3k9o/public/static/js/js/flexible.js"></script>
  <script src="/yitaibi_ml3k9o/public/static/js/js/md5.min.js"></script>
</head>
<body>
  <div class="container">
    <!-- <div class="head">
      <h3>忘记密码</h3>
      <div class="box">
        <a href="<?php echo url('login'); ?>">
          <img src="/yitaibi_ml3k9o/public/static/images/images/back.png">
        </a>
      </div>
    </div> -->
    <div class="bg">
      <div class="login">
            <div class="phone ip">
              <label>+86</label>
              <input id="phone" type="number" placeholder="请输入手机号" value="">
            </div>
            <div class="vft">
              <input id="vft" type="number" placeholder="短信验证码" value="">
              <button id="time">获取验证码</button>
            </div>
          <div class="password vft">
              <input id="password" type="password" placeholder="重置密码" value="">
          </div>

          <input type="hidden" name="url" value="<?php echo url('center/login'); ?>">
          
          <div class="sign">
              <button id="reset">确认修改</button>
          </div>
        </div>
      </div>
  </div>

  <!-- 弹框 -->
    <div class="tan">
      <!-- <h5>提示</h5> -->
      <p>请输入正确的手机号</p>
    </div>

</body>
<!-- <script type="text/javascript" src="/yitaibi_ml3k9o/public/static/js/reset_pwd.js"></script> -->
<script>
  //发送短信验证码
  $('body').on('click', '.vft button', function() {
    
    var phone = $("#phone").val();
      var phoneReg = /^1[34578]\d{9}$/;
      if (!phoneReg.test(phone)) {
       $(".tan").fadeIn(300);
      setTimeout(function(){$(".tan").fadeOut(300);fromc = true;},1000);
      return false;
      }else{
        timeOut();
        console.log(phone)
        // alert(phone);return false;
        $.post("<?php echo url('register/sendMsg'); ?>", {phone:phone}, function(data) {
          // alert(data.msg)   
          if (data.code == 40500) {
            alert(data.msg)
          } 
        });
      }
      
  });

  //下一步
  $('body').on('click', '.sign button', function() {
    var phone = $("#phone").val();
    var password = $("#password").val();
    var code = $("#vft").val();
    var url = $("input[name=url]").val();
    // alert(phone);return false;
    $.post("<?php echo url('register/forget'); ?>", {phone:phone,password:password,code:code}, function(data) {
      // alert(data.msg)
        if(data.code==20000){
          alert(data.msg);
          setTimeout(function(){
                              // window.location.href="https://xcx.kh.gzzh.ren/yitaibi_ml3k9o/public/index.php/start_game/center/center";
                              window.location.href=url;
                        },500);
        }else{
          alert(data.msg);

        }
        
    });
      
  });

  // 获取验证码倒计时
    var wait=60;
    function timeOut(){
      $("#time").attr("disabled","true");
      if(wait==0){
        $('#time').text('获取验证码');
        $("#time").removeAttr("disabled");
        $('#time').css('background','#545A91')
        wait=60;
      }else{          
        setTimeout(function(){
          wait--;
          $('#time').text(wait + 's');
          $('#time').css('background','#ccc')
          timeOut();
        },1000)
      }
  }
</script>
</html>