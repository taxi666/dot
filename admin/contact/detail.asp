
<!--#include file="../../inc/setup.asp" -->
<!--#include file="../../dbconnect/news.admin.inc.asp" -->
<!--#include file="../../inc/SysLoginCheck.inc.asp" -->

<%
  dim rs,sql
  set rs=server.createobject("adodb.recordset")

  newsId = Trim(Request.QueryString("id"))
  
set rsp=Server.CreateObject("ADODB.RecordSet")
sqlp = "select * FROM contact where id="&newsId
rsp.Open sqlp,conn,1,3
  if rsp.RecordCount=1 then  
    mName=rsp("yourName")
    mCName=rsp("companyName")
    mEmail=rsp("email")
    mTel=rsp("tel")
    mEnquiry=rsp("enquiry")
    createTime=rsp("createTime") 
  end if
rsp.Close
set rsp=nothing

%>
<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../styles/admin.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="../../inc/top.asp" -->
<br>
<form name="pub_topic" method="post" action="add.asp?action=modify"  ID="pub_topic">
  <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>      
      <td>&nbsp;&nbsp;&nbsp;<%=homepage_title%> - <font color="#FF0000">�鿴��������</font></td>
    </tr>
    <tr>
      <td>
          <table width="98%" border="0" align="center" cellspacing="2" cellpadding="2"  class="detail_table">
            <tr> 
              <th width="25%">����</th>
              <td><%=mName%></td>
            </tr>
            <tr> 
              <th>��˾��</th>
              <td><%=mCName%></td>
            </tr>
            <tr> 
              <th>email</th>
              <td><%=mEmail%></td>
            </tr>
            <tr> 
              <th>�ֻ�����</th>
              <td><%=mTel%></td>
            </tr>
            <tr> 
              <th>��ѯ����</th>
              <td><%=mEnquiry%></td>
            </tr>
            <tr> 
              <th>����ʱ��</th>
              <td><%=createTime%></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td><a class="return_list" href="javascript:history.go(-1);">�����б�ҳ</a></td>
      </tr>
    </table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
<script type="text/javascript" src="../dist/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="../dist/jquery-ui-sliderAccess.js"></script>

<script type="text/javascript">     
  $(function(){
    $('#tabs').tabs();
    // $('.example-container > pre').each(function(i){
    //  eval($(this).text());
    // });
  $('#basic_example_2').datetimepicker({
      timeFormat: "hh:mm tt"
    });
  });     
</script>

</body>
</html>