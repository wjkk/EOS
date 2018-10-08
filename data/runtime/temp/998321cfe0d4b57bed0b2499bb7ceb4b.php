<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"themes/simpleboot3/start_game/bonus.html";i:1537186583;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>答题奖金</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/common.css?v=1.1">
  	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/bonus.css?v=1.1">
  	<script src="/yitaibi_ml3k9o/public/static/js/js/jquery-3.0.0.min.js"></script>
  	<script src="/yitaibi_ml3k9o/public/static/js/js/flexible.js"></script>
</head>
<body>
	<div class="container">
		<!-- <div class="head">
			<h3>答题奖金</h3>
			<div class="box">
				<a href="<?php echo url('center/center'); ?>">
					<img src="/yitaibi_ml3k9o/public/static/images/images/back.png">
				</a>
			</div>
		</div> -->
		<div class="content">
			<div class="switch">
				<button class="on">答题奖金</button>
				<button>领取记录</button>
			</div>

			<div class="list">
				<div id="goldNum" class="is_show show">
					<!-- <div class="lg"></div>
					<h4 class="title">答题奖金瓜分大赛</h4>
					<p><span>活动时间：</span>2018.9.5  20：00</p>
					<p><span>奖励：</span>1000个ETH</p> -->
				</div>
				<p class="no_number" style="color: #666;font-size: 0.4rem;text-align: center;padding: .3rem;display: none;">暂无数据</p>
				<div class="is_show">
					<table>
						<thead>
							<tr>
								<th>序号</th>
								<th>活动名称</th>
								<th>ETH</th>
								<th>购买时间</th>
							</tr>
						</thead>
						<tbody id="getHis">
							
						</tbody>

					</table>
					<p class="record">暂无记录</p>
				</div>
			</div>
		</div>
	</div>

</body>
<!-- <script src="/yitaibi_ml3k9o/public/static/js/js/bonus.js"></script> -->
<script>
	$(function() {
	// 点击切换
	$(".switch button").click(function() {
		$(this).addClass('on').siblings().removeClass('on');
		var index = $(this).index();
		// console.log(index);
		$('.list .is_show').eq(index).addClass('show').siblings().removeClass('show');
	})



	var html = '';
	var html1 = '';

	$.post('<?php echo url("answerGold"); ?>', null, function(data){
		
		if(data.code == 20000) {
			// console.log(data.data);
			var datas =data.data;
		for (var i = 0; i < datas.length; i++) {
				html += '<div class="lie"><div class="lg"></div><h4 class="title">'+ datas[i].a_name +'</h4><p><span>活动时间：</span>'+ datas[i].stime +'</p><p><span>奖励：</span>'+ datas[i].eth + '个ETH</p></div>'
			}
			$('#goldNum').html(html);
		}


	});
	
	
	$.post('<?php echo url("userReceive"); ?>', null, function(data){
		if(data.code == 20000) {
		// console.log(dt);
			var datas =data.data;
			console.log(datas)
		for (var i = 0; i < datas.length; i++) {

			html1 += '<tr><td><span>'+ datas[i].sort +'</sapn></td><td>'+ datas[i].a_name +'</td><td>'+ datas[i].eth +'</td><td>'+ datas[i].add_time +'</td></tr>'		
		}

			if(datas.length<1){
				// $('.record').html('666')
				$('.record').show();

			}else{
				$('#getHis').html(html1)

			}
		}
	});

	//下拉触底
	var off_on = true
	$(".list").scroll(function () {
		var s = $(".list").scrollTop(),//获取滚轮滚动高度
            h = $(".list").height(), //获取$("#list")高度
            documentH = $("#goldNum").height(); //获取最高页面总高度
            //当滚轮滚到距离页面底部100px时开始加载下一页数据
        if ((s + h + 20) >= documentH) {
            if (off_on) {
                getData();
                // console.log(111)
                // off_on = false;
            }
        }
	});
	//要加载的方法
	var page = 1;
	function getData() {
		page++;
		off_on = true;
		var html = '';
	    $.ajax({
	    	type:'post',
	    	url: '<?php echo url("answerGold"); ?>',
	    	data:{page: page},
	    	success: function(data) {
	    		if (data.code == 20000) {
	    			// console.log(2222)
	    			var datas =data.data;
	    			off_on = true;
	    			for (var i = 0; i < datas.length; i++) {
						html += '<div class="lie"><div class="lg"></div><h4 class="title">'+ datas[i].a_name +'</h4><p><span>活动时间：</span>'+ datas[i].stime +'</p><p><span>奖励：</span>'+ datas[i].eth + '个ETH</p></div>'
					}
				    $("#goldNum").append(html)
	    		}
	    		if (data.code == 40500) {

    				off_on = false;
    				$('.no_number').show();
	    		}
	    	}
	    })
	}
	

})
</script>

</html>