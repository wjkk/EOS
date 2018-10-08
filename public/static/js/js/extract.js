$(function() {
	var list = [
		{
			time:'2018/7/4',
			nunder: 1000,
			state:'已到账'
		},
		{
			time:'2018/7/4',
			nunder: 1000,
			state:'已到账'
		},
		{
			time:'2018/7/4',
			nunder: 1000,
			state:'已到账'
		}
	];
	var html = '';
	for (var i = 0; i < list.length; i++) {
		html += '<tr><td>'+ list[i].time + '</td><td>' + list[i].nunder+'</td><td>' + list[i].time + '</td></tr>'
	}
	$('tbody').html(html);

	// 全部提现
	$("#button").click(function() {
		let tot = $("#tot").text();
		$("#money").val(tot);
	})
})