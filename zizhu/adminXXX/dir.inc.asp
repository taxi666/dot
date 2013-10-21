<%
'//预定义
dim menu(5,3),j,tmpmenu,menuname,menurl

'menu(0,0)="内容管理系统"
'menu(0,1)="<a href=../news/admin/news.asp target=mainFrame>内容管理</a><!-- | <a href=../news/admin/guestbook.asp target=mainFrame>新闻评论</a>//-->"
'menu(0,2)="<a href=../news/admin/addcata.asp target=mainFrame>栏目管理</a> | <a href=../news/admin/fixcata.asp target=mainFrame>栏目合并</a>"
'menu(0,3)="<a href=../news/admin/addnews.asp target=mainFrame>发布信息</a>"

menu(0,0)="通知公告管理"
menu(0,1)="<a href=../news/admin/news_tz.asp target=mainFrame>通知列表</a>"
'menu(0,2)="<a href=../news/admin/addcata2.asp target=mainFrame>栏目分类</a> | <a href=../news/admin/fixcata2.asp target=mainFrame>栏目合并</a>"
menu(0,2)="<a href=../news/admin/addnews_tz.asp target=mainFrame>添加通知</a>"

menu(1,0)="招聘信息管理"
menu(1,1)="<a href=../news/admin/news_zp.asp target=mainFrame>信息列表</a>"
menu(1,2)="<a href=../news/admin/addnews_zp.asp target=mainFrame>添加信息</a>"


'menu(2,0)="招聘"
'menu(2,1)="<a href=../news/admin/addzp.asp target=mainFrame>发布招聘信息</a>"
'menu(2,2)="<a href=../news/admin/zpgl.asp target=mainFrame>招聘信息管理</a>"
'menu(2,3)="<a href=../news/admin/ypgl.asp target=mainFrame>应聘管理</a>"

menu(2,0)="留言管理"
menu(2,1)="<a href=../news/admin/admin_liuyan.asp?pageno=1 target=mainFrame>留言板管理</a>"
menu(2,2)="<a href=../news/admin/admin_jiajiao.asp?pageno=1 target=mainFrame>家教信息管理</a>"
'menu(1,0)="友情链接管理"
'menu(1,1)="<a href=../news/admin/addkc.asp target=mainFrame>添加友情链接</a>"
'menu(1,2)="<a href=../news/admin/kclb.asp target=mainFrame>友情链接列表</a>"

menu(3,0)="用户管理"
menu(3,1)="<a href=sysuser.asp target=mainFrame>用户信息</a>"


menu(4,0)="下载管理"
menu(4,1)="<a href=../news/admin/news_xz.asp target=mainFrame>文件列表</a>"
menu(4,2)="<a href=../news/admin/upload.asp target=mainFrame>添加文件</a>"


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