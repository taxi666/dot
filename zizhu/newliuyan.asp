<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加留言</title>
</head>

<body>
<form id="form1" name="addliuyan" method="post" action="newliuyan2.asp"  onsubmit="javascript: return CheckValid();">
  <label>
    留言标题：<input name="biaoti" type="text" id="textfield"  size="50" />
    </label>
    <br /><br />
    留言内容：<br/>
    <label>
    <textarea name="neirong" cols="120" rows="10" id="textarea"></textarea>
  </label>
<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="post" value=" 确 定 "  ID="post" class="button2">

              <input type="reset" name="reset" value=" 重 置 " class="button2">
</form>
</body>
<script language="javascript">

function CheckValid()

{   
if(document.addliuyan.biaoti.value==""){

			alert('请输入留言标题.');

			document.addliuyan.biaoti.focus();

			return false;

			}

		if(document.addliuyan.neirong.value==""){

			alert('请输入留言内容.');

			document.addliuyan.neirong.focus();

			return false;

			}

		

}

</script>
</html>
