
<a href="javascript:goUrl()" target="_self">
<script type="text/javascript">
<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
exec="select top 5 * from news2 where cataid=1 and tu1<>'' order by id desc"
rs.open exec,conn,1,1
i=1
%>

<%do while not rs.eof%>

<%
maxlen=18 '其实是定好长度值 
title=rs("title") '变量赋数据记录的字段值 
If Len(title)>maxlen then title=left(title,maxlen-2)&"." ''如果变量长度大于20--最长长度,让变量长度变成(20-2),后接... 
%>

imgUrl<%=i%>="news/<%=rs("tu1")%>";
imgLink<%=i%>=escape("view.asp?id=<%=rs("id")%>");
imgtext<%=i%>="<%=title%>";

<%
i=i+1
rs.movenext
loop
rs.close
set rs=nothing
%>

var focus_width=250
var focus_height=188
var text_height=25
var swf_height = focus_height+text_height

var pics=imgUrl1+"|"+imgUrl2+"|"+imgUrl3+"|"+imgUrl4+"|"+imgUrl5
var links=imgLink1+"|"+imgLink2+"|"+imgLink3+"|"+imgLink4+"|"+imgLink5
var texts=imgtext1+"|"+imgtext2+"|"+imgtext3+"|"+imgtext4+"|"+imgtext5
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="images/pixviewer.swf"><param name="quality" value="high"><param name="bgcolor" value="#f0f0f0">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
document.write('<embed src="images/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0F0F0" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');  document.write('</object>');
</script>
</a>