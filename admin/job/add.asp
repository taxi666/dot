
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
	var input1="",input2="";
	var input_res = document.getElementsByClassName("input_text_res");
	var input_req = document.getElementsByClassName("input_text_req");
	input1=input_res[0].value;
	for(var i=1;i<input_res.length;i++){
		input1=input1+"$$"+input_res[i].value};
	document.getElementById("input_responsibilities").value=input1;
	input2=input_req[0].value;
	for(var i=1;i<input_req.length;i++){
		input2=input2+"$$"+input_req[i].value};
	document.getElementById("input_requirements").value=input2;
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
	           		<div class="job_list" id="div_job_list">
						<div class="count_buttons">
							<a href="javascript:;" class="base_plus" id="job_base_plus"></a>
							<a href="javascript:;" class="base_minus" id="job_base_minus"></a>
						</div>
						<%
						job_re=Split(mResponsibilities,"$$")
						if ubound(job_re)>=0 then
						For j=0 to ubound(job_re)%>
						<div><input type="text" class="input_text_res" value=<%=job_re(j)%> size="50" /></div>
						<%Next
						else %>
						<div><input type="text" class="input_text_res" size="50" /></div>
						<%end if%>		
					</div>
	           		<input type="hidden" value="<%=mResponsibilities%>" name="job_responsibilities" id="input_responsibilities"/> 
	          	</td>
	          </tr>
	           <tr> 
	            <td valign="top" width="13%"> 
	              <div align="right">应聘要求：</div>
	          	</td>
	           	<td colspan="2">
		           	<div class="job_list" id="div_job_list2">
						<div class="count_buttons">
							<a href="javascript:;" class="base_plus" id="job_base_plus2"></a>
							<a href="javascript:;" class="base_minus" id="job_base_minus2"></a>
						</div>
						<%
						job_re=Split(mRequirements,"$$")
						if ubound(job_re)>=0 then
						For j=0 to ubound(job_re)%><div><input type="text" class="input_text_req" value=<%=job_re(j)%> size="50" /></div><%Next
						else %><div><input type="text" class="input_text_req" size="50" /></div><%end if%>		
					</div>
	           		<input type="hidden" value="<%=mRequirements%>" name="job_requirements" id="input_requirements"/>  
	          	</td>
	          </tr>
	          <tr> 
	            <td>&nbsp;</td>
	            <td colspan="2"> 
	              <input type="button" name="post" value=" 发 表 " onClick="return saveIt();" ID="post" class="button2" href="javascript:;">
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
<script type="text/javascript">
function addEvent(obj,type,fn){
    if (obj.attachEvent) {
        obj['e'+type+fn] = fn;
        obj[type+fn] = function(){obj['e'+type+fn](window.event);}
        obj.attachEvent('on'+type, obj[type+fn]);
    } else
        obj.addEventListener(type,fn,false);
}
function removeEvent(obj,type,fn){
    if (obj.detachEvent){
        obj.detachEvent('on'+type, obj[type+fn]);
        obj[type+fn] = null;
    } else
        obj.removeEventListener(type,fn,false);
}
var job_list=document.getElementById("div_job_list");
var job_list2=document.getElementById("div_job_list2");
function clickPlus(){
	var temp_node=document.createElement("div");
	temp_node.innerHTML="<input type=text class=input_text_res size=50 />";
	this.parentNode.parentNode.appendChild(temp_node);
}
function clickPlus2(){
	var temp_node=document.createElement("div");
	temp_node.innerHTML="<input type=text class=input_text_req size=50 />";
	this.parentNode.parentNode.appendChild(temp_node);
}
function  clickMinus(){
	var input_text_res=document.getElementsByClassName("input_text_res");
	job_list.removeChild(input_text_res[input_text_res.length-1].parentNode);
}
function  clickMinus2(){
	var input_text_req=document.getElementsByClassName("input_text_req");
	job_list2.removeChild(input_text_req[input_text_req.length-1].parentNode);
}
var plus=document.getElementById("job_base_plus");
addEvent(plus,"click",clickPlus);
var minus=document.getElementById("job_base_minus");
addEvent(minus,"click",clickMinus);
plus2=document.getElementById("job_base_plus2");
addEvent(plus2,"click",clickPlus2);
minus2=document.getElementById("job_base_minus2");
addEvent(minus2,"click",clickMinus2);
</script>
</body>
</html>