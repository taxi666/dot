
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>



<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->

<br />
<%  dim  title,id
   title=request.form("file_title")
   id=request.form("file_id")
   %>
	          <%
    sqlq = "select * from docs where id="&id
	set rsq = Server.CreateObject("ADODB.RecordSet")
	rsq.Open sqlq,conn,1,3
    
			if rsq.RecordCount = 1 then
			//修改
				
				rsq("title") = title
							
				rsq.Update
		
		Response.write "标题修改成功<br />"
	end if
		rsq.close()
		set rsq=nothing
		%>
     

</body>
</html>

