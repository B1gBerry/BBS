<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="GBK" %>
<html>
<head>
</head>
<body>
<%
    if(session.getAttribute("user")!=null){
        session.removeAttribute("user");
    }
    response.sendRedirect("../index.jsp");
%>
</body>
</html>