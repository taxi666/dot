<%
	'dim conn   
	'dim connstr   
	'on error resume next

	connstr = "DBQ=" + server.mappath("../../db/dot01.asp") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};uid=administrator;pwd=RRtqE1ZW0qs8;"       
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