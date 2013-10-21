<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加留言</title>
</head>

<body>
<%  dim  title,content,addtime
   your_name=request("your_name")
   company_name=request("company_name")
   your_email=request("your_email")
   phone_number=request("phone_number")
   enquiry=request("enquiry")
   create_time=Now()
   %>

<!--#include file ="../dbconnect/conn.asp"-->
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
		Response.Write("alert('留言提交成功!');")
		Response.Write("window.location.href='../index.asp';")
		Response.Write("</Script>")
		%>
</body>
</html>
