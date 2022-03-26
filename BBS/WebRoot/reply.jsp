<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>回帖</title>
	<link href="6.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <form name="postForm" onsubmit="return check()" action="manage/daReply.jsp" method="POST">
    <div id="apDiv1">
			<div align="center"class="STYLE1">校园BBS系统</div>
	</div>
	
		<div class="STYLE2" id="apDiv2">
			您尚未 <a href="login.jsp" target="_blank">登录</a>|
			<a href="reg.jsp"target="_blank">注册</a></div>
		<div class="STYLE3" id="apDiv3">
			>><a href="index.jsp">论坛首页</a>
			>><a href="index.jsp">C#语言</a>
			</div>
			<br>
		<div class="STYLE2" id="apDiv5">
			回复帖子
		</div>
		<div id="apDiv4">
			<table width="100%"height="100%"border="1"cellpadding="0"cellspacing="0">
				<tr>
					<td>
				<table>
					<tr><td align="right">标题</td><td><input type="text" name="title" /></td></tr>
					<tr><td align="right">内容</td><td><input type="text" name="content" /></td></tr>
					<tr><td></td><td>(不能大于：1000字)</td></tr>
				</table>
				</td>
				</tr>
				</table>
		</div>
		
		<div id="apDiv6">
				<p align="center"><input type="submit" name="button" id="button" value="提交"/>
				<input type="submit" name="button" id="button" value="重置" /></p>
		</div>
		</form>
  </body>
</html>
