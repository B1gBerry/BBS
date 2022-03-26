<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK"%>
<%
   request.setCharacterEncoding("GBK");
   String userName=request.getParameter("uName");
   String userPass=request.getParameter("uPass");
   String head=request.getParameter("head");
   int gender = Integer.parseInt(request.getParameter("gender"));
   UserDao userDao=new UserDaoImpl();
   User user=new User();
   user.setUserName(userName);
   user.setHead(head);
   user.setUserPass(userPass);
   user.setGender(gender);
   int num=userDao.addUser(user);
   if(num==1){
        response.sendRedirect("../index.jsp");
     } else{
          response.sendRedirect("../reg.jsp");
     }
   
 %>
