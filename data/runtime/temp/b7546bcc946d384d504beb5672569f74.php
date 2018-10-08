<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:48:"themes/admin_simpleboot3/admin/activity/add.html";i:1537234914;s:77:"/mnt/kh_xcx/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/header.html";i:1526536240;}*/ ?>
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



<body>



	<div class="wrap">



		<ul class="nav nav-tabs">



			<li ><a href="<?php echo url('index'); ?>">活动列表</a></li>



        	<li class="active"><a href="javascript:;" >添加</a></li>



		</ul>



		<form method="post" class="form-horizontal js-ajax-form margin-top-20" action="<?php echo url('add'); ?>" enctype="multipart/form-data">

			<div class="form-group">

				<label for="input-user_login" class="col-sm-2 control-label"><span class="form-required">*</span>活动名称</label>

				<div class="col-md-6 col-sm-10">

					<input name="a_name"></input>

				</div>

			</div>

			<div class="form-group">

				<label for="input-user_login" class="col-sm-2 control-label"><span class="form-required">*</span>开始时间</label>

				<div class="col-md-6 col-sm-10">

        <input type="text" class="form-control js-bootstrap-datetime" name="stime"
               value=""
               style="width: 140px;" autocomplete="off">

				</div>

			</div>

            <div class="form-group">

                <label for="input-user_login" class="col-sm-2 control-label"><span class="form-required">*</span>结束时间</label>

                <div class="col-md-6 col-sm-10">

                     <input type="text" class="form-control js-bootstrap-datetime" name="etime" value="" style="width: 140px;" autocomplete="off">

                </div>

            </div>

     <!--        <div class="form-group">
     
         <label for="input-user_login" class="col-sm-2 control-label"><span class="form-required">*</span>复活次数</label>
     
         <div class="col-md-6 col-sm-10">
     
             <input name="reveive_num" onkeyup="value=value.replace(/[^\d]/g,'')" ></input>
     
         </div>
     
     </div> -->


            <div class="form-group">

                <label for="input-user_login" class="col-sm-2 control-label"><span class="form-required">*</span>奖池奖金</label>

                <div class="col-md-6 col-sm-10">

                    <input name="eth" onkeyup="value=value.replace(/[^\d]/g,'')" ></input>

                </div>

            </div>

            <div class="form-group">

                <label for="input-user_login" class="col-sm-2 control-label"><span class="form-required">*</span>结算提示语</label>

                <div class="col-md-6 col-sm-10">

                    <input name="msg" style="width:200px"></input>

                </div>

            </div>

            <div class="form-group">

                <label for="input-user_login" class="col-sm-2 control-label"><span class="form-required">*</span>结算时间</label>

                <div class="col-md-6 col-sm-10">

                    <input type="text" class="form-control js-bootstrap-datetime" name="time" value="" style="width: 140px;" autocomplete="off">

                </div>

            </div>



			<div class="form-group">

				<div class="col-sm-offset-2 col-sm-10">

					<button type="submit" class="btn btn-primary js-ajax-submit"><?php echo lang('ADD'); ?></button>

				</div>

			</div>			

		</form>



	</div>



	<script src="/yitaibi_ml3k9o/public/static/js/admin.js"></script>



</body>



</html>