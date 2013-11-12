
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
dim j,job_re
job_re=Split(request("id"),",")
sql="select * from event where id="&job_re(0)
For j=1 to ubound(job_re)
sql = sql&" or id="&job_re(j)
Next
set rs=Server.CreateObject("ADODB.RecordSet")
rs.open sql,conn,1,3
do while not rs.eof
	rs.Delete
    rs.Update
    rs.movenext						
loop
		
rs.close	       
set rsd=nothing
Response.Write("<Script Language='Javascript'>")
Response.Write("alert('删除成功!');")
Response.Write("</Script>")	
Response.Redirect("list.asp?pageno=1") 
		
%>
