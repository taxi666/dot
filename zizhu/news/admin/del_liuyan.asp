<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->
<%
id1=request("id")

sql="select * from liuyan where id="&id1
set rs=Server.CreateObject("ADODB.RecordSet")
rs.open sql,conn,1,3
if not rs.EOF then
       rs.Delete
       rs.Update
	
		response.write "<script language=javascript>"
		response.write "alert('É¾³ý³É¹¦£¡');"
		response.write "</script>"
		end if
		 rs.close	       
    set rsd=nothing
		response.Redirect("admin_liuyan.asp?pageno=1") 
		
%>