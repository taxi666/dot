<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content=" Supply, Suppliers, Sale, Manufacturers, Wholesalers, Exporters, Importers, Retailers, Servicers.        Dot Connector Business Consulting Services Johor http://www.dconnector.com">
<title>Dot Connector Business Consulting Services</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
<link href="styles/pri_index.css" rel="stylesheet" type="text/css" />
<link href="styles/pub.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
</head>
<body>
<div id="base_hd">
	<div class="hd_com_info">
		<div class="hd_logo"><h1>Dot Connector Business Consulting Services</h1></div>
		<h2 class="hd_tel">Call: + 86 21 6607 5810 ( SH )  /   +607 225 4860 ( MY )</h2>
	</div>
	<div class="nav">
		<ul class="nav_list">
			<li class="nav1 current"><a href="index.asp">Home</a></li>
			<li class="nav2"><a href="aboutus.asp">About Us</a></li>
			<li class="nav3"><a href="products.asp">Products & Services</a></li>
			<li class="nav4"><a href="petrochemical.asp">Petrochemical</a></li>
			<li class="nav5"><a href="working.asp">Working With Us</a></li>
			<li class="nav6"><a href="contact.asp">Contact Us</a></li>
		</ul>
	</div>
</div> 
<div id="base_bd">
	<div class="ad_top">
		<ul class="ad_top_list" id="ad_top_list">
			<li class="current"><a href=""><img src="images/ad_top/scroll1.jpg" alt=""/></a></li>
			<li><img src="images/ad_top/scroll2.jpg" alt=""/></li>
			<li><img src="images/ad_top/scroll3.jpg" alt=""/></li>
			<li><img src="images/ad_top/scroll4.jpg" alt=""/></li>
			<li><img src="images/ad_top/scroll5.jpg" alt=""/></li>
			<li><img src="images/ad_top/scroll6.jpg" alt=""/></li>
		</ul>
		<div class="opacity_white">
			<p><span id="ad_top_num">1</span>/6</p>
		</div>
		<a href="javascript:;" class="icon_ad_left"></a>
		<a href="javascript:;" class="icon_ad_right"></a>
	</div>
	<div class="ad_mid">
		<div class="ad_mid_main" id="ad_mid_main">
		<div class="for_scroll">	
			<ul id="ad_mid_list" class="ad_mid_list">
				<li><a href=""><img src="images/ad_middle/scroll_b07.png" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b08.jpg" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b07.png" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b08.jpg" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b07.png" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b08.jpg" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b07.png" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b08.jpg" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b07.png" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b08.jpg" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b07.png" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b08.jpg" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b07.png" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b08.jpg" alt=""></a></li>
				<li><a href=""><img src="images/ad_middle/scroll_b07.png" alt=""></a></li>
			</ul>
			<ul id="ad_mid_list2" class="ad_mid_list"></ul>
		</div>	
		</div>	
		<div class="icon_ad_mid_left" id="icon_ad_mid_left"></div>
		<div class="icon_ad_mid_right" id="icon_ad_mid_right"></div>
	</div> 
	<div class="main_info">
		<dl class="dl_news">
			<dt><h2>News</h2></dt>
			<dd>
				<div class="ad_bottom">
					<ul class="ad_bottom_list" id="ad_bottom_list">
						<li class="current"><img src="images/ad_bottom/a01.jpg"/></li>
						<li><img src="images/ad_bottom/a02.jpg"/></li>
						<li><img src="images/ad_bottom/a03.jpg"/></li>
					</ul>
					<div class="opacity_white opacity_white2">
						<p><b class="switch_on" id="ad_bottom_switch"></b><span id="ad_bottom_num">1</span>/3</p>
					</div>
					<div class="icon_ad_mid_left" id="icon_ad_mid_left"></div>
					<div class="icon_ad_mid_right" id="icon_ad_mid_right"></div>
				</div>
				<div class="news_area">
					<p class="font_9">MAY 3, 2012</p>
					<p class="font_8">Use this area to let your visitors know about your latest news.</p>
					<a href="" class="read_more">Read more...</a>
				</div>
			</dd>
		</dl>
		<dl class="dl_events">
			<dt><h2>Up Coming Events</h2></dt>
			<dd>
				<!--#include file="dbconnect/conn.asp" -->
				<%
				dim rs,sql,pmcount
				set rs=server.createobject("adodb.recordset")
				sql="select top 3 * from event order by ID desc"
				rs.open sql,conn,1,1
				rcount=rs.recordcount
				pmcount=3
				if rs.bof and rs.eof then
				else
					loopno=pmcount
					i=1
					do while not rs.eof and loopno>0
				%>				
				<div class="coming_events">
					<p class="event_time"><%=rs("eventTime")%></p>
					<p class="event_title"><%=rs("eventTitle")%></p>
					<p class="event_detail"><%=rs("eventDetail")%></p>
				</div>
				<%
				rs.movenext						
				loopno=loopno-1
				i=i+1
				loop		
				end if

				rs.close
				set rs=Nothing
				endconnection
				%>
				<a href="###" class="more_info">More Info...</a>
			</dd>
		</dl>
		<dl class="dl_clients">
			<dt><h2>Our Clients</h2></dt>
			<dd>
				<ul class="log_list">
					<li><img src="images/logos/logo01.png"/>
						<div class="trans_layer">Deloitte</div>
					</li>
					<li><img src="images/logos/logo02.png"/>
						<div class="trans_layer">XXX</div>
					</li>
					<li><img src="images/logos/logo03.png"/>
						<div class="trans_layer">Costa</div>
					</li>
					<li><img src="images/logos/logo04.png"/>
						<div class="trans_layer">Nokia</div>
					</li>
					<li><img src="images/logos/logo01.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo02.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo03.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo04.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo01.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo02.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo03.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo04.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo01.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo02.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo03.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo04.png"/>
						<div class="trans_layer"></div>
					</li>
				</ul>
				<ul class="log_list" id="log_list2" style="display:none;">
					<li><img src="images/logos/logo01.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo02.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo03.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo04.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo01.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo02.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo03.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo04.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo01.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo02.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo03.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo04.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo01.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo02.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo03.png"/>
						<div class="trans_layer"></div>
					</li>
					<li><img src="images/logos/logo04.png"/>
						<div class="trans_layer"></div>
					</li>
				</ul>
				<a href="javascript:;" class="logo_show_more" id="logo_show_more">Show More</a>
			</dd>
		</dl>
	</div>
</div>
<!--#include file="footer.html" -->
<script type="text/javascript" src="js/pri_index.js"></script>
 <script type="text/javascript">
// 	alert(document.getElementById("ad_mid_main").offsetWidth);
</script>
</body>
</html>
