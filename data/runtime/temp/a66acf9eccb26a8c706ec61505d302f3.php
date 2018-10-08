<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:52:"themes/admin_simpleboot3/admin/questions/import.html";i:1537326007;s:77:"/mnt/kh_xcx/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/header.html";i:1526536240;}*/ ?>
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
        <li class="active"><a>题库导入</a></li>
    </ul>
    
 

<!-- <form action="<?php echo url('ReportUser/excel'); ?>" method="post" class="form-horizontal js-ajax-form margin-top-20">
        <div class="row">
            <div class="col-md-2 col-md-offset-4">
                <input id="file-1" type="hidden" name="file_url" >
                <input  id="file-1-name" type="text" name="file_name" title="" class="form-control">

            </div>
            <div class="col-md-2">
                <a href="javascript:uploadOne('图片上传','#file-1','file');" class="btn btn-success">上传excel</a>
            </div>
        </div>
        <div class="form-group margin-top-20">
            <div class="col-md-offset-4 col-md-2">
                <button type="submit" class="btn btn-primary js-ajax-submit">确定</button>
                <a class="btn btn-default" href="<?php echo url('ReportUser/index'); ?>"><?php echo lang('BACK'); ?></a>
            </div>
        </div>
    </form>
 -->



<!-- <form action="<?php echo url('ReportUser/excel'); ?>" method="post" class="form-horizontal js-ajax-form margin-top-20">
        <div class="row">
            <div class="col-md-2 col-md-offset-4">
                <input id="file-1" type="hidden" name="file_url" >
                <input  id="file-1-name" type="text" name="file_name" title="" class="form-control">

            </div>
            <div class="col-md-2">
                <a href="javascript:uploadOne('图片上传','#file-1','file');" class="btn btn-success">上传excel</a>
            </div>
        </div>
        <div class="form-group margin-top-20">
            <div class="col-md-offset-4 col-md-2">
                <button type="submit" class="btn btn-primary js-ajax-submit">确定</button>
                <a class="btn btn-default" href="<?php echo url('index'); ?>"><?php echo lang('BACK'); ?></a>
            </div>
        </div>
    </form> -->

<!--     <form action="<?php echo url('input'); ?>" method="post" accept-charset="utf-8" enctype="multipart/form-data">
    <input type="file" name="file_name" /> <br> 

        <input type="submit" value="上传" /> 
                <div class="form-group margin-top-20">
            <div class="col-md-offset-4 col-md-2">
                <button type="submit" class="btn btn-primary">确定</button>
                <a class="btn btn-default" href="<?php echo url('index'); ?>"><?php echo lang('BACK'); ?></a>
            </div>
        </div>
    </form> -->


<form method="post" action="<?php echo url('savestudentImport'); ?>" class="form-signin" enctype="multipart/form-data" >
    <input name="excel" type="file" class="form-control">
    <button class="btn btn-lg btn-primary">导入</button>
    <a href="/yitaibi_ml3k9o/public/static/example_questions.xlsx" download="example_questions.xlsx">点击下载模板</a>
</form>



</div>
<script src="/yitaibi_ml3k9o/public/static/js/admin.js"></script>
</body>
</html>