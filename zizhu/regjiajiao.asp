
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<TITLE> 聘请家教登记确认 </TITLE>

<title>无标题文档</title>
</head>

<%  dim parentname,address,telno,sex,grade,course,requirement,addtime
 parentname=request("Parentname")
   address=request("Address")
   telno=request("Hometel")
   sex=request("Sex")
   grade=request("Grade")
   course=request("Course")
   requirement=request("Need")
   addtime=Now()
   %>

<!--#include file ="conn.asp"-->
	          <%
		set rs=server.createobject("adodb.recordset")
		exec="select * from jiajiao"
		rs.open exec,conn,1,3
		rs.addnew
		rs("parentname")=trim(parentname)
		rs("address")=trim(address)
		rs("telno")=trim(telno)
		if sex="男"  then
    rs("sex")=true
   else  
   rs("sex")=false
   end if
         rs("grade")=trim(grade)
		 rs("course")=trim(course)
		 rs("requirements")=trim(requirement)
		 rs("addtime")=addtime
		 rs.update
		rs.close()
		set rs=nothing
		%>

<body bottommargin="0" topmargin="0" >
<table  align="center"  cellpadding="4" cellspacing="0" width="760" height="100%" bgcolor="#fcfcfc" bordercolor="#000" style="border-top:0;border-bottom:0;border-left:1px solid;border-right:1px solid" >

   <tr>

     <td align="left"  valign="bottom"><P>&nbsp;</P>

	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	 &nbsp;&nbsp;&nbsp;&nbsp;<font  color=D11B00>您登记的信息已提交成功。我们会尽快和您联系，如有问题，请致电：。以下是您提交的聘请家教登记信息：</font></td>

   </tr>

   <tr>

     <td align="center">

	     <table width="550" border="0" cellspacing="0" cellpadding="4">

           <tr>

              <td width="32%" align="right" height="40">家长姓名：</td>

              <td width="68%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=parentname%></td>

          </tr>

              <td align="right" height="40">家庭地址：</td>

              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=address%></td>

          </tr>

          <tr>

              <td align="right" height="40">家庭电话：</td>

              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=telno%></td>

         </tr>

        

         <tr>

             <td align="right" height="40">学生性别：</td>

            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sex%></td>

        </tr>

        <tr>

		    <td align="right"  height="40">学生年级：</td>

			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=grade%></td>

		</tr>

		<tr>

		    <td align="right" height="40">辅导科目：</td>

			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=course%></td>

		</tr>

		<tr>

		   <td align="right" height="80">对教师要求：</td>

		   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=requirement%></td>

		</tr>

      </table>

    </td>

  </tr>

  <tr>

    <td align="center"><input name="return" type="image" onClick="window.opener=null;window.close();"value="关闭" src="images/quanbi.gif"></td>

  </tr>

  

</table>

</body>
</html>


