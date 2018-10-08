var timer = null;
$(function(){
	// 获取value值
	var fromc = true;

	$(".sign button").click(function() {
		$("#phone").focus();
		var ph = $("#phone").val();
		var pwd = $("#password").val()
		var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
		if (!phoneReg.test(ph)) {
			console.log(1111)
			$(".tan").fadeIn(300);
			setTimeout(function(){$(".tan").fadeOut(300);fromc = true;},1000);
			return false;
		}else{
			pwd = md5(pwd);
			console.log(ph);
			console.log(pwd);
			location.href='home.html';
		}
	})
	
	
})