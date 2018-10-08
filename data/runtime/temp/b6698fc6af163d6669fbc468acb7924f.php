<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:50:"themes/admin_simpleboot3/admin/admin/recharge.html";i:1537000003;s:77:"/mnt/kh_xcx/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/header.html";i:1526536240;}*/ ?>
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



<div class="wrap js-check-wrap">



    <ul class="nav nav-tabs">



        <li class="active"><a href="javascript:;">充值列表</a></li>

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


                <th>ID</th>

                <th>订单号码</th>

                <th>用户昵称</th>

                <th>手机号</th>

                <th>充值价格</th>

                <th>订单状态</th>

                <th>充值时间</th>


            </thead>





        <!--start foreach-->


  <?php if(is_array($lists) || $lists instanceof \think\Collection || $lists instanceof \think\Paginator): if( count($lists)==0 ) : echo "" ;else: foreach($lists as $key=>$vo): ?>

                <tr>

                    <td><?php echo $vo['id']; ?></td>
                    <td><?php echo $vo['order_num']; ?></td>
                    <td><?php echo (isset($vo['name']) && ($vo['name'] !== '')?$vo['name']:''); ?></td>
                    <td><?php echo (isset($vo['phone']) && ($vo['phone'] !== '')?$vo['phone']:''); ?></td>
                    <td><?php echo (isset($vo['eth']) && ($vo['eth'] !== '')?$vo['eth']:''); ?></td>
                    <td><?php echo (isset($vo['status']) && ($vo['status'] !== '')?$vo['status']:''); ?></td>
                    <td><?php echo date("Y-m-d H:i",$vo['add_time']); ?></td>

                </tr>

            <?php endforeach; endif; else: echo "" ;endif; ?>


        <!--end foreach-->



        </table>



      <?php if(count($lists) == 0): ?>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 暂无数据 <?php endif; ?>



        <ul class="pagination"><?php echo (isset($page) && ($page !== '')?$page:''); ?></ul>



    </form>



</div>



<script src="/yitaibi_ml3k9o/public/static/js/admin.js"></script>



<script src="/yitaibi_ml3k9o/public/static/js/layer/layer.js"></script>




</body>



</html>