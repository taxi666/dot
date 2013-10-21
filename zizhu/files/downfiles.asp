<%
squery=lcase(Request.ServerVariables("QUERY_STRING"))
sURL=lcase(Request.ServerVariables("HTTP_HOST"))
 
SQL_injdata =":|;|>|<|--|sp_|xp_|\|dir|cmd|^|(|)|+|$|'|copy|format|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
 
SQL_inj = split(SQL_Injdata,"|")
 
For SQL_Data=0 To Ubound(SQL_inj)
if instr(squery&sURL,Sql_Inj(Sql_DATA))>0 Then
Response.Write "SQL·À×¢ÈëÏµÍ³"
Response.end
end if
next
%>

<%
dbpath=server.mappath("../db/xsyzx-net.asp")  
set conn=server.createobject("adodb.connection")  
conn.open "provider=microsoft.jet.oledb.4.0;data source=" & dbpath
%>

<%
set rs=server.createobject("adodb.recordset")
sql="select * from docs where id="&request("id")         
rs.open sql,conn,1,1
url=""&rs("url1")&""

response.redirect ""&url&""
response.end
rs.close                               
set rs=nothing                               
conn.close                               
set conn=nothing%>

















