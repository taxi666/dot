
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
	dim rs,sql
	set rs=server.createobject("adodb.recordset")
	action = "addnew"
	newsId = Trim(Request.QueryString("id"))
	
	if isNumeric(newsId)=false or newsId="" then
		newsId=0
		action = "addnew"
	end if
	

set rsp=Server.CreateObject("ADODB.RecordSet")
sqlp = "select * FROM event where id="&newsId
rsp.Open sqlp,conn,1,3
	if rsp.RecordCount=1 then
		action = "modify"   
		mTitle=rsp("eventTitle")
		mTime=rsp("eventTime")
		mDetail=rsp("eventDetail")		
	else
		action = "addnew"
		newsId = 0
	end if
rsp.Close
set rsp=nothing

sub produceForm()
	mTitle=trim(request.form("event_title"))
	mTime=trim(request.form("event_time"))
	mDetail=trim(request.form("event_detail"))			   
	sqlq = "select * from event where id="&Trim(Request.Form("id"))
	set rsq = Server.CreateObject("ADODB.RecordSet")
	rsq.Open sqlq,conn,1,3
        if Trim(Request.Form("action"))="modify" then
			if rsq.RecordCount = 1 then
			//�޸�
				
				rsq("eventTitle") = mTitle
				rsq("eventTime") = mTime
				rsq("eventDetail") = mDetail			
				rsq.Update
             end if 
			 Response.Write("<Script Language='Javascript'>")
			 Response.Write("alert('�޸ĳɹ�!');")
			 Response.Write("</Script>")
             Response.Write "<script language=javascript>"&_
                            "window.location.href='list.asp'"&_
                            "</script>"                                     
		else
            rsq.AddNew
			rsq("eventTitle") = mTitle
			rsq("eventTime") = mTime
			rsq("eventDetail") = mDetail
			rsq("createTime") = Now()
			rsq.update
			Response.Write("<Script Language='Javascript'>")
			Response.Write("alert('����ɹ�!');")
			Response.Write("</Script>")	
		end if
	rsq.Close
	set rsq = nothing 
end sub

if Trim(Request.Form("action"))<>"" then
   call produceForm()
end if

%>
<html>
<head>
<title>����Event</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../styles/admin.css" type="text/css">
<script language=javascript>
<!--
function saveIt()
{
    document.pub_topic.submit();
}
//-->
</script>
<link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" media="all" type="text/css" href="../dist/jquery-ui-timepicker-addon.css" />	

</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->
<br>
<form name="pub_topic" method="post" action="add.asp?action=modify"  ID="pub_topic">
	<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
	  <tr>      
	    <td>&nbsp;&nbsp;&nbsp;<%=homepage_title%> - <font color="#FF0000">���/�޸�Event��Ϣ</font>
	        <table width="98%" border="0" align="center" cellspacing="2" cellpadding="2"  class="add_table" >
	          <tr> 
	            <td width="13%"> 
	              <div align="right">Event��Ϣ���⣺</div>
	          	</td>
	            <td colspan="2"> 
	              <input type="text" name="event_title" size="50" value= <%=mTitle%> >
	          	</td>
	          </tr>
	          <tr> 
	            <td valign="top" width="13%"> 
	              <div align="right">Eventʱ�䣺</div>
	          	</td>
	           	<td colspan="2"> 
	              <input type="text" name="event_time" id="basic_example_2" size="50" value=<%=mTime%> >
	          	</td>
	          </tr>
	          <tr> 
	            <td valign="top" width="13%"> 
	              <div align="right">Event Detail��</div>
	          	</td>
	           	<td colspan="2"> 
	           		<textarea name="event_detail" cols="100" rows="6"> <%=mDetail%> </textarea>
	          	</td>
	          </tr>
	          <%if news_permission ="yes" then%>
	          <%end if%>
	          
	    
	          <tr> 
	            <td>&nbsp;</td>
	            <td colspan="2"> 
	              <input type="button" name="post" value=" �� �� " onClick="return saveIt();" ID="post" class="button2">
	              <input type="hidden" name="id" value="<%=newsId%>">
	              <input type="hidden" name="action" value="<%=action%>">
	              <input type="reset" name="reset" value=" �� �� " class="button2">
				</td>
	          </tr>
	        </table>	
		</td>
      </tr>
    </table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
<script type="text/javascript" src="../dist/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="../dist/jquery-ui-sliderAccess.js"></script>

<script type="text/javascript">			
	$(function(){
		$('#tabs').tabs();
		// $('.example-container > pre').each(function(i){
		// 	eval($(this).text());
		// });
	$('#basic_example_2').datetimepicker({
			timeFormat: "hh:mm tt"
		});
	});			
</script>

</body>
</html>