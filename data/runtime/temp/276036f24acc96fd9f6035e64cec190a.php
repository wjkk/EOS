<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:50:"themes/admin_simpleboot3/admin/register/index.html";i:1537497606;s:77:"/mnt/kh_xcx/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/header.html";i:1526536240;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->


    <link href="/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/assets/themes/<?php echo cmf_get_admin_style(); ?>/bootstrap.min.css" rel="stylesheet">
    <link href="/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/assets/simpleboot3/css/simplebootadmin.css" rel="stylesheet">
    <link href="/yitaibi_ml3k9o/public/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        form .input-order {
            margin-bottom: 0px;
            padding: 0 2px;
            width: 42px;
            font-size: 12px;
        }

        form .input-order:focus {
            outline: none;
        }

        .table-actions {
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 0px;
        }

        .table-list {
            margin-bottom: 0px;
        }

        .form-required {
            color: red;
        }
    </style>
    <script type="text/javascript">
        //全局变量
        var GV = {
            ROOT: "/yitaibi_ml3k9o/public/",
            WEB_ROOT: "/yitaibi_ml3k9o/public/",
            JS_ROOT: "static/js/",
            APP: '<?php echo \think\Request::instance()->module(); ?>'/*当前应用名*/
        };
    </script>
    <script src="/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/assets/js/jquery-1.10.2.min.js"></script>
    <script src="/yitaibi_ml3k9o/public/static/js/wind.js"></script>
    <script src="/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/assets/js/bootstrap.min.js"></script>
    <script>
        Wind.css('artDialog');
        Wind.css('layer');
        $(function () {
            $("[data-toggle='tooltip']").tooltip({
                container:'body',
                html:true,
            });
            $("li.dropdown").hover(function () {
                $(this).addClass("open");
            }, function () {
                $(this).removeClass("open");
            });
        });
    </script>
    <?php if(APP_DEBUG): ?>
        <style>
            #think_page_trace_open {
                z-index: 9999;
            }
        </style>
    <?php endif; ?>



</head>

<style type="text/css" media="screen">

    /* login */
