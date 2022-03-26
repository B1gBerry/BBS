<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="GBK"%>
<%
   request.setCharacterEncoding("GBK");
   String userName=request.getParameter("uName");
   System.out.println(request.getParameter("uName"));
   String userPass=request.getParameter("uPass");
   UserDao userDao=new UserDaoImpl();
   User user=userDao.findUser(userName);
   if(user!=null && user.getUserPass().equals(userPass)){
        session.setAttribute("user",user);
        response.sendRedirect("../index.jsp");
        }else{
            out.println("用户名或密码不正确");
        }
 %>
