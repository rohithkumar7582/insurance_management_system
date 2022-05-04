<%--
    Document   : Catgeory1
    Created on : 26 Mar, 2011, 11:37:33 AM
    Author     : vedisoft
--%>
<%@page import="java.util.Vector,mypack.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean class="mypack.policies" id="x"/>
<jsp:setProperty name="x" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>




    <jsp:include page="header.html"/>
    <body>

        <form name="thisform">





            <table border="1" width="1000" align="center">




                    <th>Policy Name</th>
                      <th>Holder Name</th>
                                          <th>Installment</th>

                    <th>Policy Amount</th>
                                        <th>Due Amount</th>





                <%

                            Vector v = policydetails.getReport3();

                            for (int i = 0; i < v.size(); i++) {
                                Vector v1 = (Vector) v.elementAt(i);



                %>
                <tr>
                    <td><%=v1.elementAt(0)%></td>
                    <td> <%=v1.elementAt(1)%></td>
                    <td><%=v1.elementAt(2)%></td>
                     <td><%=v1.elementAt(3)%></td>
                      <td><%=v1.elementAt(4)%></td>


                    <%  }
                    %>



            </table>

        </form>



    </body>
    <jsp:include page="footer.html"/>
</html>
