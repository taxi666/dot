
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
's_keyword = trim(request("keyword"))
's_cataid=trim(request("cataid"))

dim pmcount,pageno

'//设置新闻显示数量
pmcount=8

dim rs,sql
set rs=server.createobject("adodb.recordset")

Function DelNews(idstr)
	sqld = "select * from jiajiao where id="&idstr
	set rsd=Server.CreateObject("ADODB.RecordSet")
	rsd.Open sqld,conn,1,3   
	if not rsd.EOF then
       rsd.Delete
       rsd.Update
	 
	end if
	 rsd.close	     
	   
    set rsd=nothing 
End Function

if request("action")="del" then	
	Dim strIdList,arrIdList,iId,i
	strIdList = Trim(Request("news"))
	If Not IsEmpty(strIdList) Then
		arrIdList = Split(strIdList,",")
		
		For i=0 To UBound(arrIdList)
			iId = clng(arrIdList(i))			
			Call DelNews(iId)			
		Next	
		
		response.write "<script language=javascript>"
		response.write "alert('删除成功！');"
		response.write "</script>"
	End If
end if
%>

<html>
<head>
<title>家教信息管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../css/style.css" type="text/css">
<script language="JavaScript">
<!--
function cdel(){
if (confirm("你真的要删除这些吗？不可恢复！")){
	document.delnews.submit();;
	}
}

function view(newsfile) {
	var gt = unescape('%3e');
	var popup = null;
	var over = "Launch Pop-up Navigator";
	popup = window.open('', 'popupnav', 'width=300,height=160,left=200,top=200,,resizable=no,scrollbars=no');
	if (popup != null) {
		if (popup.opener == null) {
		popup.opener = self;
		}
	popup.location.href = newsfile;
	}
}
function SelectCheckBox()
{
	for(i=0;i<document.delnews.elements.length;i++)
	{
		if(document.all("selectCheck").checked == true)
		{
			document.delnews.elements[i].checked = true;					
		}
		else
		{
			document.delnews.elements[i].checked = false;
		}
	}
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->
<br>
<table width="101%" border="0" align="center" cellspacing="3" cellpadding="3" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="2"><%=homepage_title%> - <font color="#FF0000">家教信息管理</font></td>
  </tr>
  <tr> 
    <td valign="top" nowrap> 
     
      <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolordark="#FFFFFF" bordercolorlight="#CCCCCC">
        
		<form name="delnews" action="admin_jiajiao.asp?action=del" method=post>
        <%
 dim id,parentname,telephone,address,sex,grade,course,addtime,requirements
sql="select * from jiajiao order by ID desc"
rs.open sql,conn,1,1
rcount=rs.recordcount

if pmcount="" or isempty(pmcount) or pmcount<1 then
        pmcount=8
end if
	rs.pagesize=pmcount   	'设置每页数
	mpage=rs.pagecount    	'得到总页数
	pageno=clng(request("pageno"))
	
if isempty(pageno) or cint(pageno)<1 or cint(pageno)>mpage then
	pageno=1
end if

if rs.bof and rs.eof then
	response.write "<tr><td colspan='6'><div align='center'>资料整理中</div></td></tr>"
else
	rs.absolutepage=pageno	'将指针移至指定页的第一条记录
	loopno=pmcount
	i=1
	do while not rs.eof and loopno>0
%>
<%
id=rs("id")
 parentname=rs("parentname")
telephone=rs("telno")
address=rs("address")
if rs("sex")=true then 
    sex="男"
else 
    sex="女"
end if
grade=rs("grade")
course=rs("course")
addtime=rs("addtime")
requirements=rs("requirements")%>
       <tr bgcolor="#EEEEEE" height="25">
    <td width="3%" rowspan="3" align="center">
        <input type='checkbox' name='news' value='<%=Trim(rs("id"))%>'> 
        <%=rs("id")%></td>
    <td width="15%">家长姓名：&nbsp;<%=parentname%></td> 
    <td width="11%" >学生性别：&nbsp;<%=sex%></td>
    <td width="18%">电话：&nbsp;<%=telephone%></td>
    
    <td width="18%">学生年级：&nbsp;<%=grade%></td>
    <td width="16%">辅导科目：&nbsp;<%=course%></td>
    <td width="19%">添加时间：&nbsp;<%=addtime%></td>
    </tr>
  <tr bgcolor="#EEEEEE" height="25">
    <td colspan="6" >家庭地址：&nbsp;<%=address%></td>
    </tr>
  <tr height="25" style="table-layout:fixed;word-break:break-all ">
    <td colspan="6">对老师要求：&nbsp;<%=requirements%>  </td>
    </tr>
        <%
		rs.movenext						
		loopno=loopno-1
		i=i+1
		loop		
		end if
		
		rs.close
		set rs=Nothing
		endconnection
		%>
		</form>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class=buinput>
        <form name="pageform" method=get action="admin_jiajiao.asp">
          <tr>
		    <td width="6%" height="25"> 
              <div align="center">
                <input type='checkbox' name='selectCheck' id=selectCheck onClick="SelectCheckBox()">
              </div>
            </td>
            <td width="16%">全部选中 <input name="delbtn" value=" 删 除 " type="button" class="button2" onClick="cdel();"></td>
            <td>
              <div align="right">跳到第 
                <input type=text size=3 name="pageno" value="<%=pageno%>" class="button1">
                页 
                <%if cint(pageno)>1 then%>
                [<a href='admin_jiajiao.asp?pageno=<%=pageno-1%>' class="tt4">上一页</a>] 
                <%end if
			if cint(pageno)<cint(mpage) then
			%>
                [<a href='admin_jiajiao.asp?pageno=<%=pageno+1%>' class="tt4">下一页</a>] 
                <%end if%>
                共<%=cstr(pageno)&"/"&cstr(mpage)&"页 "&cstr(rcount)%>条 </div>
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>

