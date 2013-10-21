<!--#include file="dir.inc.asp"-->

<html>
<title>功能菜单</title>
<link rel="stylesheet" href="../styles/admin.css" type="text/css">
<head>


<SCRIPT language="javascript">
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
</head>
<BODY bgcolor="#799AE1" leftmargin="0" topmargin="0">
<div align=center>
  <table class="text" width="158" cellpadding="0" cellspacing="0" border="0" >
    <tr> 
      <td valign="top">
	    <table class="text" cellpadding="0" cellspacing="0" width="158">
          <tr> 
            <td height="42" valign="bottom">
			<img src="images/title.gif" width="158" height="38"> 
            </td>
          </tr>
        </table>
        <table class="text" cellpadding="0" cellspacing="0" width="158" align="center">
          <tr> 
            <td height="25" class="menu_title_menu"> 
              <div align="left">&nbsp;&nbsp;<a href="main.asp" target="_top"><b>管理首页</b></a> 
                | <a href="logout.asp" target="_top"> <b>退出</b></a> </div>
            </td>
          </tr>
        </table>
        &nbsp; 
        <%     
        '//管理菜单
        call showMenu()
	    %>
      </td>
    </tr>
  </table>
<p>&nbsp;</p></div>
</BODY>
</html>