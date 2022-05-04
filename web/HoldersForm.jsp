<%--
    Document   : Catgeory1
    Created on : 26 Mar, 2011, 11:37:33 AM
    Author     : vedisoft
--%>
<%@page import="java.util.Vector,mypack.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean class="mypack.holders" id="x"/>
<jsp:setProperty name="x" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Holders Form</title>
        <script>
            function Add()
            {
                document.thisform.action="AddHolders.jsp";
                document.thisform.submit();
            }

            function edit(id){
                document.thisform.HolderId.value=id;
                document.thisform.action="EditHolders.jsp";
                document.thisform.submit();
            }
            function del(id){
                document.thisform.HolderId.value=id;
                b=confirm("are you want to sure to delete");
                if(b){
                    document.thisform.submit();
                }
            }
        </script>
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
    <body>

        <form name="thisform">


            <input type="hidden" name="HolderId">
         
            <table border="1" width="1000" align="center">
                <tr>
                    <th>Holder Name</th>
                    <th>Holder Address</th>
                    <th>Holder City</th>
                    <th>Holder State</th>
                    <th>Holder Email</th>
                    <th>Holder Moblie</th>
                   
                    <th colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PolicyDetails ID</th><th align="left">   <input type="button" value="add" onclick="Add()"/></th>

                </tr>
                <%
                            if (request.getParameter("HolderId") != null) {

                                int b = Integer.parseInt(request.getParameter("HolderId"));

                                x.setHolderId(b);
                                boolean b1 = x.delete();
                                if (b1) {
                                }
                            }
                %>

                <%

                            Vector v = holders.getRecords();

                            for (int i = 0; i < v.size(); i++) {
                                Vector v1 = (Vector) v.elementAt(i);
                                int eid = (Integer) v1.elementAt(0);


                %>
                <tr>
                    <td><%=v1.elementAt(1)%></td>
                    <td> <%=v1.elementAt(2)%></td>
                    <td><%=v1.elementAt(3)%></td>
                    <td> <%=v1.elementAt(4)%></td>
                    <td> <%=v1.elementAt(5)%></td>
                    <td> <%=v1.elementAt(6)%></td>
                    <td> <%=v1.elementAt(7)%></td>


                    <td><input type='button' name='btn' value='Edit' onclick='edit(<%=eid%>)'>
                        <input type='button' name='btn' value='Delete' onclick='del(<%=eid%>)'></td>
                </tr>
                <%  }
                %>





            </table>

        </form>
    </body>
    <jsp:include page="footer.html"/>
</html>
