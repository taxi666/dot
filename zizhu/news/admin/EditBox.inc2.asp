<%
Response.Buffer = true
On Error Resume Next
%>
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<%
'//预定义
dim newsId,rs,errorStr,content

'//初始化
errorStr=""
content = ""
newsId = Trim(Request.QueryString("newsId"))

if isNumeric(newsId)=false or newsId="" then
   newsId = 0       
end if

'//
'//取得文章信息
sql = "select content FROM n where id="&newsId
set rs=Server.CreateObject("ADODB.RecordSet")
rs.Open sql,conn,1,3
if rs.RecordCount=1 then
   '//读取文章信息  
  
      content = rs("content")
      content = Replace(content,"""","\""")
end if
rs.Close
set rs=nothing
%>