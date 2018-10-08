$(function(){

	// 获取value值
	var fromc = true;

	$(".sign button").click(function() {
		$("#phone").focus();
		var ph = $("#phone").val();
		var prov = $("#vft").val();
		var pwd = $("#password").val();
		var itt = $("#invitation").val();
		var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
		pwd = md5(pwd);
		if (!phoneReg.test(ph)) {
			$(".tan").fadeIn(300);
			setTimeout(function(){$(".tan").fadeOut(300);fromc = true;},1000);
			return false;
		}else{
			console.log(ph);
			console.log(prov);
			console.log(pwd);
			console.log(itt);
		}
	})
})