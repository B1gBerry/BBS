<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK"%>
<%
  request.setCharacterEncoding("GBK");
  String title=request.getParameter("title");
  System.out.println(title);
  String content=request.getParameter("content");
  int boardId = Integer.parseInt( request.getParameter("boardId"));
  int topicId = Integer.parseInt( request.getParameter("topicId")); 
  User user = (User)session.getAttribute("user");
  ReplyDao replyDao = new ReplyDaoImpl();
  if( user!= null){
		  Reply reply=new Reply();
		  reply.setTitle(title);
		  reply.setContent(content);
		  reply.setTopicId(topicId);
		  reply.setUserId(user.getUserId());
		  replyDao.addReply(reply);
		  response.sendRedirect("../detail.jsp?page=1&boardId="+boardId+"&topicId = "+topicId);
  }else{
  		response.sendRedirect("../login.jsp");
  }
 %>
