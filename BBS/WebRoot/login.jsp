<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��¼</title>
  </head>
  <body>
  <form name="postForm" onsubmit="return check()" action="manage/doLogin.jsp" method="POST">
    <div id="apDiv1">
			<div align="center"class="STYLE1">У԰BBSϵͳ</div>
			</div>
		<div class="STYLE2" id="apDiv2">
			����δ <a href="login.jsp" target="_blank">��¼</a>|
			<a href="reg.jsp"target="_blank">ע��</a></div>
		<div class="STYLE3" id="apDiv3">
			>><a href="index.jsp">��̳��ҳ</a></div>
			<br>
		<div id="apDiv4">
		<form id="form1" name="form1" method="post" action="">
			<table>
				<tr>
					<td>�û�����</td><td><input name="uName" type="text" id="textfield1" /><br /></td>
				</tr>
				<tr>
					<td>��&nbsp;&nbsp;&nbsp;�룺</td><td><input name="uPass" type="password" id="textfield2" /><br /></td>
				</tr>
				<tr>
					<td><input type="submit" name="button" id="button" value="��¼" /></td>
				</tr>
			</table>				
		</form>
		</div>
	</form>	
  </body>
</html>
