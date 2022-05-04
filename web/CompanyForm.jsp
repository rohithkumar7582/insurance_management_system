<%@page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="mypack.companies" id="x"/>
<jsp:setProperty name="x" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Form</title>
        <script type="text/javascript">
            function sd(id){
                // alert(id);
                //document.company.compid.value=id;
                document.company.action="EditCompany.jsp";
                document.company.submit();
            }

            function xyz(id){
                document.company.compid.value=id;
                b=confirm("Are you sure to delete");
                if(b){
                    document.company.submit();
                }
            }

            function opt(){
                //alert('hi');
                document.company.action="AddCompany.jsp";
                document.company.submit();
            }
        </script>
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
    <br><br><br>
    <body BGCOLOR="#A8A8A8">
        <form name="company" >



            <input type="hidden" name="compid">
            <h2 align="center">COMPANY FORM</h2>



            <table border="1" width="1000" align="center">
                <tr>
                    <th>Company name</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th  align="left">&nbsp;&nbsp;&nbsp;Web</th><th> <input type="button" name="add" value="Add" onclick='opt()'></th>

                </tr>

                <%
                            if (request.getParameter("compid") != null) {

                                int b = Integer.parseInt(request.getParameter("compid"));
                                //out.print(b);
                                x.setCompid(b);
                                boolean b1 = x.delete();
                                if (b1) {
                                    //out.print("<table width='400' align='center'>");
                                    //out.print("<tr><th>record successfully deleted</th></tr></table>");
                                }
                            }
                %>




                <%

                            Vector v = x.getRecords();
                            //  out.print("<table width='900' align='center' border='1'>");
                            for (int i = 0; i < v.size(); i++) {
                                Vector v1 = (Vector) v.get(i);
                                out.println("<tr>");
                                out.println("<td>" + v1.elementAt(1) + "</td>");
                                out.println("<td>" + v1.elementAt(2) + "</td>");
                                out.println("<td>" + v1.elementAt(3) + "</td>");
                                out.println("<td>" + v1.elementAt(4) + "</td>");
                                out.println("<td>" + v1.elementAt(5) + "</td>");
                                out.println("<td>" + v1.elementAt(6) + "</td>");
                                out.println("<td><input type='button' name='btn'  id='show' value='Edit' onClick='return sd(" + v1.elementAt(0) + ")'> <input type='button' name='btn' value='Delete' onClick='xyz(" + v1.elementAt(0) + ")'></td>");

                                out.println("</tr>");
                            }




                %>
            </table>

        </form>
    </body>
    <jsp:include page="footer.html"/>

</html>
