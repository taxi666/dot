
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
dim rs,sql
set rs=server.createobject("adodb.recordset")
action = "modify"
newsId = Trim(Request.QueryString("id"))

if isNumeric(newsId)=false or newsId="" then
	newsId=0
	action = "addnew"
end if

if action="modify" then
set rsp=Server.CreateObject("ADODB.RecordSet")
sqlp = "select * FROM job where id="&newsId
rsp.Open sqlp,conn,1,1
	if rsp.RecordCount=1 then 
		mName=rsp("jobName")
		mDescribe=rsp("jobDescribe")
		mResponsibilities=rsp("jobResponsibilities")
		mRequirements=rsp("jobRequirements")		
	else
		action = "addnew"
		newsId = 0
	end if
rsp.Close
set rsp=nothing
end if

sub produceForm()
	mName=trim(request.form("job_name"))
	mDescribe=trim(request.form("job_describe"))
	mResponsibilities=trim(request.form("job_responsibilities"))
	mRequirements=trim(request.form("job_requirements"))			   
	sqlq = "select * from job where id="&Trim(Request.Form("id"))
	set rsq = Server.CreateObject("ADODB.RecordSet")
	rsq.Open sqlq,conn,1,3

	if len(mName)>255 then
		Response.Write("<Script Language='Javascript'>")
		Response.Write("alert('工作名称太长!字符个数不能大于255，包含空格');")
		Response.Write("history.go(-1);")
		Response.Write("</Script>")
	else 

        if Trim(Request.Form("action"))="modify" then
			if rsq.RecordCount = 1 then
			'修改
				rsq("jobName") = mName
				rsq("jobDescribe") = mDescribe
				rsq("jobResponsibilities") = mResponsibilities
				rsq("jobRequirements") = mRequirements				
				rsq.Update
            end if 
			Response.Write("<Script Language='Javascript'>")
			Response.Write("alert('修改成功!');")
			Response.Write("</Script>")
            Response.Write "<script language=javascript>"&_
                            "window.location.href='list.asp'"&_
                            "</script>"                                     
		else
            rsq.AddNew
			rsq("jobName") = mName
			rsq("jobDescribe") = mDescribe
			rsq("jobResponsibilities") = mResponsibilities
			rsq("jobRequirements") = mRequirements	
			rsq("createTime") = Now()
			rsq.update
			Response.Write("<Script Language='Javascript'>")
			Response.Write("alert('保存成功!');")
			Response.Write("</Script>")	
		end if
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
<title>增加job</title>
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
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->
<br>
<form name="pub_topic" method="post" action="add.asp?action=modify"  ID="pub_topic">
	<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
	  <tr>      
	    <td>&nbsp;&nbsp;&nbsp;<%=homepage_title%> - <font color="#FF0000">添加/修改job信息</font>
	        <table width="98%" border="0" align="center" cellspacing="2" cellpadding="2"  class="add_table" >
	          <tr> 
	            <td width="13%"> 
	              <div align="right">名称：</div>
	          	</td>
	            <td colspan="2"> 
	              <input type="text" name="job_name" size="50" value= <%=mName%> >
	          	</td>
	          </tr>
	          <tr> 
	            <td valign="top" width="13%"> 
	              <div align="right">简介：</div>
	          	</td>
	           	<td colspan="2"> 
	              <input type="text" name="job_describe" id="basic_example_2" size="50" value=<%=mDescribe%> >
	          	</td>
	          </tr>
	          <tr> 
	            <td valign="top" width="13%"> 
	              <div align="right">工作职责：</div>
	          	</td>
	           	<td colspan="2"> 
	           		<textarea name="job_responsibilities" cols="100" rows="6"> <%=mResponsibilities%> </textarea>
	          	</td>
	          </tr>
	           <tr> 
	            <td valign="top" width="13%"> 
	              <div align="right">应聘要求：</div>
	          	</td>
	           	<td colspan="2"> 
	           		<textarea name="job_requirements" cols="100" rows="6"> <%=mRequirements%> </textarea>
	          	</td>
	          </tr>
	          <tr> 
	            <td>&nbsp;</td>
	            <td colspan="2"> 
	              <input type="button" name="post" value=" 发 表 " onClick="return saveIt();" ID="post" class="button2">
	              <input type="hidden" name="id" value="<%=newsId%>">
	              <input type="hidden" name="action" value="<%=action%>">
	              <input type="reset" name="reset" value=" 重 置 " class="button2">
				</td>
	          </tr>
	        </table>	
		</td>
      </tr>
    </table>
</form>

</body>
</html>