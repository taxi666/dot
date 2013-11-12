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
connstr = "DBQ=" + server.mappath("db/dot01.asp") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};uid=administrator;pwd=RRtqE1ZW0qs8;"   
set conn=server.createobject("adodb.connection")  
conn.open connstr

sub endConnection()
	conn.close
	set conn=nothing
end sub		
%>