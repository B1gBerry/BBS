<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ע��</title>
	<link href="3.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <form name="postForm" onsubmit="return check()" action="manage/daReg.jsp" method="POST">
    <div id="apDiv1">
			<div align="center"class="STYLE1">У԰BBSϵͳ</div>
			</div>
		<div class="STYLE2" id="apDiv2">
			����δ <a href="login.jsp" target="_blank">��¼</a>|
			<a href="reg.jsp"target="_blank">ע��</a></div>
		<div class="STYLE3" id="apDiv3">
			>><a href="index.jsp">��̳��ҳ</a></div>
			<br>
		<div id = "apDiv4">
			<table >
				<tr >
					<td align="right">�û�����</td><td><input name="uName" type="text" id="textfield1" /><br /></td>
				</tr>
				<tr>
					<td align="right">��&nbsp;&nbsp;&nbsp;�룺</td><td><input name="uPass" type="password" id="textfield2" /><br /></td>
				</tr>
				<tr>
					<td align="right">ȷ�����룺</td><td><input name="uPass" type="password" id="textfield3" /><br /></td>
				</tr>
				<tr>
					<td align="right">�Ա�</td><td><input name="gender" type="radio" value="1" checked>��
								<input name="gender" type="radio" value="2" checked>Ů</td>
				</tr>
				<tr>
						    <td>
							<img src="1.gif" width="60" height="70">
							<label>
								<input name="head" type="radio" value="1" checked>
							</label>
							</td>
							<td>
							<img src="1.gif" width="60" height="70">
							<label>
								<input name="head" type="radio" value="1" checked>
							</label>
							</td>>
				</tr>
				<tr>
					<td><label><input type="submit" name="button" id="button" value="ע��" /></label></td>
				</tr>
			</table>
		</div>
		
		</form>
  </body>
</html>
