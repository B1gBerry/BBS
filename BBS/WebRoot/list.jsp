<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK"%>
<%
  TopicDao topicDao=new TopicDaoImpl();
  UserDao userDao=new UserDaoImpl();
  ReplyDao replyDao=new ReplyDaoImpl();
  BoardDao boardDao=new BoardDaoImpl();
  int boardId=Integer.parseInt(request.getParameter("boardId"));
  int p=Integer.parseInt(request.getParameter("page"));
  List listTopic=topicDao.findListTopic(p, boardId);
  Board board=boardDao.findBoard(boardId);
  int prep=p;
  int nextp=p;
  if(listTopic.size()==20){
         nextp=p+1;
  }
  if(p>1){
     prep=p-1;
  }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�����б�</title>
  </head>
  
  <body>
    <div id="apDiv1">
			<div align="center"class="STYLE1">У԰BBSϵͳ</div>
			</div>
			<br>
		    <%
    if(session.getAttribute("user") == null){
    %>
    <div class="h">
            ����δ:
            <a href="login.jsp" target="_blank">��¼</a>
            <a href="reg.jsp" target="_blank">&nbsp;ע��</a>
    </div>
   <%
 	 }else{
 		 User loginUser = (User)session.getAttribute("user");
    %>
     <div class="h">
            ���: <%= loginUser.getUserName()%> 
             &nbsp; ----&nbsp;<a href="manage/doLogout.jsp">�˳���¼</a>
     </div>
    <%
 	   }
    %>

		<div class="STYLE3" id="apDiv3">
			&gt;&gt;<b><a href="index.jsp">��̳��ҳ</a></b>
			<b><a href="list.jsp?page=1&boardId=<%=boardId %>"><%=board.getBoardName() %></a></b>
			</div>
			<br>
		<div id="apDiv4">
			<a href = "post.jsp?board =<%= boardId %>"><img src="img/post.gif" boarder = 0></a>
		</div>
		<div id="apDiv5">
			<a href="list.jsp?page=<%=prep %>&boardId=<%=boardId %>">��һҳ</a> 
			<a href="list.jsp?page=<%=nextp %>&boardId=<%=boardId %>">��һҳ</a>
		</div>
		<div id="apDiv6">
			<table width="100%"height="503"border="1"cellpadding="0"cellspacing="0">
				<tr>
					<td width="5%">&nbsp;</td>
					<td width="85%">����</td>
					<td width="5%">����</td>
					<td width="5%">�ظ�</td>
				</tr>
				<%
				   for(int i=0;i<listTopic.size();i++){
				     Topic topic=(Topic)listTopic.get(i);
				    
				     User user=userDao.findUser(topic.getUserId());
				 %>
				<tr>
					<td><IMG scr="img/topic.gif" board=0></td>
					<td style="FONT-SIZE:15px">
					     <a href="detail.jsp?page=1&boardId=<%=boardId %>&topicId=<%=topic.getTopicId() %>"><%=topic.getTitle() %></a>
					</td>
					<td align="center"><%=user.getUserName() %></td>
					<td align="center">
					   <%=replyDao.findCountReply(topic.getTopicId()) %></td>
				</tr>
				<%
				} 
				%>
				</table>
		</div>
		<div id="apDiv7">
			<a href="list.jsp?page=<%=prep %>&boardId=<%=boardId %>">��һҳ</a> |
			<a href="list.jsp?page=<%=nextp %>&boardId=<%=boardId %>">��һҳ</a>
		</div>
  </body>
</html>
