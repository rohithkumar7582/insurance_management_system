
<%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Pragma", "no-cache");
%>
<%@ page import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head><title>Holder Installment Form</title>

    </head>
    <body>

        <table width=100%>


            <tr><td><!-- Page Coding to be done here -->



                    <jsp:useBean id="x" class="mypack.Holderinst"/>
                        <jsp:setProperty name="x" property="*" />
                        <BR>


                        <%int opn1 = Integer.parseInt(request.getParameter("opn"));%>


                        <% if (opn1 == 1) {%>

                        <%

                             boolean b = x.add();

                             if (b) {
                                 response.sendRedirect("HolderInstForm.jsp");
                             } else {
                        %>
                        <h2 align="Center"> Record Insertion Failure</h2>
                        <%                }
                                    }
                        %>




                        <% if (opn1 == 2) {%>

                        <%
                             boolean b = x.update();
                             if (b) {
                                 response.sendRedirect("HolderInstForm.jsp");
                             } else {
                        %>
                        <h2 align="Center"> Record Updation Failure</h2>
                        <%                }
                                    }
                        %>




                        <% if (opn1 == 3) {%>

                        <%
                             boolean b = x.delete();
                             if (b) {
                                 response.sendRedirect("HolderInstForm.jsp");
                             } else {
                        %>
                        <h2 align="Center"> Record Deletion Failure</h2>
                        <%                }
                                    }
                        %>








                    </td></tr>

        </body>
    </html>
