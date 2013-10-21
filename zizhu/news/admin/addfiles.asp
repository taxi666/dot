
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../css/style.css" type="text/css">
<title>无标题文档</title>
</head>



<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->

<br />
<%  dim  title,url1,addtime
   title=request.form("file_title")
   url1=request.form("file_url")
   addtime=Now()
   %>
	          <%
		set rs=server.createobject("adodb.recordset")
		exec="select * from docs "
		rs.open exec,conn,1,3
		rs.addnew
		rs("title")=trim(title)
		rs("url1")=trim(url1)
	    rs("addtime")=addtime
		
		rs.update
		
		 Response.write " <span style=""color:red;"">" & title & " </span>保存成功<br />"
	
		rs.close()
		set rs=nothing
		%>
     

</body>
</html>
