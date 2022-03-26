<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK" %>
<%
  TopicDao topicDao=new TopicDaoImpl();
  UserDao userDao=new UserDaoImpl();
  ReplyDao replyDao=new ReplyDaoImpl();
  BoardDao boardDao=new BoardDaoImpl();
  int boardId=Integer.parseInt(request.getParameter("boardId"));
  int topicId=Integer.parseInt(request.getParameter("topicId"));
  int p=Integer.parseInt(request.getParameter("page"));
  Board board=boardDao.findBoard(boardId);
  Topic topic=topicDao.findTopic(topicId);
  User topicUser=userDao.findUser(topic.getUserId());
  List listReply=replyDao.findListReply(p,topicId);
  int prep=p;
  int nextp=p;
  if(listReply.size()==10){
         nextp=p+1;
  }
  if(p>1){
     prep=p-1;
  }
  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>看帖</title>
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
		<div class="STYLE3" id="apDiv3">
			&gt;&gt;<b><a href="index.jsp">论坛首页</a></b>&gt;&gt;
			<b><a href="list.jsp?page=1&boardId=<%=boardId %>"><%=board.getBoardName() %></a></b></div>
			<br>
				 <a href="post.jsp?boardId=<%=boardId %>">发帖</a><br/>
		<div id="apDiv5">
			<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId %>&topicId=<%=topicId %>">上一页</a> |
			<a href="detail.jsp?page=<%=nextp %>&boardId=<%=boardId %>&topicId=<%=topicId %>">下一页</a>
		</div>
		<div class="STYLE2" id="apDiv6">
			<tr>
			   <th>本页主题：<%=topic.getTitle() %></th>
			</tr>
			<tr>
			  <td>&nbsp</td>
			</tr>
		</div>
		<%
		  if(p==1){
	%>
		<div id="apDiv7">
			<table  style="board-top-width:0px;table-layout:fixed"width="100%"height="503"border="1"cellpadding="0"cellspacing="0">
				<tr>
				    <th style="width:20%">
				        <b><%=topicUser.getUserName()%></b><br/>
				        <a href="reply.jsp?topicId=<%=topicId %>&boardId=<%=boardId %>">回帖</a>

				        注册:<%=topicUser.getRegTime() %><br/>
				    </th>
				    <th>
				        <h4 align="left"><%=topic.getTitle() %></h4>
				        <div align="left"><%=topic.getContent() %></div>
				        <div align="left">发表：[<%=topic.getPublishTime() %>]&nbsp;最后修改：[<%=topic.getModifyTime() %>]
				        </div>
				    </th>
				</tr>
			</table>
		</div>
		<%
	     }
	     for(int i=0;i<listReply.size();i++){
	       Reply reply=(Reply)listReply.get(i);
	       User replyUser=(User)userDao.findUser(reply.getUserId());
	    %>
	    <br/>
	    <!--  div id="apDiv8">-->
			<table width="100%"height="503"border="1"cellpadding="0"cellspacing="0">
			<tr>
			    <th style="width:20% ">
			       <b><%=replyUser.getUserName() %></b><br/><br/>
			       <image src="2.gif"/><br/>
			       注册：<%=topicUser.getRegTime() %><br/>
			    </th>
			    <th>
			       <h4 align="left"><%=reply.getTitle() %></h4>
			       <div align="left"><%=reply.getContent() %></div>
			       <div align="left">发表：[<%=reply.getPublishTime() %>]&nbsp;
			       最后修改：[<%=topic.getModifyTime() %>]
			          <a href="">[删除]</a>
			          <a href="">[修改]</a>
			       </div>
			    </th>
			 </tr>
		</table>
		<!--  /div-->
		<% } %>
		<div id="apDiv9">
			<a href="detail.jsp?page=<%=prep %>&boardId=<%=boardId %>&topicId=<%=topicId %>">上一页</a> |
			<a href="detail.jsp?page=<%=nextp %>&boardId=<%=boardId %>&topicId=<%=topicId %>">下一页</a>
		</div>
		<br>
  </body>
</html>

