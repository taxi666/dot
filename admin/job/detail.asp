
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
  dim rs,sql
  set rs=server.createobject("adodb.recordset")

  newsId = Trim(Request.QueryString("id"))
  
set rsp=Server.CreateObject("ADODB.RecordSet")
sqlp = "select * FROM job where id="&newsId
rsp.Open sqlp,conn,1,3
  if rsp.RecordCount=1 then  
    mName=rsp("jobName")
    mDescribe=rsp("jobDescribe")
    mResponsibilities=rsp("jobResponsibilities")
    mRequirements=rsp("jobRequirements")
    createTime=rsp("createTime") 
  end if
rsp.Close
set rsp=nothing

%>
<html>
<head>
<title>job信息详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../styles/admin.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->
<br>
<form name="pub_topic" method="post" action="add.asp?action=modify"  ID="pub_topic">
  <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>      
      <td>&nbsp;&nbsp;&nbsp;<%=homepage_title%> - <font color="#FF0000">查看job信息详情</font></td>
    </tr>
    <tr>
      <td>
          <table width="98%" border="0" align="center" cellspacing="2" cellpadding="2"  class="detail_table">
            <tr> 
              <th width="25%">名称</th>
              <td><%=mName%></td>
            </tr>
            <tr> 
              <th>简介</th>
              <td><%=mDescribe%></td>
            </tr>
            <tr> 
              <th>职责</th>
              <td><%
                  job_re=Split(mResponsibilities,"$$")
                  if ubound(job_re)>=0 then
                  For j=0 to ubound(job_re)%>
                  <div><%=job_re(j)%>.</div><%Next
                  end if
                %></td>
            </tr>
            <tr> 
              <th>应聘要求</th>
              <td>
                <%
                  job_re=Split(mRequirements,"$$")
                  if ubound(job_re)>=0 then
                  For j=0 to ubound(job_re)%>
                  <div><%=job_re(j)%>.</div><%Next
                  end if
                %>
              </td>
            </tr>
            <tr> 
              <th>Event创建时间</th>
              <td><%=createTime%></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td><a class="return_list" href="javascript:history.go(-1);">返回列表页</a></td>
      </tr>
    </table>
</form>
</body>
</html>