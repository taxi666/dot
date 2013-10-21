<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body  bottommargin="0" topmargin="0">

<table align="center" border="0" cellpadding="4" cellspacing="0" width="760" bgcolor="#fcfcfc" bordercolor="#609C09" style="border-top:0;border-bottom:0;border-left:1px solid;border-right:1px solid" height="100%">

<tr>

  <td align="center"><p>&nbsp;</p><h3 class="style1"><font color="#e60000">聘请家教登记</font></h3></td>

</tr>



<tr>

  <td><p>&nbsp;</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注意:带有<font color=D11B00>*</font>的项目必须填写</td>

</tr>

<tr>

  <td>

    <form method="post" action="regjiajiao.asp" name="Regjiajiao" onSubmit="javascript: return CheckValid();">

    <table width="760" border="0" cellspacing="0" cellpadding="4" align="center">

    <tr>

      <td width="110" align="right"><font color=#D11B00>*</font>家长姓名</td>

      <td width="320">&nbsp;&nbsp;<input name="Parentname" size="15" type="text"></td>

      <td width="300">请清楚、完整地填写,以方便我们查询</td>

  </tr>

  <tr>

      <td align="right"><font color=#D11B00>*</font>家庭地址</td>

      <td>&nbsp;&nbsp;<input name="Address" type="text" id="Address" size="40"></td>

      <td>&nbsp;</td>

  </tr>

  <tr>

      <td align="right"><font color=#D11B00>*</font>电话</td>

      <td>&nbsp;

              <input name="Hometel" type="text" id="Hometel" size="15" maxlength="13"></td>

      <td>请务必填写，以方便我们和您联系</td>

  </tr>

  <tr>

    <td align="right"><font color=#D11B00>*</font>学生性别</td>

    <td>&nbsp;&nbsp;

        <input type="radio" name="Sex" value="男" checked>男 

        <input type="radio" name="Sex" value="女">女</td>

    <td>&nbsp;</td>

  </tr>

  <tr>

    <td align="right"><font color=#D11B00>*</font>学生年级</td>

    <td>&nbsp;&nbsp;<input name="Grade" type="text" size="15"></td>

    <td>请输入学生年级，如不是在校学生，可填&ldquo;成人&rdquo;</td>

  </tr>

  <tr>

    <td align="right"><font color=#D11B00>*</font>辅导科目</td>

    <td>&nbsp;&nbsp;<input name="Course" type="text" size="30"></td>

    <td>可填写如&ldquo;数学&rdquo;，&ldquo;英语&rdquo;，&ldquo;音乐&rdquo;，&ldquo;美术&rdquo;等</td>

  </tr>

  <tr>

    <td align="right">对教师要求</td>

    <td>&nbsp;&nbsp;<textarea name="Need" cols="40" rows="5"></textarea></td>

    <td>可简要填写对教师的要求</td>

  </tr>

  

  <tr>

      <td align="center" colspan="3">

        <p>&nbsp;</p>

	          <input name="submit" type="image"  value="提交"  src="images/submit.gif"  >

		

		<!-- A href="#" onclick="if CheckValid() then Regjiajiao.submit()">提交</A></td--></td>

   </tr>

  </table>

  </form>

  </td>

</tr>

 

</table>

</body>



<script language="javascript">

function CheckValid()

{    if(document.Regjiajiao.Parentname.value==""){

			alert('请输入家长姓名.');

			document.Regjiajiao.Parentname.focus();

			return false;

			}

		if(document.Regjiajiao.Address.value==""){

			alert('请输入家庭住址.');

			document.Regjiajiao.Address.focus();

			return false;

			}

		if(document.Regjiajiao.Hometel.value==""){

			alert('请输入家庭电话.');

			document.Regjiajiao.Hometel.focus();

			return false;

			}			

		if(document.Regjiajiao.Grade.value==""){

			alert('请输入学生年级.');

			document.Regjiajiao.Grade.focus();

			return false;

			}

		if(document.Regjiajiao.Course.value==""){

			alert('请输入辅导科目.');

			document.Regjiajiao.Course.focus();

			return false;

			}

			

	
	

		//  注释：校验家庭电话是否正确

		var home_tel =  document.Regjiajiao.Hometel.value;

		var  len =  home_tel.length;

		var i;

		for(i =0; i <len ; i++)

		{

			if((home_tel.charAt(i) <='9' && home_tel.charAt(i) >= '0'))

				continue;

			alert("请正确输入电话号码.");

			document.Regjiajiao.Hometel.focus();

			return false;

		}



	var	boolean= window.confirm("请仔细核对您填写的信息，确认提交吗？");

	if(boolean==false)

	return false; 

		

}

</script>
</html>
