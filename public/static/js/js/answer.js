

$(function () {
	//倒计时
	var wait = 3;
	$("#go").click(function () {
		timeOut();
		$(".mb").hide();
	});

	function timeOut() {
		if (wait == 0) {
			$('.cont .number>p').text('GO').css({
				'font-size': "60px",
			});
			setTimeout(function () {
				$(".cont").css('display', "none")
				$(".content").css('display', "block")
			}, 1000)
			console.log('结束了')
		} else {
			setTimeout(function () {
				wait--;
				$('.cont .number>p').text(wait);
				timeOut();
			}, 1000)
		}
	}

	//选择
	$('.choice').click(function () {
		var index = $(this).index() - 1;
		if (index == 1) {
			//答对
			$(this).css('background', "#2EC96D")
			$(this).find(".fool").show();
		} else if (index == 2) {
			//答错
			$(this).css('background', "#FD3F42")
			$(this).find(".fool img").attr("src", "images/false.png");
			$(this).find(".fool").show();
			$(".tan").show();
		} else if (index == 3) {
			location.href = "success.html"
		} else {

		}
		console.log(index)
		// 挑战成功

	});

	$(".close").click(function () {
		$(".tan").css("display", "none");
	})
})