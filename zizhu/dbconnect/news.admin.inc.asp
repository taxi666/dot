<%
	'dim conn   
	'dim connstr   
	'on error resume next

	connstr = "DBQ=" + server.mappath("../../db/xsyzx-net.asp") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"       
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