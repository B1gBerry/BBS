<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>����</title>
	<link href="6.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <form name="postForm" onsubmit="return check()" action="manage/daReply.jsp" method="POST">
    <div id="apDiv1">
			<div align="center"class="STYLE1">У԰BBSϵͳ</div>
	</div>
	
		<div class="STYLE2" id="apDiv2">
			����δ <a href="login.jsp" target="_blank">��¼</a>|
			<a href="reg.jsp"target="_blank">ע��</a></div>
		<div class="STYLE3" id="apDiv3">
			>><a href="index.jsp">��̳��ҳ</a>
			>><a href="index.jsp">C#����</a>
			</div>
			<br>
		<div class="STYLE2" id="apDiv5">
			�ظ�����
		</div>
		<div id="apDiv4">
			<table width="100%"height="100%"border="1"cellpadding="0"cellspacing="0">
				<tr>
					<td>
				<table>
					<tr><td align="right">����</td><td><input type="text" name="title" /></td></tr>
					<tr><td align="right">����</td><td><input type="text" name="content" /></td></tr>
					<tr><td></td><td>(���ܴ��ڣ�1000��)</td></tr>
				</table>
				</td>
				</tr>
				</table>
		</div>
		
		<div id="apDiv6">
				<p align="center"><input type="submit" name="button" id="button" value="�ύ"/>
				<input type="submit" name="button" id="button" value="����" /></p>
		</div>
		</form>
  </body>
</html>
