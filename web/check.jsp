<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession ss=request.getSession(true);
        String un=request.getParameter("uname");
        String pw=request.getParameter("pass");
        ss.setAttribute("uname", un);
        ss.setAttribute("pass", pw);
        if(un.equalsIgnoreCase("admin") && pw.equalsIgnoreCase("admin"))
        {
            response.sendRedirect("home.jsp");
        }
 else 
 {
     response.sendRedirect("error.jsp");
 }
        %>
    </body>
</html>
