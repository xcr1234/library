// JavaScript Document

$(function(){
	//语音通知手风琴效果
	$(".voice_2 ul li").each(function(){
		var fold = $(this).find(".fold");
		var unfold = $(this).find(".unfold");
		if(fold.is(":hidden")){
			$(this).width(880);
		}else{
			$(this).width(60);
		}
	})
	$(".voice_2 ul li").click(function(){
		var li_index = $(this).index();
		$(this).animate({width:880},160);
		$(this).find(".unfold").show();
		$(this).find(".fold").hide();
		$(this).siblings().animate({width:60},160);
		$(this).siblings().find(".unfold").hide();
		$(this).siblings().find(".fold").show();
		// siblings() 遍历方法
	})
})
