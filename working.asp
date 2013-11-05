<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content=" Supply, Suppliers, Sale, Manufacturers, Wholesalers, Exporters, Importers, Retailers, Servicers.        Dot Connector Business Consulting Services Johor http://www.dconnector.com">
<title>Dot Connector | Petrochemical</title>
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
			<li class="nav1"><a href="index.asp">Home</a></li>
			<li class="nav2"><a href="aboutus.asp">About Us</a></li>
			<li class="nav3"><a href="products.asp">Products & Services</a></li>
			<li class="nav4"><a href="petrochemical.asp">Petrochemical</a></li>
			<li class="nav5 current"><a href="working.asp">Working With Us</a></li>
			<li class="nav6"><a href="contact.asp">Contact Us</a></li>
		</ul>
	</div>
</div>
<div id="base_bd2">
	<div class="work_with_main clearfix">
		<div class="working_with_img">
			<img src="images/working_with_us.jpg"/>
		</div>
		<div class="working_with_email">
			<p class="email_des" style="word-wrap:break-word;">*** Interested to become part of Dot Connector?
			</p>
			<p>Please send your complete resume/ CV to <a href="mailto:recruitment@dconnector.com" class="email_address"><span>recruitment @ dconnector.com</span></a></p>
			<a href="mailto:recruitment@dconnector.com" class="btn_joinus">Join us</a>
		</div>
	</div>
	<div class="email_contact">
		<div><strong class="font_8 color_18">Dot Connector Business Consulting Services</strong> is a world-class business intelligence provider with head quarter at Malaysia, it has been delivering world-class events including conferences, public workshops, exhibitions, in-house trainings and corporate team buildings to associations and government agencies in the Asia Pacific region focusing in China, Australia and Malaysia. We aimed to accomplish your mission and realize your vision, while adding value and enriching people’s lives.
		<br/><br/>
		We are dedicated to become an innovative and trustable partner to our clients. This also explains our business expansion & growth even during the economic uncertainties. Our secret recipe is easy - understand our clients’ needs and produce quality events with good customer services. We create networking platform for our clients to exchange ideas, develop new contacts and participate in informal discussions with business leaders and decision makers from various industries.
		<br/><br/>
		Most of our events are tailor made for the following industries:
		<br/><br/>
		<ul class="industry_list industry_list2 clearfix">
			<li>Oil & Gas</li>
			<li>Sales & Marketing</li>
			<li>Chemical & Petrochemical</li>
			<li>Retailing</li>
			<li>Marine & Shipping</li>
			<li>Manufacturing</li>
			<li>Finance & Banking</li>
			<li>General Management Skills Training</li>
			<li>Supply Chain</li>
		</ul>
		<!--#include file="dbconnect/conn.asp" -->
		<%
		dim rs,sql,pmcount
		set rs=server.createobject("adodb.recordset")
		sql="select top 3 * from job order by ID desc"
		rs.open sql,conn,1,1
		rcount=rs.recordcount
		pmcount=3
		if rs.bof and rs.eof then
		else
			loopno=pmcount
			i=1
			do while not rs.eof and loopno>0
		%>
		<hr>
		<br/>
		<%=rs("jobName")%><br/>
		<%=rs("jobDescribe")%>
		<br/><br/>
		Job Responsibilities: 
		<br/><br/>
		<ul>
			<%
			job_re=Split(rs("jobResponsibilities"),"$$")
			For j=0 to ubound(job_re)%>
			<li><%=job_re(j)%></li>
			<%Next %>
		</ul>
		<br/>
		Job Requirements:
		<ul>
			<%
			job_re=Split(rs("jobRequirements"),"$$")
			For j=0 to ubound(job_re)%>
			<li><%=job_re(j)%></li>
			<%Next %>
		</ul>
		<br/>
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

		
		</div>
	</div>
</div>
<!--#include file="footer.html" -->
</body>
</html>
