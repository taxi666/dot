<%
squery=lcase(Request.ServerVariables("QUERY_STRING"))
sURL=lcase(Request.ServerVariables("HTTP_HOST"))
 
SQL_injdata =":|;|>|<|--|sp_|xp_|\|dir|cmd|^|(|)|+|$|'|copy|format|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
 
SQL_inj = split(SQL_Injdata,"|")
 
For SQL_Data=0 To Ubound(SQL_inj)
if instr(squery&sURL,Sql_Inj(Sql_DATA))>0 Then
Response.Write "SQL防注入系统"
Response.end
end if
next
%>

<%
	'dim conn   
	'dim connstr   
	'on error resume next

	connstr = "DBQ=" + server.mappath("db/xsyzx-net.asp") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"       
	set conn=server.createobject("ADODB.CONNECTION")
	if err.number<>0 then 
		err.clear
		set conn=nothing
		response.write "数据库连接出错！"
		Response.End
	else
		conn.open connstr
		if err then 
			err.clear
			set conn=nothing
			response.write "数据库连接出错！"
			Response.End 
		end if
	end if   
	
	sub endConnection()
		conn.close
		set conn=nothing
	end sub				

%>