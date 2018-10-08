<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"themes/simpleboot3/start_game/answer.html";i:1537177434;}*/ ?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>区块链答题区</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="/yitaibi_ml3k9o/public/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/common.css">
	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/answer.css">
	<script src="/yitaibi_ml3k9o/public/static/js/js/jquery-3.0.0.min.js"></script>
	<script src="/yitaibi_ml3k9o/public/static/js/js/flexible.min.js"></script>
	<script src="/yitaibi_ml3k9o/public/static/js/js/vue.min.js"></script>
	<!-- <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script> -->
</head>

<body>
	<div id='container' class="container" v-cloak>
		<div class="cont">
			<div class="center">
				<div class="head">
					<img :src='head_img'>
					<p v-cloak>{{ name }}</p>
				</div>
			</div>
			<div class="tit">
				<img src="/yitaibi_ml3k9o/public/static/images/images/down_tp.png">
			</div>
			<div class="number">
				<p>3</p>
			</div>
			<!-- 游戏规则 -->
			<div class="mb">
				<div class="rule">
					<h3 class="title">游戏说明</h3>
					<div v-for='(item, i) in explain'>
						<div class="num">{{ i + 1 }}</div>
						<div class="ct">
							<p>{{ item }}</p>
						</div>
					</div>
					
					<!-- <div class="close">x</div> -->
					<button id="go" @click='a'>我知道了</button>
				</div>
			</div>
			<div class="tan tan2 back">
				<h4 class="tit">系统繁忙, 稍后再试！！</h4>
				<p>您已这轮已挑战过或者题库异常</p>
			</div>
		</div>

		<div class="content">
			<div class="an_num">
				<div class="info">
					<img :src="head_img">
					<p>已连续答对<span class="true_num">{{current}}</span>/<span class="tot">{{length}}</span>题</p>
				</div>
				<div class="number">
					<p>第<span>{{current + 1}}</sapn>题</p>
				</div>
			</div>
			<div class="subject">
				<div class="title">
					<h4 class="problem"><div class="lg"></div>{{questions[current].quiz}}</h4>
					<div class="choice" v-for='(item, index) in questions[current].options' :key='index' @click='c(index,questions[current].id)'>
						<div class="fool">
							<img :src="right ? '/yitaibi_ml3k9o/public/static/images/images/true.png' : '/yitaibi_ml3k9o/public/static/images/images/false.png' ">
						</div>
						<p>{{ item }}</p>
					</div>

				</div>
			</div>

			<!-- //弹框 -->
			<div class="tan tan1">
				<h4 class="tit">答错了呦！！</h4>
				<img src="/yitaibi_ml3k9o/public/static/images/images/shib.png">
				<p>你可以选择以下方式继续答题</p>
				<button @click.pevent='bindreceive'>使用复活卡</button>
				<div class="close" @click='bindclose'>
					<div>x</div>
				</div>
			</div>
			<div class="tan tan2 model">
				<h4 class="tit">复活{{ receive ? "成功" : "失败" }}！！</h4>
				<p>{{receive ? "再次答题!! 别再错了哦(只能复活一次) ~" : receiveMsg}}</p>
			</div>

			<div class="tan tan2 success">
				<h4 class="tit">挑战成功！！</h4>
				<p>正在结算中...</p>
			</div>
		</div>
		<p v-if='questions[current].contributor && start'>本题库由{{ questions[current].contributor }}提供</p>
	</div>

