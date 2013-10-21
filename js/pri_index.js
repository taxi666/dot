$(document).ready(function(){
	var i=0,j=0;
	//=S ad top
	var ad_top_list = $("#ad_top_list");
	setInterval(function (){
	ad_top_list.find("li").eq(i).fadeOut(1000);
	i++;
	if(i>5) i=0;
	ad_top_list.find("li").eq(i).fadeIn(1000);
	$("#ad_top_num").text(i+1);
	},3000);
	//=E ad top

	//=S ad middle
	$("#icon_ad_mid_left").click(function(){
		if(mar_ad_bottom)clearInterval(mar_ad_bottom);
		$("#ad_bottom_switch").addClass("switch_off").removeClass("switch_on");
		ad_bottom_list.find("li").eq(j).fadeOut(1000);
		j--;
		if(j<0) j=2;
		ad_bottom_list.find("li").eq(j).fadeIn(1000);
		$("#ad_bottom_num").text(j+1);
		
	});
	$("#icon_ad_mid_right").click(function(){
		if(mar_ad_bottom)clearInterval(mar_ad_bottom);
		$("#ad_bottom_switch").addClass("switch_off").removeClass("switch_on");
		ad_bottom_list.find("li").eq(j).fadeOut(1000);
		j++;
		if(j>2) j=0;
		ad_bottom_list.find("li").eq(j).fadeIn(1000);
		$("#ad_bottom_num").text(j+1);
		
	});
	var speed=10;
	var demo1=$("#ad_mid_list");
	var demo2=$("#ad_mid_list2");
	var demo=$("#ad_mid_main");
	var MyMar;
	demo2.html(demo1.html());
	function marquee_left(){
		if(demo1.width() <= demo.scrollLeft())
		demo.scrollLeft(0);
		else{
		demo.scrollLeft(demo.scrollLeft()+1);
		}
		// $("#test_p").text("demo1.scrollWidth"+demo1.get(0).scrollWidth+";demo.scrollLeft:"+demo.get(0).scrollLeft);
	}
	function marquee_right(){
		if(demo.scrollLeft()<=0)
		demo.scrollLeft(demo1.width());
		else{
		demo.scrollLeft(demo.scrollLeft()-1);
		}
	}
	$("#icon_ad_mid_right").mouseover(function(){
		MyMar=setInterval(marquee_left,speed);
		});
	$("#icon_ad_mid_right").mouseout(function(){
		clearInterval(MyMar);
		});
	$("#icon_ad_mid_left").mouseover(function(){
		MyMar=setInterval(marquee_right,speed);
		});
	$("#icon_ad_mid_left").mouseout(function(){
		clearInterval(MyMar);
	});
	//=E ad middle

	//=S ad bottom
	var ad_bottom_list = $("#ad_bottom_list");
	function marqueeAdBottom() {
		ad_bottom_list.find("li").eq(j).fadeOut(1000);
		j++;
		if(j>=3) j=0;
		ad_bottom_list.find("li").eq(j).fadeIn(1000);
		$("#ad_bottom_num").text(j+1);			
	}
	var mar_ad_bottom = setInterval(marqueeAdBottom,3000);
	$("#ad_bottom_switch").click(function(){
		if($("#ad_bottom_switch").hasClass('switch_on')){
			clearInterval(mar_ad_bottom);
			$("#ad_bottom_switch").addClass("switch_off").removeClass("switch_on");
		}
		else {
			mar_ad_bottom = setInterval(marqueeAdBottom,3000);
			$("#ad_bottom_switch").addClass("switch_on").removeClass("switch_off");
		}
	});
	//=E ad bottom
	$("#logo_show_more").click(
		function(){
		$("#log_list2").fadeIn(1000);
		$("#logo_show_more").hide();
	});
	
});

