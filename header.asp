<% 
	nav=request("nav_list")

%>
<div id="base_hd">
	<div class="hd_com_info">
		<div class="hd_logo"><h1>Dot Connector Business Consulting Services</h1></div>
		<h2 class="hd_tel">Call: + 86 21 6607 5810 ( SH )  /   +607 225 4860 ( MY )</h2>
	</div>
	<div class="nav">
		<ul class="nav_list">
			<li class="nav1 <%if nav_list ="index" then response.write 'current';end if%>"><a href="index.asp">Home</a></li>
			<li class="nav2"><a href="aboutus.asp">About Us</a></li>
			<li class="nav3"><a href="products.asp">Products & Services</a></li>
			<li class="nav4"><a href="petrochemical.asp">Petrochemical</a></li>
			<li class="nav5"><a href="working.asp">Working With Us</a></li>
			<li class="nav6"><a href="contact.asp">Contact Us</a></li>
		</ul>
	</div>
</div> 