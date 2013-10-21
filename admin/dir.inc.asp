<%
'//预定义
dim menu(4,3),j,tmpmenu,menuname,menurl

menu(0,0)="Event信息管理"
menu(0,1)="<a href=event/list.asp target=mainFrame>Event列表</a>"
menu(1,0)="留言信息管理"
menu(1,1)="<a href=contact/list.asp target=mainFrame>留言列表</a>"

sub showMenu()
    dim menuStr
    for i=0 to ubound(menu,1)
        menuStr = "<br><table cellpadding=0 cellspacing=0 width=158>"&_
                  "<tr>"&_
                  "<td height=25 class=menu_title onmouseover='this.className=""menu_title2""' onmouseout='this.className=""menu_title"";' background=images/admin_left_"&(i+1)&".gif id=menuTitle1 onclick=showsubmenu("&i&")>"&_
                  "<span>"&menu(i,0)&"</span>"&_
                  "</td>"&_
                  "</tr>"&_
                  "<tr>"&_
                  "<td style='display:' id='submenu"&i&"'>"&_   
                  "<div class=sec_menu style='width:158'>"&_ 
                  "<table cellpadding=0 cellspacing=0 align=center width=135 ID=Table1>"   

    	for j=1 to ubound(menu,2)
	        if isempty(menu(i,j)) then exit for
	        menuStr = menuStr&"<tr><td height=20>"&menu(i,j)&"</td></tr>"
	    next
	    
	    menuStr = menuStr&"</table>"&_
	                      "</div>"&_
	                      "</td>"&_
	                      "</tr>"&_
	                      "</table>"

	    Response.Write menuStr
    next
end sub
%>