.login-header{width:100%;text-align:center;height:30px;font-size:24px;line-height:30px;}
.login{width:500px;position:fixed;border:#ebebeb solid 1px;height:280px;top:50%;left:50%;display:none;background:#ffffff;box-shadow:0px 0px 20px #ddd;z-index:9999;margin-left:-250px;margin-top:-140px;}
.login-title{width:100%;margin:10px 0px 0px 0px;text-align:center;line-height:40px;height:40px;font-size:18px;position:relative;}
.login-title span{position:absolute;font-size:12px;right:-20px;top:-30px;background:#ffffff;border:#ebebeb solid 1px;width:40px;height:40px;border-radius:20px;}
.login-title span a{display:block;}
.login-input-content{margin-top:20px;}
.login-input {overflow:hidden;margin:0px 0px 20px 0px;}
.login-input label{float:left;width:90px;padding-right:10px;text-align:right;line-height:35px;height:35px;font-size:14px;}
.login-input input.list-input{float:left;line-height:35px;height:35px;width:350px;border:#ebebeb 1px solid;text-indent:5px;}
.login-button{width:50%;margin:30px auto 0px auto;line-height:40px;font-size:14px;border:#ebebeb 1px solid;text-align:center;}
.login-button a{display:block;}
.login-bg{width:100%;height:100%;position:fixed;top:0px;left:0px;background:#ebebeb;filter:alpha(opacity=30);-moz-opacity:0.3;-khtml-opacity:0.3;opacity:0.3;display:none;}

a {
    text-decoration: none!important;
}
</style>

<body>



<div class="wrap js-check-wrap">



    <ul class="nav nav-tabs">



        <li class="active"><a href="javascript:;">用户列表</a></li>


    </ul>



    <form class="well form-inline margin-top-20" method="post" action="<?php echo url('index'); ?>">

        关键字:

        <input type="text" class="form-control" name="keyword" style="width: 200px;"



               value="<?php echo (isset($keyword) && ($keyword !== '')?$keyword:''); ?>" placeholder="请输入关键字...">



        <input type="submit" class="btn btn-primary" value="搜索"/>



        <a class="btn btn-danger" href="<?php echo url('index'); ?>">清空</a>



    </form>



    <form class="js-ajax-form" action="" method="post">

        <table class="table table-hover table-bordered table-list">

            <thead>

            <tr>


                <th>序号</th>

                <th>头像</th>

                <th>昵称</th>

                <th>ETH</th>

                <th>手机号</th>
                <th>状态</th>

                <th>登录时间</th>
                <th>操作</th>


            </tr>



            </thead>







        <!--start foreach-->

            <?php if(is_array($order) || $order instanceof \think\Collection || $order instanceof \think\Paginator): if( count($order)==0 ) : echo "" ;else: foreach($order as $key=>$vo): ?>

                <tr class="foreachTr" >

                    <td><?php echo $vo['id']; ?></td>
                    <td><img src="<?php echo $vo['head_img']; ?>" width="50" height="50"></td>
                    <td><?php echo (isset($vo['u_name']) && ($vo['u_name'] !== '')?$vo['u_name']:'暂无昵称'); ?></td>
                    <td><?php echo $vo['eth']; ?></td>
                    <td><?php echo $vo['phone']; ?></td>
                    <td><?php echo $vo['status']==1?'正常':'冻结'; ?></td>
                    <td><?php echo date("Y-m-d H:i",$vo['update_time']); ?></td>
                    <td>
                    <input type="hidden" name="id" value="<?php echo $vo['id']; ?>">
                    <?php if($vo['status'] == '1'): ?>
                    <button type="button" class="status" value="冻结">设为冻结</button>
                    <!-- <a href="" class=""></a> -->
                    <?php else: ?>
                    <button type="button" class="status" value="正常">设为正常</button>

                    <!-- <a href="" class="status"></a> -->
                    <?php endif; ?>
                    <input type="hidden" name="status" value="<?php echo $vo['status']; ?>">
                    </td>

                </tr>

            <?php endforeach; endif; else: echo "" ;endif; ?>

        <!--end foreach-->

        </table>


      <?php if(count($order) == 0): ?>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 暂无数据 <?php endif; ?>



        <ul class="pagination"><?php echo (isset($page) && ($page !== '')?$page:''); ?></ul>



    </form>



</div>



<script src="/yitaibi_ml3k9o/public/static/js/admin.js"></script>



<script src="/yitaibi_ml3k9o/public/static/js/layer/layer.js"></script>
<script>
    $('body').on('click', '.status', function(data) {

        var that = $(this);
        var status = that.next("input[name=status]").val();
        var  id = that.prev("input[name='id']").val();
       $.post("<?php echo url('frozen'); ?>", {status:status,id:id}, function(data) {
                layer.msg(data.msg);
                setTimeout(function(){
                            window.location.reload();
                        },800);

       });
    });
</script>
<script>
    $(function () {
    H_login = {};
    H_login.openLogin = function(){
        $('.login-header a').click(function(){
            var that = $(this);
            // alert($(this).attr('user-id'));
            var user_id = $(".user_id").val($(this).attr('user-id'));
            $('.login').show();
            $('.login-bg').show();
        });
    };
    H_login.closeLogin = function(){
        $('.close-login').click(function(){
            $('.login').hide();
            $('.login-bg').hide();
        });
    };
    H_login.loginForm = function () {
        $("body").on('click','#login-button-submit',function(){
              var that = $(this);
              var invite_code = $('#invite_code').val();

              var id = $('.user_id').val();

            if(invite_code == ""){
                layer.msg("邀请码不能为空", {icon: 2});
                username.focus();
                return false;
            }else{
                $.post("<?php echo url('invite_code'); ?>", {id:id,invite_code:invite_code} ,function(data){
                    // console.log(data);
                    if(data.code==1){
                        layer.msg(data.msg, {icon: 1});
                        // alert("data.msg");
                        setTimeout(function(){
                            $('.login').hide();
                            $('.login-bg').hide();
                            $('.list-input').val('');
                            window.location.reload();
                        },800);
                    }else{
                        layer.msg(data.msg, {icon: 2});

                    }

                      
                });
               
             
            }
        });
    };
    H_login.run = function () {
        this.closeLogin();
        this.openLogin();
        this.loginForm();
    };
    H_login.run();
});
</script>



</body>



</html>