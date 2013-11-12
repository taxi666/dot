<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加留言</title>
</head>

<body>

<%
Function codepass()
   Dim CodeStr
   CodeStr = Trim(Request("captha"))
   If CStr(Session("GetCode")) = CStr(CodeStr) And CodeStr <> "" Then
     codepass = True
     'Session("GetCode")=empty
   Else
     codepass = False
     'Session("GetCode")=empty
   End If
End Function
if codepass() = False then
%>
<script language=javascript>
	alert("验证码错误!");
	history.go(-1);
</script>
<% 
else 
  dim  your_name,company_name,your_email,phone_number,enquiry
   your_name=request("your_name")
   company_name=request("company_name")
   your_email=request("your_email")
   phone_number=request("phone_number")
   enquiry=request("enquiry")
   create_time=Now()
   %>

<!--#include file="../../dbconnect/news.admin.inc.asp" -->
	    <%
		set rs=server.createobject("adodb.recordset")
		exec="select * from contact"
		rs.open exec,conn,1,3
		rs.addnew
		rs("yourName")=trim(your_name)
		rs("companyName")=trim(company_name)
		rs("email")=trim(your_email)
		rs("tel")=trim(phone_number)
		rs("enquiry")=trim(enquiry)
	    rs("createTime")=create_time
		rs.update
		rs.close()
		set rs=nothing				
		Response.Write("<Script Language='Javascript'>")
		Response.Write("alert('Thanks for your enquiry. We will reply it in a few days!');")
		Response.Write("window.location.href='../../';")
		Response.Write("</Script>")
	end if
		%>
</body>
</html>
