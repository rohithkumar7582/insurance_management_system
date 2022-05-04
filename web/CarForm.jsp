<%@page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="mypack.cars" id="x"/>
<jsp:setProperty name="x" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Form</title>
        <script type="text/javascript">
            function sd(id){
                // alert(id);
                document.car.vehno.value=id;
                document.car.action="EditCar.jsp";
                document.car.submit();
            }

            function xyz(id){
                document.car.vehno.value=id;
                b=confirm("Are you sure to delete");
                if(b){
                    document.car.submit();
                }
            }

            function opt(){
                //alert('hi');
                document.car.action="AddCar.jsp";
                document.car.submit();
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
        <form name="car" >



            <input type="hidden" name="vehno">
            <h2 align="center">CAR FORM</h2>



            <table border="1" width="1000" align="center">
                <tr>
                    <th>VehNo</th>
                    <th>Make</th>
                    <th>Model</th>
                    <th>Owner</th>
                    <th>Year</th>
                    <th>Companyid</th>
                    <th>Policyid</th>
                    <th>Holderid</th>
                    <th><input type="button" name="add" value="Add" onclick='opt()'></th>
                </tr>

                <%
                            if (request.getParameter("vehno") != null) {

                                String b = request.getParameter("vehno");
                                //out.print(b);
                                x.setvehno(b);
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
                                out.println("<td>" + v1.elementAt(0) + "</td>");
                                out.println("<td>" + v1.elementAt(1) + "</td>");
                                out.println("<td>" + v1.elementAt(2) + "</td>");
                                out.println("<td>" + v1.elementAt(3) + "</td>");
                                out.println("<td>" + v1.elementAt(4) + "</td>");
                                out.println("<td>" + v1.elementAt(5) + "</td>");
                                out.println("<td>" + v1.elementAt(6) + "</td>");
                                out.println("<td>" + v1.elementAt(7) + "</td>");
                                out.println("<td><input type='button' name='btn'  id='show' value='Edit' onClick='return sd(" + v1.elementAt(0) + ")'> <input type='button' name='btn' value='Delete' onClick='xyz(" + v1.elementAt(0) + ")'></td>");
                                out.println("</tr>");
                            }




                %>
            </table>

        </form>
    </body>
    <jsp:include page="footer.html"/>

</html>
