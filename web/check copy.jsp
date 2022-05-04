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
        <%! String userdbName;
        String userdbPsw;
        %>
        <%
        Connection con= null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String driverName = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/insurance?zeroDateTimeBehavior=convertToNull&allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String dbpsw = "root";
        String name = request.getParameter("Username");
        String password = request.getParameter("Userpass");
        String sql = "select * from users where Username="+name+" and Userpass="+password;
        if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
        {
        try{
        Class.forName(driverName);
        con = DriverManager.getConnection(url, user, dbpsw);
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        if(rs)
        { 
        session.setAttribute("name",name);
        response.sendRedirect("home.jsp"); 
        }
        else
        response.sendRedirect("error.jsp");
        rs.close();
        ps.close(); 
        }
        catch(SQLException sqe)
        {
        System.out.println(sqe);
        } 
        }
        %>
    </body>
</html>
