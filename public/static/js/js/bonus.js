$(function() {
	// 点击切换
	$(".switch button").click(function() {
		$(this).addClass('on').siblings().removeClass('on');
		var index = $(this).index();
		// console.log(index);
		$('.list .is_show').eq(index).addClass('show').siblings().removeClass('show');
	})

	// 循环列表
	var list = [
		{
			title: '答题奖金瓜分大赛',
			time: '2018.9.5  20：00',
			reward: '1000个ETH'
		},
		{
			title: '挑战之夜',
			time: '2018.10.15  19：30',
			reward: '800个ETH'
		},
		{
			title: '乐淘淘大赛',
			time: '2018.10.15  19：30',
			reward: '1200个ETH'
		},
		{
			title: '竞猜有奖',
			time: '2018.11.11  20：00',
			reward: '1500个ETH'
		}

	];

	var table = [
		{
			id: 1,
			name: '瓜分奖金大赛',
			ETH: 1000,
			time: '2018/7/4'
		}
	];
	var html = '';
	var html1 = '';

	
		for (var i = 0; i < list.length; i++) {
			list[i]
			html += '<div class="lie"><div class="lg"></div><h4 class="title">'+ list[i].title +'</h4><p><span>活动时间：</span>'+ list[i].time +'</p><p><span>奖励：</span>'+ list[i].title + '</p></div>'
		}
		$('#goldNum').html(html);

	
		for (var i = 0; i < table.length; i++) {
			table[i]
			html1 += '<tr><td><span>'+ table[i].id +'</sapn></td><td>'+ table[i].name +'</td><td>'+ table[i].ETH +'</td><td>'+ table[i].time +'</td></tr>'		
		}
		$('#getHis').html(html1)
	
})