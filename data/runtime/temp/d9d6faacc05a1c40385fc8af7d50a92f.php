<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:48:"themes/admin_simpleboot3/admin/setting/site.html";i:1537519928;s:77:"/mnt/kh_xcx/yitaibi_ml3k9o/public/themes/admin_simpleboot3/public/header.html";i:1526536240;}*/ ?>
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
      <li class="active"><a href="#B" data-toggle="tab">短信参数配置</a></li>
        <li><a href="#A" data-toggle="tab">答题规则</a></li>
        <li><a href="#C" data-toggle="tab">游戏说明</a></li>


    </ul>
    <form class="form-horizontal js-ajax-form margin-top-20" role="form" action="<?php echo url('setting/sites'); ?>"
          method="post">
        <fieldset>
            <div class="tabbable">
              <div class="tab-content">

                    <div class="tab-pane active" id="B">

                      <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">AppID </label>
                         <div class="col-md-6 col-sm-10">
                             <input style="width: 250px;" type="text" class="form-control" id="input-site_icp" name="options[txy_sms_appid]"
                                    value="<?php echo $options['txy_sms_appid']; ?>">
                         </div>
                     </div>
                      <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">App Key</label>
                         <div class="col-md-6 col-sm-10">
                             <input style="width: 250px;" type="text" class="form-control" id="input-site_icp" name="options[txy_sms_appkey]"
                                    value="<?php echo $options['txy_sms_appkey']; ?>">
                         </div>
                     </div>
                      <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">签名ID</label>
                         <div class="col-md-6 col-sm-10">
                             <input style="width: 250px;" type="text" class="form-control" id="input-site_icp" name="options[txy_sms_smssign]"
                                    value="<?php echo $options['txy_sms_smssign']; ?>">
                         </div>
                     </div>
                      <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">模板ID</label>
                         <div class="col-md-6 col-sm-10">
                             <input style="width: 250px;" type="text" class="form-control" id="input-site_icp" name="options[txy_sms_templateId]"
                                    value="<?php echo $options['txy_sms_templateid']; ?>">
                         </div>
                     </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                    <?php echo lang('SAVE'); ?>
                                </button>
                            </div>
                        </div>
                    </div>

 <div class="tab-pane " id="C">

                  <div class="form-group">
                     <label for="input-site_icp" class="col-sm-2 control-label">游戏说明1 </label>
                     <div class="col-md-6 col-sm-10">
                         <input style="width: 550px;" type="text" class="form-control" id="input-site_icp" name="options[rule6]"
                                value="<?php echo $options['rule6']; ?>">
                     </div>
                 </div>
                  <div class="form-group">
                     <label for="input-site_icp" class="col-sm-2 control-label">游戏说明2</label>
                     <div class="col-md-6 col-sm-10">
                         <input style="width: 550px;" type="text" class="form-control" id="input-site_icp" name="options[rule7]"
                                value="<?php echo $options['rule7']; ?>">
                     </div>
                 </div>


                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                                <?php echo lang('SAVE'); ?>
                            </button>
                        </div>
                    </div>
                </div>

           <div class="tab-pane" id="A">

                        <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">答题题数</label>
                         <div class="col-md-6 col-sm-10">
                             <input style="width: 250px;" type="text" class="form-control" id="input-site_icp" name="options[q_num]"
                                    value="<?php echo $options['q_num']; ?>">
                         </div>
                     </div>


                        <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">复活卡金额</label>
                         <div class="col-md-6 col-sm-10">
                             <input style="width: 250px;" type="text" class="form-control" id="input-site_icp" name="options[revive_card]"
                                    value="<?php echo $options['revive_card']; ?>">
                         </div>
                     </div>

                        <div class="form-group">
                            <label for="input-site_seo_keywords" class="col-sm-2 control-label">答题规则</label>
                            <div class="col-md-6 col-sm-10">
                                <?php if(is_array($options['rule']) || $options['rule'] instanceof \think\Collection || $options['rule'] instanceof \think\Paginator): $k = 0; $__LIST__ = $options['rule'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?>
                                <input type="text" class="form-control" id="input-site_seo_keywords"
                                name="options[rule][<?php echo $k-1; ?>]" value="<?php echo $vo; ?>"></br>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </div>
                        </div>

                <!--      <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">答题规则1</label>
                         <div class="col-md-6 col-sm-10">

                            <input style="width: 750px;" type="text" class="form-control" id="input-site_icp"  name="options[rule1]" value="<?php echo $options['rule1']; ?>">

                         </div>
                     </div>

                      <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">答题规则2</label>
                         <div class="col-md-6 col-sm-10">

                            <input style="width: 750px;" type="text" class="form-control" id="input-site_icp"  name="options[rule2]" value="<?php echo $options['rule2']; ?>">

                         </div>
                     </div>

                     <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">答题规则3</label>
                         <div class="col-md-6 col-sm-10">

                            <input style="width: 750px;" type="text" class="form-control" id="input-site_icp"  name="options[rule3]" value="<?php echo $options['rule3']; ?>">

                         </div>
                     </div>

                      <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">答题规则4</label>
                         <div class="col-md-6 col-sm-10">
                            <input style="width: 750px;" type="text" class="form-control" id="input-site_icp"  name="options[rule4]" value="<?php echo $options['rule4']; ?>">
                         </div>
                     </div>

                       <div class="form-group">
                         <label for="input-site_icp" class="col-sm-2 control-label">答题规则5</label>
                         <div class="col-md-6 col-sm-10">
                            <input style="width: 750px;" type="text" class="form-control" id="input-site_icp"  name="options[rule5]" value="<?php echo $options['rule5']; ?>">

                         </div>
                     </div> -->

                  <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                          <button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0">
                              <?php echo lang('SAVE'); ?>
                          </button>
                      </div>
                  </div>
              </div>



                </div>
            </div>
        </fieldset>
    </form>

</div>
<script type="text/javascript" src="/yitaibi_ml3k9o/public/static/js/admin.js"></script>
</body>
</html>