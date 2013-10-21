<%
'//[功能] 检查管理员是否登陆

Function CheckAdminPermission()
	If Trim(Session("CnltrAdminName"))<>"" then 
		CheckAdminPermission=TRUE
	Else
		CheckAdminPermission=FALSE
	End if
	
	adminUser = Trim(Session("CnltrAdminName"))
End Function


'//[功能] 替换' " & < >
'//[参数] strCheck 要替换的字符串

Function RtnReplaceString(strCheck) 
	RtnReplaceString = Replace(Replace(Replace(Replace(Replace(strCheck,"'","‘"),"""","“"),"&",""),"<","&lt;"),">","&gt;")
End Function

'//[功能] 判断是否是数字，否则用默认值替换
'//[参数] iCheck 要替换的变量,iDefault 默认值

Function RtnReplaceInt(iCheck,iDefault) 
	If Trim(iCheck)="" Then
		RtnReplaceInt = iDefault
		Exit Function
	End If

	If IsNumeric(iCheck)=false Then
		RtnReplaceInt = iDefault
		Exit Function
	End If

	RtnReplaceInt = iCheck
End Function

'//[功能] 将一文字中的HTML的标识去掉
Function FilterHTML(strToFilter)
	Dim strTemp
	strTemp = strToFilter
	While Instr(1,strTemp,"<") AND Instr(1, strTemp, ">")
		strTemp = Left(strTemp, Instr(1, strTemp, "<")-1) & Right(strTemp, Len(strTemp)-Instr(1,strTemp, ">"))
	WEnd
	FilterHTML = strTemp
End Function
%>