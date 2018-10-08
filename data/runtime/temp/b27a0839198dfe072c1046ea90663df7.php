<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"themes/simpleboot3/start_game/center.html";i:1537238469;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>个人中心</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/common.css?v=1.1">
  	<link rel="stylesheet" type="text/css" href="/yitaibi_ml3k9o/public/static/css/center.css?v=1.2">
  	<script src="/yitaibi_ml3k9o/public/static/js/js/jquery-3.0.0.min.js"></script>
  	<script src="/yitaibi_ml3k9o/public/static/js/js/flexible.js"></script>
</head>
<body>
	<div class="container">
		<div class="center">
			<div class="head">
			
           <!--  <em class="upload-btn">
                <input type="file" name="pic1" id="pic" accept="image/gif,image/jpeg,image/x-png"/>
            </em>
			<img src="<?php echo $data['head_img']; ?>" > -->
            <div id="preview" class="upload-btn">
                <img id="imghead" border="0" src="<?php echo $data['head_img']; ?>" onclick="$('#previewImg').click();">
            </div>         
            <input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg">
			
            <!-- <p><span><?php echo $data['name']; ?></span></p> -->
			<p><input id="name" type="text" value="<?php echo $data['name']; ?>"></p>


			</div>
			<div class="money">
				<p>余额：<span><?php echo $data['eth']; ?></span>ETH</p>
				<a>
					<button class="cz isModal" data-type="0">充值</button>
				</a>
				<a href="extract.html">
					<button class="tx">提现</button>
				</a>
			</div>
			<div class="card">
				<div class="card_num" style="background: url('/yitaibi_ml3k9o/public/static/images/images/center/dt.png') no-repeat 0 0;background-size: 100% 100%;">
					<div class="news">
						<h4>答题卡</h4>
						<p>剩余卡数：<?php echo $data['answer_card']; ?>张</p>
						<button class="isModal buys" data-type="1">点击购买</button>
					</div>
				</div>
				<div class="card_num" style="background: url('/yitaibi_ml3k9o/public/static/images/images/center/fh.png') no-repeat 0 0;background-size: 100% 100%;">
					<div class="news">
						<h4>复活卡</h4>
						<p>剩余卡数：<?php echo $data['revive_card']; ?>张</p>
						<!-- <button>点击购买</button> -->
					</div>
				</div>
				<div class="card_num" style="background: url('/yitaibi_ml3k9o/public/static/images/images/center/yq.png') no-repeat 0 0;background-size: 100% 100%;">
					<div class="news">
						<h4>邀请码</h4>
						<?php if(empty($data['invite_code']) || (($data['invite_code'] instanceof \think\Collection || $data['invite_code'] instanceof \think\Paginator ) && $data['invite_code']->isEmpty())): ?><p> </p>
						<button class="isModal code" data-type="2">获取邀请码</button>
						<?php else: ?>
						<p><?php echo $data['invite_code']; ?></p>
						<?php endif; ?>

					</div>
				</div>
			</div>
		</div>
		<!-- 弹框 -->
		<div class="tan" id="modalBox">
			<div class="content">
				<h3 class="title"></h3>
				<div class="money sub">
					<label>充值金额</label>
					<div class="ipt">￥
						<input type="number" value="">
					</div>
					<div class="qr">
						<button>确认</button>
					</div>
				</div>
				<div class="cont sub">
					<div class="num">
						<label>个数：</label>
						<input type="number" placeholder="购买个数" id="buyGold">
					</div>
					<div class="num">
						<label>充值金额：</label>
						<input type="text" value="" readonly="readonly" id="payMoney">
					</div>
					<button class="zf">立即支付</button>
				</div>
				<div class="yqm sub">
					<input type="text" class="addresNm" value="<?php echo $data['invite_code']; ?>" readonly="readonly">
					<button class="fz" id="fz">复制邀请码</button>
				</div>
			</div>
            <input type="hidden" name="" id="reviveCard" value="<?php echo $revive_card; ?>" >
			<div class="close">
				<div>x</div>
			</div>
		</div>
	</div>

