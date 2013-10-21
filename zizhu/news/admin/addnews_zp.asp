
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
	dim rs,sql
	set rs=server.createobject("adodb.recordset")
	action = "addnew"
	newsId = Trim(Request.QueryString("newsId"))
	
	if isNumeric(newsId)=false or newsId="" then
		newsId=0
		action = "addnew"
	end if
	

set rsp=Server.CreateObject("ADODB.RecordSet")
sqlp = "select * FROM zhaopin where id="&newsId
rsp.Open sqlp,conn,1,3
	if rsp.RecordCount=1 then
		action = "modify"   
		mtitle=rsp("title")
		mcontent=rsp("content")
	
		
	else
		action = "addnew"
		newsId = 0
	end if
rsp.Close
set rsp=nothing

sub produceForm()

	mtitle=trim(request.form("title"))
	mfrom=trim(request.form("from"))
	mContent = trim(Request.form("cnWords")) 
	mContent = Replace(mContent,"<script","<sscript") 
	mContent = Replace(mContent,"/script>","/scripts>")
	mContent = Replace(mContent,"/script >","/scripts>")
			   
	sqlq = "select * from zhaopin where id="&Trim(Request.Form("newsId"))
	set rsq = Server.CreateObject("ADODB.RecordSet")
	rsq.Open sqlq,conn,1,3
        if Trim(Request.Form("action"))="modify" then
			if rsq.RecordCount = 1 then
			//修改
				
				rsq("title") = mtitle
				rsq("content") = mcontent				
				rsq.Update
             end if 
			 Response.Write("<Script Language='Javascript'>")
			 Response.Write("alert('修改成功!');")
			 Response.Write("</Script>")
             Response.Write "<script language=javascript>"&_
                            "history.go(-2);"&_
                            "</script>"                                     
		else
            rsq.AddNew
			rsq("title") = mtitle
			rsq("content") = mcontent
			rsq("date") = Now()
			rsq.update
			Response.Write("<Script Language='Javascript'>")
			Response.Write("alert('保存成功!');")
			Response.Write("</Script>")	
		end if
	rsq.Close
	set rsq = nothing 
end sub

if Trim(Request.Form("action"))<>"" then
   call produceForm()
end if

%>
<html>
<head>
<title>增加通知公告</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../css/style.css" type="text/css">
<script language=javascript>
<!--

function CContext()
{}
var g_cContext = new CContext();
g_cContext.StaticContentServer = '';


function saveIt()
{
  document.pub_topic.cnWords.value = document.frames.cnEditBox.getHTML(true);     

	

	
     document.pub_topic.submit();
}
//-->
</script>
<script language="Javascript">
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
function openem()
{ 
openScript('Up1.asp',460,220); 
}
function openem2()
{ 
openScript('Up2.asp',460,220); 
}
function openem3()
{ 
openScript('Up3.asp',460,220); 
}
function openem4()
{ 
openScript('Up4.asp',460,220); 
}
function openem5()
{ 
openScript('Up5.asp',460,220); 
}
function openem6()
{ 
openScript('Up6.asp',460,220); 
}
</script>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->
<br>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
        
    <td>&nbsp;&nbsp;&nbsp;<%=homepage_title%> - <font color="#FF0000">添加/修改招聘信息
      </font>
     <form name="pub_topic" method="post" action="addnews_zp.asp?action=addnew"  ID="pub_topic">
        <table width="98%" border="0" align="center" cellspacing="2" cellpadding="2">
       
          <tr> 
            <td width="13%"> 
              <div align="right">招聘信息标题：</div>            </td>
            <td colspan="2"> 
              <input type="text" name="title" size="30" class="button1" value="<%=mtitle%>">            </td>
          </tr>
          <tr> 
            <td valign="top" width="13%"> 
              <div align="right">招聘信息内容：</div>            </td>
            <td colspan="2"> <IFRAME STYLE="border: none" NAME=cnEditBox src="EditBox_zp.asp?newsId=<%=newsId%>" WIDTH=500 HEIGHT=400></IFRAME>            </td>
          </tr>
          <%if news_permission ="yes" then%>
          <%end if%>
          
    
          <tr> 
            <td>&nbsp;</td>
            <td colspan="2"> 
              <input type="button" name="post" value=" 发 表 " onClick="return saveIt();" ID="post" class="button2">
              <input type="hidden" name="newsId" value="<%=newsId%>">
              <input type="hidden" name="action" value="<%=action%>">
              <input type="reset" name="reset" value=" 重 置 " class="button2">
              <!--获取EditBox的内容-->
              <input name=cnWords type=hidden ID="cnWords" value="">
              
  
              <!--获取EditBox的内容-->            </td>
          </tr>
        </table>
</form>
		</td>
      </tr>
    </table>
</body>
</html>