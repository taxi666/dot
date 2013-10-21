<%
Function checkPermission()
	If Session("admin")<>"" then 
		checkPermission=TRUE
	Else
		checkPermission=FALSE
	End if
End Function

tmpadmin=checkPermission()
If tmpadmin<>TRUE then
	response.redirect "../admin/login.asp?postion=2"
End if
%>