$(function() {

	var html = "";
	var info = [
		{
			num: 4,
			src: 'images/ranking/pict.png',
			text: '我不吃香菜',
			money: 1000
		},
		{
			num: 5,
			src: 'images/ranking/pict.png',
			text: '我不吃香菜',
			money: 9000
		},
		{
			num: 6,
			src: 'images/ranking/pict.png',
			text: '我不吃香菜',
			money: 3000
		}
	];
	for (var i = 0; i < info.length; i++) {
		info[i]
		html += '<div class="lie">'
			html += '<span>' + info[i].num + '</span>'
			html += '<div class="mx">'
				html += '<div class="tx">'
					html += '<img src="' + info[i].src + '"></div>'
				
				html += '<div class="tet">'
					html += '<p class="name">'+ info[i].text +'</p>'
				html += '</div>'
			html += '</div>'
			html += '<div class="tp">'
				html += '<p>'+ info[i].money +'ETH</p>'
			html += '</div></div>'
		
	}
	$("#list").html(html)
	
})