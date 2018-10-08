$(function() {
	//获取input值
	var fromc = true;
	$("#reset").click(function() {
		$("#phone").focus();
		var ph = $("#phone").val();
		var msg = $("#vft").val();
		var reset_pwd = $("#password").val();
		var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
		reset_pwd = md5(reset_pwd);
		if (!phoneReg.test(ph)) {
			$(".tan").fadeIn(300);
			setTimeout(function(){$(".tan").fadeOut(300);fromc = true;},1000);
			return false;
		 }
		//else if(msg != 12345) {
		// 	$(".tan").fadeIn(300);
		// 	$(".tan p").text('验证码不正确')
		// 	setTimeout(function(){$(".tan").fadeOut(300);fromc = true;},1000);
		// }
		else{
			console.log(ph);
			console.log(msg);
			console.log(reset_pwd);
			location.href='home.html';
			// window.open('home.html')
		}
	})
})