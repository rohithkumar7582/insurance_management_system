<%-- 
    Document   : home
    Created on : 1 Apr, 2011, 3:20:42 PM
    Author     : vedisoft
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

<%
HttpSession ss=request.getSession();
response.setHeader("Cache-control", "no-cache");
String un=(String)ss.getAttribute("uname");
String pw=(String)ss.getAttribute("pass");
 if (un==null)
{
     response.sendRedirect("Login.jsp");
 }
response.setContentType("text/html");
//PrintWriter out=response.getWriter();
//RequestDispatcher r=request.getRequestDispatcher("Login.jsp");
//r.include(request, response);
%>


        <jsp:include page="header.html"/>
    <body BGCOLOR="#A8A8A8">

        <h1 align="center"><marquee>WELCOME TO INSURANCE MANAGEMENT</marquee></h1>
        <form>
          
            <table align="center">
                <tr><td><img src ="images/in1.jpg"></td>
                    <td><img src ="images/in4.jpg"></td>
                    <td><img src ="images/in5.jpg"></td>
                </tr>
            </table>
        </form>
    </body>
        <jsp:include page="footer.html"/>
</html>
