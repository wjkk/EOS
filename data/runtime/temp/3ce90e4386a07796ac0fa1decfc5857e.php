<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:42:"themes/simpleboot3/start_game/success.html";i:1537178742;}*/ ?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>挑战结果</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/common.css">
	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/success.css">
	<script src="/yitaibi_ml3k9o/public/static/js/js/jquery-3.0.0.min.js"></script>
	<script src="/yitaibi_ml3k9o/public/static/js/js/flexible.js"></script>
	<script src="/yitaibi_ml3k9o/public/static/js/js/vue.min.js"></script>
</head>

<body>
	<div id='container' class="container" v-cloak>
		<div class="head">
			<img :src="head_img">
			<p v-cloak>{{ name }}</p>
		</div>
		<!-- 成功 -->
		<div class="vty" v-if='success'>
			<div class="img">
				<img class="jb" src="/yitaibi_ml3k9o/public/static/images/images/jb.png">
				<img class="text" src="/yitaibi_ml3k9o/public/static/images/images/text.png">
			</div>
			<div class="pm">
				<p v-cloak>{{ time_msg }}</p>
				<p class="number" v-cloak>{{ time }}</p>
			</div>
			<div class="btn mroe">
				<a href="<?php echo url('Questions/getGlobalInfo'); ?>">
					<button>返回首页</button>
				</a>
				
			</div>
		</div>
		<!-- 失败 -->
		<div class="fail" v-else>
			<div class="img">
				<img class="fail" src="/yitaibi_ml3k9o/public/static/images/images/frail.png">
				<img class="ph" src="/yitaibi_ml3k9o/public/static/images/images/jj.png">
				<p>我想一个人静静</p>
				<p v-if='msg'>{{ msg }}</p>
			</div>
			<p></p>
			<div class="btn mroe">
				<a href="<?php echo url('Questions/getGlobalInfo'); ?>">
					<button>返回首页</button>
				</a>
			</div>
			
		</div>
	</div>

</body>
<!-- <script src="/yitaibi_ml3k9o/public/static/js/js/success.js"></script> -->
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
		let cid = GetUrlParam('cid');
		$.post("<?php echo url('Questions/dealResult'); ?>", {
			cid,
		}, (data) => {
			console.log(data);
			var res = data.data;
			var vm = new Vue({
				el: '#container',
				data: {
					success: false,
					head_img: res && res.head_img || "",
					name: res && res.name || "",
					time: data.balance && data.balance.time || '',
					time_msg: data.balance && data.balance.msg || '',
					msg: data.msg || '',
				},
				methods: {

				}
			})
			if(data.code === 20000) {
				vm.success =  true;
			}
			
		})
	});
</script>

</html>