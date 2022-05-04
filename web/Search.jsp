<%--
    Document   : Catgeory1
    Created on : 26 Mar, 2011, 11:37:33 AM
    Author     : vedisoft
--%>
<%@page import="java.util.Vector" %>

<%@page import="java.util.Vector,mypack.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>

    <%
                HttpSession ss = request.getSession();
                response.setHeader("Cache-control", "no-cache");
                String un = (String) ss.getAttribute("uname");
                String pw = (String) ss.getAttribute("pass");
                if (un == null) {
                    response.sendRedirect("Login.jsp");
                }
                response.setContentType("text/html");
                //PrintWriter out=response.getWriter();
                //RequestDispatcher r=request.getRequestDispatcher("Login.jsp");
                //r.include(request, response);
    %>


    <jsp:include page="header.html"/>
    <body>

        <form name="thisform">





            <table border="1" width="1000" align="center">
                <tr>

                    <td> Holder Name</td>
                    <td>  <input type ="text" name="name" ></td></tr>



                <tr>
                <tr><td><input type="submit" value="SEARCH"></td>
                </tr>

                          <th>Holder ID</th>
                <th>Holder Name</th>
                <th>Holder Address</th>
                <th>Holder City</th>
                <th>Holder State</th>
                <th>Holder Email</th>
                <th>Holder Mobile</th>



                </tr>
                <%

                            String str = request.getParameter("name");
                            if (str != null) {

                                Vector v = holders.getRecords2(str);

                                for (int i = 0; i < v.size(); i++) {
                                    Vector v1 = (Vector) v.elementAt(i);



                %>
                <tr>
                    <td><%=v1.elementAt(0)%></td>
                    <td> <%=v1.elementAt(1)%></td>
                    <td><%=v1.elementAt(2)%></td>
                    <td><%=v1.elementAt(3)%></td>
                    <td> <%=v1.elementAt(4)%></td>

                    <td> <%=v1.elementAt(5)%></td>

                    <td>  <%=v1.elementAt(6)%></td><%  }
                                }
                    %>



            </table>

        </form>



    </body>
    <jsp:include page="footer.html"/>
</html>
