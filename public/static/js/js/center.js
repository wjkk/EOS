$(function() {
	
	var news = [
		
	];
	var html = '';
	for (var i = 0; i < news.length; i++) {
		news[i]
				
	}
	// $(".card").html(html);

	//弹框
	$(".close").click(function() {
		$(".tan").css('display','none')
	})
	$(".isModal").click(function() {
		$(".tan").css('display','block');
		var that = $(this);
		var type = that.attr('data-type');
		var title = $('#modalBox .title');
		// $('.list .sub').eq(index).addClass('show').siblings().removeClass('show');
		if (type == 0) {
			title.text("充值").css({
				"text-align": "center",
				"padding": "0.267rem 0 0.693rem",
			});
			$('.tan .sub').eq(type).addClass('show').siblings().removeClass('show');
		}else if (type == 1) {
			title.text("购买答题卡").css({
				"text-align": "center",
				"padding": "0.267rem 0 0.3rem",
			});
			$('.tan .sub').eq(type).addClass('show').siblings().removeClass('show');
		}else{
			title.text('我的邀请码：').css({
				"text-align":"left",
				"padding": "0.587rem 0.533rem 0.3rem",
			});
			$('.tan .sub').eq(type).addClass('show').siblings().removeClass('show');
		}
	})

	//全选/复制
	$('#fz').click(function () {
        var Input = $('.addresNm');
         Input.focus()
         Input.select()
         try{
              document.execCommand('copy');
         }catch(e){}                                                     
                                                           
 	})
	
})