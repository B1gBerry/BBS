<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册</title>
	<link href="3.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <form name="postForm" onsubmit="return check()" action="manage/daReg.jsp" method="POST">
    <div id="apDiv1">
			<div align="center"class="STYLE1">校园BBS系统</div>
			</div>
		<div class="STYLE2" id="apDiv2">
			您尚未 <a href="login.jsp" target="_blank">登录</a>|
			<a href="reg.jsp"target="_blank">注册</a></div>
		<div class="STYLE3" id="apDiv3">
			>><a href="index.jsp">论坛首页</a></div>
			<br>
		<div id = "apDiv4">
			<table >
				<tr >
					<td align="right">用户名：</td><td><input name="uName" type="text" id="textfield1" /><br /></td>
				</tr>
				<tr>
					<td align="right">密&nbsp;&nbsp;&nbsp;码：</td><td><input name="uPass" type="password" id="textfield2" /><br /></td>
				</tr>
				<tr>
					<td align="right">确认密码：</td><td><input name="uPass" type="password" id="textfield3" /><br /></td>
				</tr>
				<tr>
					<td align="right">性别</td><td><input name="gender" type="radio" value="1" checked>男
								<input name="gender" type="radio" value="2" checked>女</td>
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
					<td><label><input type="submit" name="button" id="button" value="注册" /></label></td>
				</tr>
			</table>
		</div>
		
		</form>
  </body>
</html>
