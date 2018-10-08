$(function(){

	// 奖金
	var html = '';
	var arr = '12345.56';
	for (var i = 0; i < arr.length; i++) {
		html +=	'<li>' + arr[i] + '</li>'
	}
	$(".money ul").html(html);

	//规则
	$(".gz").click(function() {
		$(".rule").css("display","block")
	})

	$(".close").click(function() {
		$(".rule").css("display","none")
	})
})