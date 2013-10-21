<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->


<% 
set rs= Server.CreateObject("adodb.recordset")
sql="select * from liuyan where id="&request("id") '定位回复的位置,where后面跟的是回复的条件,只授我们传递过来的留言ID值,并赋值到当前的ID变量上,这样我们只会对当前回复的留言来回复,这个很关键,不然都乱套了
rs.open sql,conn,1,3
if request.form("active")="" then  '用来判断的表单提交还是刷新页面,如果是提交表单,那么隐藏域的值肯定被提交,这样Request.form("active")不为空,就执行以下回复语句.如果没提交表单,而是刷新页面,那么隐藏域的值没有提交,Request.form("active")肯定为空,就跳过不执行
 else
 rs("title")=request.form("title")
 rs("content")=request.form("content")
rs("answer")=request.form("repcontent") '注意此代码前没有加rsedit.addnew,因为这是更新原有的记录,在原有的留言中在追加回复内容,而不是再添加一条新记录
rs("active")=true
rs("publishdate")=date
rs.update
rs.close
set rs=nothing
response.redirect "admin_liuyan.asp?pageno=1"
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>留言系统-回复留言</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {font-size: 18px}
-->
</style>
<link href="css.css" rel="stylesheet" type="text/css">
</head>

<body background=image/back.jpg>


   <table width="770" height="1" border="0" align="center" cellpadding="0" cellspacing="0" id="talbe0001"> 
    <tr> 
      <td height="1" background="image/0004.gif"></td> 
    </tr> 
</table>
<form action="huifuliuyan.asp?id=<%=request("id")%>" method="post" name="add">
  <table width="450" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FCA2A1">
    <tr bgcolor="#FFE7E7">
      <td height="40" colspan="3" align="center"><span class="text3 style2">留言系统-回复留言</span></td>
    </tr>
    
  
    <tr bgcolor="#FFFFFF">
      <td valign="top"><P style="MARGIN-TOP: 2px; MARGIN-LEFT: 80px">留言主题</p></td>
      <td colspan="2"><input name="title" type="text" id="title" value="<% =rs("title") %>" size="25" maxlength="30">
      <span class="style1 style3" style="color: #FF0000"></span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td valign="top"><P style="MARGIN-TOP: 5px; MARGIN-LEFT: 80px">内容</p></td>
      <td colspan="2"><textarea name="content" cols="35" rows="8"><% =rs("content") %>
      </textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td valign="top"><P style="MARGIN-TOP: 5px; MARGIN-LEFT: 80px">回复</p></td>
      <td colspan="2"><textarea name="repcontent" cols="35" rows="8" id="repcontent"><% =rs("answer") %>
      </textarea>
      <input name="active" type="hidden" id="active" value="yes"></td>
    </tr>
    <tr align="center" bgcolor="#FFFFFF">
      <td colspan="3"><input type="submit" name="Submit" value="写好了">
    　　　　　　　　
      <input type="reset" name="Submit" value="重新写">
      </td>
    </tr>
  </table>
</form>
  <table width="770" height="1" border="0" align="center" cellpadding="0" cellspacing="0" id="talbe0001"> 
    <tr> 
      <td height="1" background="image/0004.gif"></td> 
    </tr> 
  </table>

</body>
</html>