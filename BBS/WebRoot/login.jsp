<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
  </head>
  <body>
  <form name="postForm" onsubmit="return check()" action="manage/doLogin.jsp" method="POST">
    <div id="apDiv1">
			<div align="center"class="STYLE1">校园BBS系统</div>
			</div>
		<div class="STYLE2" id="apDiv2">
			您尚未 <a href="login.jsp" target="_blank">登录</a>|
			<a href="reg.jsp"target="_blank">注册</a></div>
		<div class="STYLE3" id="apDiv3">
			>><a href="index.jsp">论坛首页</a></div>
			<br>
		<div id="apDiv4">
		<form id="form1" name="form1" method="post" action="">
			<table>
				<tr>
					<td>用户名：</td><td><input name="uName" type="text" id="textfield1" /><br /></td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;&nbsp;码：</td><td><input name="uPass" type="password" id="textfield2" /><br /></td>
				</tr>
				<tr>
					<td><input type="submit" name="button" id="button" value="登录" /></td>
				</tr>
			</table>				
		</form>
		</div>
	</form>	
  </body>
</html>