</body>
<script>
	$(function () {
		function GetUrlParam(paraName) {
			var url = document.location.toString();
			var arrObj = url.split("?");

			if (arrObj.length > 1) {
				var arrPara = arrObj[1].split("&");
				var arr;

				for (var i = 0; i < arrPara.length; i) {
					arr = arrPara[i].split("=");

					if (arr != null && arr[0] == paraName) {
						return arr[1];
					}
				}
				return "";
			} else {
				return "";
			}
		}
		let current_cid = GetUrlParam('cid');
		$.post("<?php echo url('Questions/startGame'); ?>", {
			cid: current_cid
		}, function (data) {
			console.log(data);
			if (data.code == 20000) {
				let res = data.data;
				res.questions.forEach(item => {
					item.options = JSON.parse(item.options);
				});
				$('.center').show();
				let vm = new Vue({
					el: '#container',
					data: {
						cid: res.cid,
						head_img: res.head_img,
						name: res.name,
						questions: res.questions,
						wait: 3,
						current: 0,
						length: res.questions.length,
						right: true,
						receive: false,
						receiveMsg: '',
						target: -1,
						mark: true,
						explain: res.explain,
						start: false
					},
					methods: {
						a() {
							let that = this;
							$(".mb").hide();
							that.timeOut();
						},
						b() {
							$(".tan").css("display", "none");
						},
						c(i, id) {
							if (this.mark) {
								this.mark = false;
								this.target = i * 1;
								$.post("<?php echo url('Questions/userAnswer'); ?>", {
									cid: this.cid,
									id,
									answer: this.target + 1
								}, (data) => {
									if (data.code == 20000) {
										this.right = true;
										$('.choice').eq(i).css('background', "#2EC96D")
										$('.choice').eq(i).find(".fool").show();
										setTimeout(() => {
											if (this.current == this.length - 1) {
												$(".tan.tan2.success").show();
												setTimeout(() => {
													$(".tan.tan2.success").hide();
													this.bindclose();
												}, 1200)
												return false;
											}
											this.current++;
											this.resetList();
										}, 800);
									} else {
										this.right = false;
										$('.choice').eq(i).css('background', "#FD3F42")
										$('.choice').eq(i).find(".fool").show();
										if (!this.receive) {
											$(".tan.tan1").show();
										} else {
											setTimeout(() => {
												this.bindclose();
											}, 800)
										}

									}
								})
							}

						},
						resetList() {
							$('.choice').eq(this.target).css('background', "");
							$('.choice').eq(this.target).find(".fool").hide();
							this.mark = true;
						},
						bindreceive() {
							$.post("<?php echo url('Questions/receive'); ?>", {
								cid: this.cid
							}, (data) => {
								$(".tan.tan1").hide();
								if (data.code == 20000) {
									this.receive = true;
									$(".tan.tan2.model").show();
									setTimeout(() => {
										$(".tan.tan2.model").hide();
										this.resetList();
									}, 1200);
								} else {
									this.receiveMsg = data.msg;
									this.receive = false;
									$(".tan.tan2.model").show();
									setTimeout(() => {
										this.bindclose();
										this.mark = true;
									}, 1200);
								}
							})
						},
						// 挑战结算
						bindclose() {
							// var pid = 3;//要带入的变量 
							// var str = "<?php echo url('Index/detail',array('id'=>'p_id')); ?>"; //先将变量以字符串的形式带入U函数中 
							// str1 = str.replace("P_id",pid); //将代替变量的字符串用真实变量替换掉，OK搞定！ 
							// $("#city_id").load(str1);

							let a = this.cid;
							let url = "<?php echo url('Questions/end'); ?>?cid=" + a;
							window.location.href = url;
						},
						timeOut() {
							let that = this;
							if (this.wait == 0) {
								$('.cont .number>p').text('GO').css({
									'font-size': "60px",
								});
								this.start = true;
								setTimeout(function () {
									$(".cont").css('display', "none")
									$(".content").css('display', "block")
								}, 1000)
							} else {
								setTimeout(function () {
									that.wait--;
									$('.cont .number>p').text(that.wait);
									that.timeOut();
								}, 1000)
							}
						}
					}
				});
			} else {
				$(".rule").hide();
				$(".tan.tan2.back").show();
				setTimeout(() => {
					// $(".tan.tan2.back").hide();
					window.location.href = "<?php echo url('Questions/getGlobalInfo'); ?>";
				}, 1500)
			}

		});
	});
</script>
<!-- <script src="/yitaibi_ml3k9o/public/static/js/js/answer.js"></script> -->


</html>