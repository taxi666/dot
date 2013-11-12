<!--#include file="../inc/setup.asp" -->
<!--#include file="../dbconnect/admin.inc.asp" -->
<%
postion = Trim(Request.QueryString("postion"))

if postion="" or not IsNumeric(postion) then
	errmsg=""
	postion=trim(1)
else
	errmsg="<p style='color:#FF0000;'><b>您没有登陆或者停留的时间过长，请重新登陆！</b></p>"
end if

Function checkenter()
	If username<>"" and password<>"" and otherpwd<>"" and Instr(username,"'")<1 and Instr(username," ")<1 and Instr(username,"""")<1 and Instr(username,"&")<1 then
		checkenter=TRUE
	Else
		checkenter=FALSE
	End If
End Function

Function checksysUser()
	sql="SELECT * FROM admin WHERE user='"&username&"'"
	Set rs=Server.CreateObject("adodb.recordset")
	rs.Open sql,conn,1,1
	if rs.eof then
		checksysUser=FALSE
	else
		passwd=trim(rs("pwd"))
		if passwd=password then
		   Session("admin")=username
		   checksysUser=TRUE		
	    else
		   checksysUser=FALSE
		end if
	End if
	rs.close
	conn.close
End Function
%>
<HTML>
<HEAD>
<TITLE><%=homepage_title%>--管理中心-用户登陆</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<script language="JavaScript">
<!--
function window_onload() {
	document.mail.username.focus();
}
function cancel()
{
	mail.reset();
}

function IsValid()
{
	if (document.mail.username.value=="")
	{
		alert("用户名不能为空");
		document.mail.username.focus();
		return false;
	}
	if (document.mail.password.value=="")
	{
		alert("密码不能为空");
		document.mail.password.focus();
		return false;
	}
	if (document.mail.otherpwd.value=="")
	{
		alert("验证码不能为空");
		document.mail.otherpwd.focus();
		return false;
	}
}
//-->
</script>
<link rel="stylesheet" href="../styles/admin.css" type="text/css">
</HEAD>

<BODY bgColor=#FFFFFF topMargin=0 leftmargin="0" onload="return window_onload()">
<p>&nbsp;</p>
<%
	if Request.Form("action")="true" then
		username=trim(Request.Form("username"))
		password=trim(Request.Form("password"))
		position = Trim(Request.form("postion"))
		otherpwd = Trim(Request.form("otherpwd"))
		Function codepass()
	       Dim CodeStr
	       CodeStr = Trim(Request.form("otherpwd"))
	       If CStr(Session("GetCode")) = CStr(CodeStr) And CodeStr <> "" Then
	         codepass = True
	         'Session("GetCode")=empty
	       Else
	         codepass = False
	         'Session("GetCode")=empty
	       End If
		End Function
		
		a=checkenter()
		If a=TRUE then
			if codepass() then
				b=checksysUser()
				if b=true then
					if position <> 2 then 
						Response.Redirect("main.asp")
					else
%>
               			<script language=javascript>
							top.document.location.reload();
						</script>
<%
					end if
				else
					errmsg="<font color=#FF0000><b>用户名或者用户密码错误，请重新输入！</b></font>"
				end if
			else
				errmsg="<font color=#FF0000><b>附加码输入错误，请重新输入！</b></font>"
			end if
		else
			errmsg="<font color=#FF0000><b>用户名输入有误，请重新输入！</b></font>"
		end if
	end if 
%>
<div align="center"><%=errmsg%><br></div>
<table class="text" width="450" height="289" border="0" cellpadding="0" cellspacing="0" background="images/admin.gif" align="center">
  <form name=mail action="login.asp" onSubmit="return IsValid();" method=post>
    <tr> 
      <td width="83" height="133">&nbsp;</td>
      <td width="283">&nbsp;</td>
      <td width="84">&nbsp;</td>
    </tr>
    <tr> 
      <td height="98">&nbsp;</td>
      <td valign="top"> 
        <table class="text" cellspacing=0 cellpadding=0 width=280 border=0 align="center">
          <tbody> 
          <tr> 
            <td height="28" style="line-height:180%"> 帐&nbsp;&nbsp;号： 
              <input type="text" name="username" size="20" class="button1">
            </td>
          </tr>
          <tr> 
            <td height="28" style="line-height:180%"> 密&nbsp;&nbsp;码： 
              <input type="password" name="password" size="20" class="button1">
            </td>
          </tr>
          <tr>
            <td height="28" style="line-height:180%"> 验证码： 
              <input type="text" name="otherpwd" size="20" class="button1"/>
              <img src="code01.asp" style="cursor:hand;" onclick="this.src='code01.asp'" alt="看不清？换一张"/>
              <input type="hidden" name="action" value="true">
			  <input type="hidden" name="postion" value="<%=postion%>">
			  </td>
          </tr>
          </tbody> 
        </table>
      </td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td valign="top"> 
        <table class="text" width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td> 
              <div align="center"> <a href="/"><font color="#0000FF">返回首页</font></a> 
              </div>
            </td>
            <td> 
              <input type=image height=23 width=62 src="images/btn_index_ok.gif" border=0 name="submit1">
              <img onMouseOver="event.srcElement.style.cursor='hand'" onClick=cancel() height=23 src="images/btn_index_cancel.gif" width=62 border=0> </td>
          </tr>
        </table>
      </td>
      <td>&nbsp;</td>
    </tr>
  </form>
</table>
</BODY>
</HTML>
