<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:46:"themes/admin_simpleboot3/admin/main/index.html";i:1537511893;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<style>
.home_info li em {
    float: left;
    width: 120px;
    font-style: normal;
}
li {
    list-style: none;
}
.nav-tabs>li>a {
    color: #95a5a6;
}
.nav-tabs>.active>a, .nav-tabs>.active>a:hover, .nav-tabs>.active>a:focus {
    color: #39f;
    background-color: transparent;
    border: none;
}
.btn-primary {
    background: #66CCFF;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] {
    background-color: #4d94b7;
}
.form-actions {
    background-color: transparent;
}
.btn-danger {
    background: #FF708D;

}
.btn-danger:hover, .btn-danger:focus, .btn-danger:active, .btn-danger.active, .btn-danger.disabled, .btn-danger[disabled] {
    background: #d25a72;
}
.pagination>a {
  color: #39f;
}
.table-bordered {
    border-collapse: collapse;
}
.table-bordered tr>th {
    color: #39f;
}
p.card_head_title {
  border-left: 2px solid #39f;
  color: #39f !important;
  text-indent: 10px;
}
</style>
<link rel="stylesheet" href="/yitaibi_ml3k9o/public/static/publicb/main.3b2351b2fd5783c56746.css" />
</head>
<body style="">

        <!-- 昨日概况 -->
                    <div data-v-6f7f7716="" class="ivu-row">
                      <div data-v-6f7f7716="" class="ivu-card ivu-card-bordered">
                        <div class="ivu-card-head">
                          <p class="card_head_title" data-v-6f7f7716="" style="text-align: left;">统计数据</p></div>
                        <!---->
                        <div class="ivu-card-body">
                          <div data-v-6f7f7716="" class="ivu-row">

                            <div data-v-6f7f7716="" class="ivu-col ivu-col-span-6">

                              <div data-v-6f7f7716="" class="ivu-card ivu-card-dis-hover">
                                <div class="ivu-card-head">
                                  <p data-v-6f7f7716="">总用户数</p>
                                  <p data-v-6f7f7716=""><?php echo (isset($count['sum']) && ($count['sum'] !== '')?$count['sum']:'0'); ?></p></div>
                                <!---->
                                <div class="ivu-card-body"></div>
                              </div>

                            </div>
                            <div data-v-6f7f7716="" class="ivu-col ivu-col-span-6">
                              <div data-v-6f7f7716="" class="ivu-card ivu-card-dis-hover">
                                <div class="ivu-card-head">
                                  <p data-v-6f7f7716="">今日新用户</p>
                                  <p data-v-6f7f7716=""><?php echo (isset($count['new']) && ($count['new'] !== '')?$count['new']:'0'); ?></p></div>
                                <!---->
                                <div class="ivu-card-body"></div>
                              </div>
                            </div>

                            <div data-v-6f7f7716="" class="ivu-col ivu-col-span-6">
                              <div data-v-6f7f7716="" class="ivu-card ivu-card-dis-hover">
                                <div class="ivu-card-head">
                                  <p data-v-6f7f7716="">挑战次数</p>
                                  <p data-v-6f7f7716=""><?php echo (isset($count['order']) && ($count['order'] !== '')?$count['order']:'0'); ?></p></div>
                                <!---->
                                <div class="ivu-card-body"></div>
                              </div>
                            </div>

                            <div data-v-6f7f7716="" class="ivu-col ivu-col-span-6">
                              <div data-v-6f7f7716="" class="ivu-card ivu-card-dis-hover" style="border-right: 0px;">
                                <div class="ivu-card-head">
                                  <p data-v-6f7f7716="">挑战成功次数</p>
                                  <p data-v-6f7f7716=""><?php echo (isset($count['put']) && ($count['put'] !== '')?$count['put']:'0'); ?></p></div>
                                <!---->
                                <div class="ivu-card-body"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- 累计访问次数 -->
                    <div data-v-6f7f7716="" class="echarts ivu-row" style="margin-top: 20px;">
                      <div data-v-6f7f7716="" class="ivu-card ivu-card-bordered" style="height: 600px;width: 100%;">
                        <div class="ivu-card-head">
                          <p class="card_head_title" data-v-6f7f7716="" style="text-align: left;">新用户增长趋势</p></div>
                        <!---->
                        <div class="ivu-card-body">

                            <div id="maina" style="width:100%;height:550px;">

                            </div>
                        </div>
                      </div>
                    </div>



    <script src="/yitaibi_ml3k9o/public/static/js/jquery.js"></script>

    <script src="/yitaibi_ml3k9o/public/static/js/echarts/echarts.min.js"></script>

  <script>
    // 使用 Canvas 渲染器（默认）
  var myChart = echarts.init(document.getElementById('maina'));
    var option = {
        title: {
            text: '7日详情',
        },
        tooltip: {
            trigger: 'axis'

        },
        legend: {
            data:['新用户'],
        },
        // grid: {
        //     left: '3%',
        //     right: '3%',
        //     bottom: '3%',
        //     containLabel: true
        // },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
         calculable : true,
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: []
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'新用户增加',
                type:'line',
                stack: '总量',
                data:[]
            }
        ]
    };
    myChart.setOption(option);

    $.ajax({
        url: "<?php echo url('get_sum'); ?>",
        type: 'POST',
        dataType: 'json',
        success:function(data){

   // console.log(data);
            var num = data.data.count;
            var day = data.data.day;

            console.log(num);

            var option = myChart.getOption();
            option.series[0].data = num;
            option.xAxis[0].data = day;

            myChart.setOption(option,true);

        }
    });

  </script>
</body>
</html>