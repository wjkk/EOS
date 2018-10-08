<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:46:"themes/admin_simpleboot3/admin/menu/lists.html";i:1526536240;s:77:"/mnt/kh_xcx/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/header.html";i:1526536240;}*/ ?>
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
			<li><a href="<?php echo url('Menu/index'); ?>">后台菜单</a></li>
			<li><a href="<?php echo url('Menu/add'); ?>">添加菜单</a></li>
			<li class="active"><a href="<?php echo url('Menu/lists'); ?>">所有菜单</a></li>
		</ul>
		<form class="form-horizontal js-ajax-form" action="<?php echo url('menu/listorders'); ?>" method="post">
			<div class="table-actions">
				<a class="btn btn-primary btn-sm js-ajax-dialog-btn" href="<?php echo url('menu/exportMenuLang'); ?>" data-msg="您确定生成菜单多语言包吗？请确保应用目录下lang目录可写！">生成菜单多语言包</a>
				<a class="btn btn-warning btn-sm" href="<?php echo url('menu/getactions'); ?>">导入新菜单</a>
			</div>
			<div class="alert alert-warning" style="margin: 0 0 5px 0;">
				 请在开发人员指导下进行以上操作！
			</div>
			<table class="table table-hover table-bordered table-list">
				<thead>
					<tr>
						<th width="50">ID</th>
						<th>菜单英文名称</th>
						<th width="50">状态</th>
						<th width="90">管理操作</th>
					</tr>
				</thead>
				<?php if(is_array($menus) || $menus instanceof \think\Collection || $menus instanceof \think\Paginator): if( count($menus)==0 ) : echo "" ;else: foreach($menus as $key=>$vo): ?>
				<tr>
					<td><?php echo $vo['id']; ?></td>
					<td><?php echo $vo['name']; ?>:<?php echo $vo['app']; ?>/<?php echo $vo['controller']; ?>/<?php echo $vo['action']; ?></td>
					<td>
					<?php if($vo['status'] == 1): ?>
					显示
					<?php else: ?>
					隐藏
					<?php endif; ?>
					</td>
					<td>
						<a href="<?php echo url('menu/edit',array('id'=>$vo['id'])); ?>">编辑</a>
						<a class="js-ajax-delete" href="<?php echo url('menu/delete',array('id'=>$vo['id'])); ?>">删除</a>
					</td>
				</tr>
				<?php endforeach; endif; else: echo "" ;endif; ?>
				<tfoot>
					<tr>
						<th width="50">ID</th>
						<th>菜单英文名称</th>
						<th width="40">状态</th>
						<th width="80">管理操作</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script src="/yitaibi_ml3k9o/public/static/js/admin.js"></script>
</body>
</html>