</body>
<script>
$('body').on('click', '.buys', function(){
        $('#modalBox').show();
       var title = $('#modalBox .title');
        
        title.text("购买答题卡").css({
                "text-align": "center",
                "padding": "0.267rem 0 0.3rem",
            });
        $('.tan .sub').eq(1).addClass('show').siblings().removeClass('show');
        return;
});
$('body').on('click', '.zf', function(){
        var eth = $('#payMoney').val();
        var buyGold = $('#buyGold').val();
        // alert(buyGold);return false;
        // console.log(eth);return false;

        $.post("<?php echo url('buyRevive'); ?>", {eth:eth,revive_card:buyGold}, function(data) {

        alert(data.msg);
        setTimeout(function(){
                              window.location.reload();
                        },700);
    });
});
$('#buyGold').keyup(function() {
    var num = $(this).val();
    var reviveCard = $('#reviveCard').val();
    var numNwe = (num * reviveCard).toFixed(2);
    console.log(reviveCard);
    console.log(numNwe);
    $('#payMoney').val(numNwe);

})

$(".close").click(function() {
        $(".tan").css('display','none')
    })

$('body').on('click', '.code', function() {


		$.post("<?php echo url('invite'); ?>", null, function(data) {
            setTimeout(function(){

                              // window.location.href="https://xcx.kh.gzzh.ren/yitaibi_ml3k9o/public/index.php/start_game/center/center";
                              window.location.reload();
                        },1000);
		alert(data.msg);
	});
});


</script>

<script type="text/javascript">
 //上传图片
    // $('#pic').change(function(event) {
       
    //     var that = $(this);
    //     var formData = new FormData();
    //     formData.append("file", that.get(0).files[0]);
    //     alert(formData.has('file'));
    //     console.log(formData.get('file'));
    //     $.ajax({
    //         url:"<?php echo url('center/upload'); ?>",  //改头像
    //         type:'POST',
    //         data:formData,
    //         cache: false,
    //         contentType: false,    //不可缺
    //         processData: false,    //不可缺
    //         success:function(data){
    //             alert(data.msg);

    //             if (data.code == 20000) {
    //                     setTimeout(function(){

    //                           // window.location.href="https://xcx.kh.gzzh.ren/yitaibi_ml3k9o/public/index.php/start_game/center/center";
    //                         window.location.reload();
    //                     },1000);
    //             }else{
    //                 alert(data.msg);
    //             }
    //             // console.log(data)
    //         },error: function(data){
    //             alert(data);
    //         }
    //     });
    // });

    //修改名字
    $('.head #name').change(function() {
    	var sel = $(this).val();
    	$.ajax({
    		type:'POST',
    		url:"<?php echo url('center/name'); ?>",
    		data: {name:sel},
    		success: function(data){
    			alert(data.msg);
                setTimeout(function(){
                              window.location.reload();
                        },700);
    		}
    	})
    })


    function uploadPto (url) {
         $.ajax({
            url:"<?php echo url('center/upload'); ?>",  //改头像
            type:'POST',
            data: {imgPto:url},
            success:function(data){
                
                if (data.code == 20000) {
                    alert(data.msg);
                }else{
                    alert(data.msg);
                }
            }
        })
    }

      //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
          var MAXWIDTH  = 90; 
          var MAXHEIGHT = 90;
          var div = document.getElementById('preview');

          if (file.files && file.files[0])
          {
              div.innerHTML ='<img id=imghead onclick=$("#previewImg").click()>';
              var img = document.getElementById('imghead');

              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                // img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){
                        img.src = evt.target.result;
                        uploadPto(img.src);
                        console.log(img.src);
                }
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            uploadPto(src);
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight ){
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight ){
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else{
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }


    // $('.facade').bind('click',function(){
    //     $('#facadeInput').click();
    // })

    // $('#facadeInput').bind('change',function(){
    //     var obj = $(this);

    //     if( $(this).get(0).files[0] == ''){
    //         return 0;
    //     }
    //     var formData = new FormData();
    //     formData.append('facadepic',$(this).get(0).files[0]);

    //     formData.append("name",'facadepic');



    //     $.ajax({
    //         url: '<?php echo url("upload"); ?>',
    //         type: 'POST',
    //         data: formData,
    //         cache:false,
    //         contentType:false,
    //         processData:false,
    //         success:function(data){
    //             if( data.code == 1 ){
    //                 $('#facade').attr('src','\\'+data.data.data);
    //                 $('#facade_img').val( data.data.datebaseName );

    //             }
    //             // console.log(data);return false;
    //         }
    //     });
    // })
</script>

<!-- <script type="text/javascript" src="/yitaibi_ml3k9o/public/static/js/js/center.js"></script> -->
</html>