<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK"%>
<%
  BoardDao boardDao=new BoardDaoImpl();
  TopicDao topicDao=new TopicDaoImpl();
  UserDao userDao=new UserDaoImpl();
  Map mapBoard=boardDao.findBoard();
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>首页</title>
  </head>
  <body>
    <div id="apDiv1">
			<div align="center"class="STYLE1">校园BBS系统</div>
			</div>
			<br>
    <%
    if(session.getAttribute("user") == null){
    %>
    <div class="h">
            你尚未:
            <a href="login.jsp" target="_blank">登录</a>
            <a href="reg.jsp" target="_blank">&nbsp;注册</a>
    </div>
   <%
 	 }else{
 		 User loginUser = (User)session.getAttribute("user");
    %>
     <div class="h">
            你好: <%= loginUser.getUserName()%> 
             &nbsp; ----&nbsp;<a href="manage/doLogout.jsp">退出登录</a>
     </div>
    <%
 	   }
    %>

		<div id="apDiv3">
			<table width="100%"height="503"border="1"cellpadding="0"cellspacing="0">
				<tr>
					<td colspan="2"align="left"valign="middle"><span class="STYLE4">论坛</span></td>
					<td width="5%"class="STYLE4">主题</td>
					<td width="45%"class="STYLE4">最后发表</td>
				</tr>
				<%
				   List listMainBoard=(List)mapBoard.get(new Integer(0));
				   for(int i=0;i<listMainBoard.size();i++){
				      Board mainBoard=((Board)listMainBoard.get(i));
				 %>
				<tr>
					<td colspan="4"class="STYLE4"><%= mainBoard.getBoardName()%></td>
				</tr>
				<%
				  List listSonBoard=(List)mapBoard.get(new Integer(mainBoard.getBoardId()));
				  for(int j=0;j<listSonBoard.size();j++){
				        Board sonBoard=(Board)listSonBoard.get(j);
				        Topic topic=new Topic();
				        User user=new User();
				        int boardId=sonBoard.getBoardId();
				        List listTopic=topicDao.findListTopic(1, boardId);
				        if(listTopic!=null&&listTopic.size()>0){
				            topic=(Topic)listTopic.get(0);
				            user=userDao.findUser(topic.getUserId());
				            }
				 %>
				<tr class="STYLE4">
				  <td with="5%">&nbsp;</td>
				  <th align="left">
				  <IMG scr="board.gif">
				  <a href="list.jsp?page=1&boardId=<%=boardId %>"><%=sonBoard.getBoardName() %></a>
				  </th>
				  <td align="center"><%=topicDao.findCountTopic(boardId) %></td>
				  <th>
				    <span>
				       <a href="detail.jsp?page=1&boardId=<%=boardId %>&topicId=<%=topic.getTopicId() %>"><%=topic.getTitle() %></a>
				    </span>
				    <br/>
				    <span><%=user.getUserName() %></span>
				    <span class="gray">[<%=topic.getPublishTime() %>]</span>
				  </th>
				</tr>
				<%
				}
				}
				%>
					</table>
		</div>
  </body>
</html>
