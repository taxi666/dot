<%
Dim conn,db
Dim connstr
Dim SqlNowString,FalseType,TrueType,IsSqlDataBase
on error resume next
IsSqlDataBase	= 0		'主数据库类型(1=SQL，0=AC)

'db="../Databases/0791idc_Html.mdb" '数据库文件位置
db="../../db/xsyzx-net.asp" '数据库文件位置

if IsSqlDataBase=1 then
TrueType			= "1"
FalseType			= "0"
SqlNowString		= "GetDate()"
else
TrueType			= "True"
FalseType			= "False"
SqlNowString		= "Now()"
end if
connstr="DBQ="+server.mappath(""&db&"")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
if err then
err.clear
else
conn.open connstr
end if

sub CloseConn()
	conn.close
	set conn=nothing
end sub

%>
