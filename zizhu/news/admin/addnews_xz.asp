
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->


<html>
<head>
<title>文件标题修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../css/style.css" type="text/css">

</head>
<%  dim  title,id
   id=request("newsid")

 
		set rs=server.createobject("adodb.recordset")
		exec="select * from docs where id ="&id
		rs.open exec,conn,1,1
		
		title=rs("title")
	  
		
		
	
		rs.close()
		set rs=nothing
		%>
     

</body>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->
<br>
<form name="form1" method="post" action="modify_filetitle.asp">
  <label>
   文件标题：<input name="file_title" type="text" id="textfield" value="<%=title%>" size="50">
  </label>
  &nbsp;&nbsp;&nbsp;
  <label>
    <input type="submit" name="button" id="button" value="确定">
  </label>
  &nbsp;
  <label>
    <input type="reset" name="button2" id="button2" value="重置">
  </label>
  <input type="hidden" name="file_id"  value="<%=id%>">
</form>
</body>
</html>