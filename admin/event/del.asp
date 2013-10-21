
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
id1=request("id")

set rs=Server.CreateObject("ADODB.RecordSet")
sql="select * from event where id="&id1

rs.open sql,conn,1,3
if not rs.EOF then
       rs.Delete
       rs.Update
	
		response.write "<script language=javascript>"
		response.write "alert('删除成功！');"
		response.write "</script>"
end if
		 rs.close	       
    set rsd=nothing
		response.Redirect("list.asp?pageno=1") 
		
%>
