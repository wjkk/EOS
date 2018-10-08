<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:42:"themes/simpleboot3/start_game/ranking.html";i:1537187533;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>排行榜</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/common.css?v=1.1">
  	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/ranking.css?v=1.2">
  	<script src="/yitaibi_ml3k9o/public/static/js/js/jquery-3.0.0.min.js"></script>
  	<script src="/yitaibi_ml3k9o/public/static/js/js/flexible.js"></script>
</head>
<body>
	<div class="container">
		<div class="center">
			<div class="info">
				<div class="img">
					<img src="<?php echo $user['head_img']; ?>">
				</div>
				<div class="place">
					<p>我的名次：<?php echo $user['sort']; ?></p>
				</div>
				<div class="eth">
					<p>获得ETH：<?php echo $user['eth']; ?></p>
				</div>
			</div>

			<div class="rank">
           
			</div>

			<div class="list_in" id="list_in" style="height: 8.533rem;overflow:scroll;margin-top: 0.667rem;">

				<div class="list" id="list">
					
				</div>
				<p class="no_number" style="color: #666;font-size: 0.4rem;text-align: center;padding: .3rem;display: none;">暂无数据</p>
				<!-- <div class="lie">
					<span>4</span>
					<div class="mx">
						<div class="tx">
							<img src="images/ranking/pict.png">
						</div>
						<div class="tet">
							<p class="name">我不吃香菜</p>
						</div>
					</div>
					<div class="tp">
						<p>1000ETH</p>
					</div>
				</div> -->
				
			</div>
			
		</div>
	</div>
</body>
<!-- <script src="/yitaibi_ml3k9o/public/static/images/js/ranking.js"></script> -->
<script>
    $(function() {

	    var html1 = "";
	    var html = '';
	    $.ajax({
	    	type:'post',
	    	url: "<?php echo url('Ranking/info'); ?>",
	    	data:{},
	    	success: function(data) {
	    		if (data.code == 20000) {
	    			// console.log(data.o_user);
	    			var arr = data.o_user
	    			var top = arr.slice(0,3);
	    			var end = arr.splice(0,3);
	    			// console.log(arr)
	    			html1 = '<div class="no2"><div class="head"><div class="img"><img src="' + top[1].head_img + '"><div class="number"><p>' + top[1].sort + '</p></div></div></div><p class="name">' + top[1].name + '</p><p class="money">ETH：'+ top[1].eth + '</p></div><div class="no1"><div class="head"><div class="img"><img src="'+top[0].head_img+'"><div class="number"><p>'+ top[0].sort +'</p></div></div></div><p class="name">'+ top[0].name + '</p><p class="money">ETH：'+ top[0].eth +'</p></div><div class="no3"><div class="head"><div class="img"><img src="'+ top[2].head_img +'"><div class="number"><p>'+ top[2].sort+ '</p></div></div></div><p class="name">'+ top[2].name+ '</p><p class="money">ETH：'+ top[2].eth +'</p></div>'
	    			for (var i = 0; i < arr.length; i++) {
				        arr[i]
				        html += '<div class="lie">'
				            html += '<span>' + arr[i].sort + '</span>'
				            html += '<div class="mx">'
				                html += '<div class="tx">'
				                    html += '<img src="' + arr[i].head_img + '"></div>'
				                
				                html += '<div class="tet">'
				                    html += '<p class="name">'+ arr[i].name +'</p>'
				                html += '</div>'
				            html += '</div>'
				            html += '<div class="tp">'
				                html += '<p>'+ arr[i].eth +'ETH</p>'
				            html += '</div></div>'
				        
				    }

	    			$(".rank").html(html1)
				    $("#list").html(html)
	    		}
	    	}
	    })

	    //下拉触底
		var off_on = true
		$("#list_in").scroll(function () {
			var s = $("#list_in").scrollTop(),//获取滚轮滚动高度
	            h = $("#list_in").height(), //获取$("#list")高度
	            documentH = $("#list").height(); //获取最高页面总高度
	            //当滚轮滚到距离页面底部100px时开始加载下一页数据
	        if ((s + h + 20) >= documentH) {
	            if (off_on) {
	                getData();
	                // off_on = false;
	            }
	        }
		});

	//要加载的方法
	var page = 1;
	function getData() {
		page++;
		var html = '';
	    $.ajax({
	    	type:'post',
	    	url: "<?php echo url('Ranking/info'); ?>",
	    	data:{page: page},
	    	success: function(data) {
	    		if (data.code == 20000) {
	    			var arr = data.o_user
	    			// console.log(data.o_user);
	    			if (arr == '') {
	    				off_on = false;
	    				$('.no_number').show();
	    			}else{
	    				off_on = true;
	    			}
	    			// var end = arr.splice(0,3);
	    			// console.log(arr)
	    			for (var i = 0; i < arr.length; i++) {
				        arr[i]
				        html += '<div class="lie">'
				            html += '<span>' + arr[i].sort + '</span>'
				            html += '<div class="mx">'
				                html += '<div class="tx">'
				                    html += '<img src="' + arr[i].head_img + '"></div>'
				                
				                html += '<div class="tet">'
				                    html += '<p class="name">'+ arr[i].name +'</p>'
				                html += '</div>'
				            html += '</div>'
				            html += '<div class="tp">'
				                html += '<p>'+ arr[i].eth +'ETH</p>'
				            html += '</div></div>'
				        
				    }

				    $("#list").append(html)
	    		}
	    	}
	    })
	}
	   
	    
	})
</script>
</html>