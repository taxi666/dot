
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
's_keyword = trim(request("keyword"))
's_cataid=trim(request("cataid"))

dim pmcount,pageno

'//设置显示数量
pmcount=news_back_count

dim rs,sql
set rs=server.createobject("adodb.recordset")

Function DelNews(idstr)
	sqld = "select * from contact where id="&idstr
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
<title>通知公告管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../styles/admin.css" type="text/css">
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
<table width="100%" border="0" align="center" cellspacing="3" cellpadding="3" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="2"><%=homepage_title%> - <font color="#FF0000">招聘信息管理</font></td>
  </tr>
  <tr> 
    <td valign="top" nowrap> 
     
      <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolordark="#FFFFFF" bordercolorlight="#CCCCCC">
        <tr bgcolor="#799AE1"> 
          <td width="4%"> 
            <div align='center'><font color="#FFFFFF">选定</font></div>
          </td>
 
          <td width="6%" height="20" bgcolor="#799AE1"> 
            <div align="center"><font color="#FFFFFF">ID</font></div>
          </td>
          <td width="10%" height="20" bgcolor="#799AE1"> 
            <div align="center"><font color="#FFFFFF">名字</font></div>
          </td>
          <td width="16%" height="20" bgcolor="#799AE1"> 
            <div align="center"><font color="#FFFFFF">公司名称</font></div>
          </td>
          <td width="40%" height="20" bgcolor="#799AE1"> 
            <div align="center"><font color="#FFFFFF">咨询内容</font></div>
          </td>
          <td width="18%" height="20"> 
            <div align="center"><font color="#FFFFFF">添加时间</font></div>
          </td>
        </tr>
		<form name="delnews" action="del_liuyan.asp" method="post">
        <%
sql="select * from contact order by ID desc"
rs.open sql,conn,1,1
rcount=rs.recordcount

if pmcount="" or isempty(pmcount) or pmcount<1 then
        pmcount=20
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
        <tr> 
          <td> 
            <div align='center'><input type='checkbox' name='id' value='<%=Trim(rs("id"))%>'></div>
          </td>
          
          <td height="22"> 
            <div align="center"><%=rs("id")%></div>
          </td>
          <td height="22"><a href="detail.asp?id=<%=rs("id")%>" class="tt4" title="<%=rs("yourName")%>"> 
            <% 
			
			if len(rs("yourName"))>40 then
				response.write "<font style='word-break:break-all;'>"&left(rs("title"),40)&"....</font>"
            else
				response.write "<font style='word-break:break-all;'>"&rs("yourName")&"</font>"
            end if

			
			%>
            </a></td>
          <td height="22"> 
            <div align="center"><%=rs("companyName")%></div>
          </td>
          <td height="22"> 
            <div align="center"><%=rs("enquiry")%></div>
          </td>
          <td height="22"> 
            <div align="center"><%=rs("createTime")%></div>
          </td>
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
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
        <form name="pageform" method=get action="list.asp">
          <tr>
		    <td width="3%" height="25"> 
              <div align="right">
                <input type='checkbox' name='selectCheck' id="selectCheck" onClick="SelectCheckBox()"/>
              </div>
            </td>
            <td width="16%">全部选中 <input name="delbtn" value=" 删 除 " type="button" class="button2" style="margin-left:20px;" onClick="cdel();"/></td>
            <td>
              <div align="right">跳到第 
                <input type=text size=3 name="pageno" value="<%=pageno%>" class="button1">
                页 
                <%if cint(pageno)>1 then%>
                [<a href='list.asp?pageno=<%=pageno-1%>' class="tt4">上一页</a>] 
                <%end if
			if cint(pageno)<cint(mpage) then
			%>
                [<a href='list.asp?pageno=<%=pageno+1%>' class="tt4">下一页</a>] 
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

