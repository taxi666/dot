<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<%  dim  title,content,addtime
   title=request("biaoti")
   content=request("neirong")
   addtime=Now()
   %>

<!--#include file ="conn.asp"-->
	          <%
		set rs=server.createobject("adodb.recordset")
		exec="select * from liuyan"
		rs.open exec,conn,1,3
		rs.addnew
		rs("title")=trim(title)
		rs("content")=trim(content)
	    rs("indate")=addtime
		rs.update
		rs.close()
		set rs=nothing
				
			Response.Write("<Script Language='Javascript'>")
			Response.Write("alert('留言提交成功!');")
			Response.Write("close();")
			Response.Write("</Script>")
		%>

</body>
</html>
