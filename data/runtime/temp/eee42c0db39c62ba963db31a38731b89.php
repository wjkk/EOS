<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"themes/simpleboot3/start_game/home.html";i:1537520394;}*/ ?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>区块英雄大会</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/common.css?v=1.3">
	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/home.css?v=2.8">
	<script src="/yitaibi_ml3k9o/public/static/js/js/jquery-3.0.0.min.js"></script>
	<script src="/yitaibi_ml3k9o/public/static/js/js/flexible.js"></script>
</head>

<body>

	<div class="container">
		<!-- <div class="head">
			<h3>区块链答题</h3>
			<div class="box">
				<a href="<?php echo url('register/login'); ?>">
					<img src="/yitaibi_ml3k9o/public/static/images/images/back.png">
				</a>
			</div>
		</div> -->
		<img src="/yitaibi_ml3k9o/public/static/images/images/home_bg.png">
		<div class="contai">
			<div class="content">
				<div class="time">

					<p class="strat"><?php if(empty($data) || (($data instanceof \think\Collection || $data instanceof \think\Paginator ) && $data->isEmpty())): ?>暂无活动<?php else: ?>本次活动<?php echo $data['stime']; ?>开始<?php endif; ?></p>
					<div class="money">
						<ul>

						</ul>
					</div>
					<div class="gz"></div>
				</div>
				<div class="start">
					<a href="javascript:;" id='get'>
						<img src="/yitaibi_ml3k9o/public/static/images/images/start_answer.png">
					</a>
				</div>
				<div class="tan tan2">
					<h4 class="tit">开始失败！！</h4>
					<p></p>
				</div>
			</div>
			<div class="foot">
				<ul>
					<li>
						<a href="<?php echo url('gold/userReceive'); ?>">
							<img src="/yitaibi_ml3k9o/public/static/images/images/nav1.png">
							<p>答题奖金</p>
						</a>
					</li>
					<li>
						<a href="<?php echo url('ranking/index'); ?>">
							<img src="/yitaibi_ml3k9o/public/static/images/images/nav2.png">
							<p>排行榜</p>
						</a>
					</li>
					<li>
						<a href="<?php echo url('center/center'); ?>">
							<img src="/yitaibi_ml3k9o/public/static/images/images/nav3.png">
							<p>个人中心</p>
						</a>
					</li>
				</ul>
			</div>

			<div class="rule">
				<h3 class="title">答题规则</h3>
				<?php if(empty($rule) || (($rule instanceof \think\Collection || $rule instanceof \think\Paginator ) && $rule->isEmpty())): ?>
					<p style="text-align: center;margin-top: 50px">暂无数据</p>
					<?php else: if(is_array($rule) || $rule instanceof \think\Collection || $rule instanceof \think\Paginator): $i = 0; $__LIST__ = $rule;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<div>
					<div class="num"><?php echo $i; ?></div>
					<div class="ct">
						<p><?php echo (isset($vo) && ($vo !== '')?$vo:''); ?></p>
					</div>
				</div>

				<?php endforeach; endif; else: echo "" ;endif; endif; ?>

<!--
				<div>
					<div class="num">2</div>
					<div class="ct">
						<p><?php echo (isset($rule2) && ($rule2 !== '')?$rule2:''); ?></p>
					</div>
				</div>
				<div>
					<div class="num">3</div>
					<div class="ct">
						<p><?php echo (isset($rule3) && ($rule3 !== '')?$rule3:''); ?></p>
					</div>
				</div>
				<div>
					<div class="num">4</div>
					<div class="ct">
						<p><?php echo (isset($rule4) && ($rule4 !== '')?$rule4:''); ?></p>
					</div>
				</div>
				<div>
					<div class="num">5</div>
					<div class="ct">
						<p><?php echo (isset($rule5) && ($rule5 !== '')?$rule5:''); ?></p>
					</div>
				</div> -->
				<div class="close">x</div>

			</div>
		</div>

	</div>

</body>
<!-- <script type="text/javascript" src="js/home.js"></script> -->
<script>
	$(function () {

		// 奖金
		var html = '';
		var arr = "<?php echo $data['eth']; ?>";
		for (var i = 0; i < arr.length; i++) {
			html += '<li>' + arr[i] + '</li>'
		}
		$(".money ul").html(html);

		//规则
		$(".gz").click(function () {
			$(".rule").css("display", "block")
		})

		$(".close").click(function () {
			$(".rule").css("display", "none")
		});
		$('#get').click(() => {
			$.post("<?php echo url('Questions/answerCard'); ?>", (data) => {
				console.log(data);
				if (data.code == 20000) {
					let a = data.cid;
					let url = "<?php echo url('Questions/getGameFlag'); ?>?cid=" + a;
					// url1 = url.replace('_id', a);
					window.location.href = url;
				} else {
					$(".tan.tan2>p").text(data.msg);
					$(".tan.tan2").show();
					setTimeout(() => {
						$(".tan.tan2").hide();
					}, 1200)
				}
			})
		})
	})
</script>

</html>