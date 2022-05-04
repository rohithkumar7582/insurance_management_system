<%-- 
    Document   : ViewpolicyForm
    Created on : 25 Mar, 2011, 12:20:05 PM
    Author     : vedisoft
--%>

<%@page import="mypack.*"%>
<%@page import="java.util.Vector"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="mypack.policies" id="x"/>
<jsp:setProperty name="x" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function details(){
                // alert(id);
       
                document.viewpolicy.action="PolicyDetails.jsp";
                document.viewpolicy.submit();
            }
            function go(){
                //alert('go');
                document.viewpolicy.id.value="a";
                //document.viewpolicy.action="CatDetails.jsp";
                document.viewpolicy.submit();
            }

            function policyinst(){
                // alert(id);

                document.viewpolicy.action="PolicyInst.jsp";
                document.viewpolicy.submit();
            }

            function go1(){
                //alert('go');
                document.viewpolicy.id1.value="a";
                //document.viewpolicy.action="CatDetails.jsp";
                document.viewpolicy.submit();
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.html"/>
        <form name="viewpolicy">
            <input type="hidden" name="id">
            <table width="1000" border="2" align="center">

                <tr>
                    <td><input type="radio" name="c">
                        Company
                        <select name="compid" onchange="go();">
                            <option value="0">Select..</option>
                            <%=companies.getCompany()%>
                        </select>
                    </td>
                    <td  align="center">
                        <input type="radio" name="c">
                        Category
                        <select name="cid" onchange="go();">
                            <option value="0">Select..</option>
                            <%=categories.getCategory()%>
                        </select>
                    </td>
                </tr>
            </table>

            <table align="center" border="1" width="1000">
                <%

                            String str = request.getParameter("id");
                            if (str != null) {

                                String s = request.getParameter("c");
                                // out.print(s);
                                if (s != null) {
                                    int id = Integer.parseInt(request.getParameter("compid"));

                                    if (id != 0) {

                                        policies p = new policies();

                                        boolean b = p.getCompnyrecords(id);


                %>

                <tr><th>Policy Name</th><th>Policy description</th></tr>
                <tr><td><%= p.getPname()%></td><td><%= p.getPdesc()%></td></tr>



                <%

                                                }
                                            }
                %>
                <%

                                            String str1 = request.getParameter("id1");
                                            if (str1 != null) {
                                                int id1 = Integer.parseInt(request.getParameter("cid"));

                                                if (id1 != 0) {

                                                    policies p1 = new policies();

                                                    boolean b1 = p1.getCategoryrecords(id1);
                %>


                <tr><th>Policy Name</th><th>Policy description</th></tr>
                <tr><td><%= p1.getPname()%></td><td><%= p1.getPdesc()%></td></tr>
                <%

                                    }
                                }
                                // else
                                //response.sendRedirect("ViewpolicyForm.jsp");
                            }
                %>
            </table>







            <table align="center" border="1" width="1000">
                <%

                            String str2 = request.getParameter("id");
                            if (str2 != null) {

                               String s = request.getParameter("c");
                                // out.print(s);
                                if (s != null) {
                                    int id = Integer.parseInt(request.getParameter("cid"));

                                    if (id != 0) {

                                        policies p = new policies();

                                        boolean b = p.getCategoryrecords(id);


                %>

                <tr><th>Policy Name</th><th>Policy description</th></tr>
                <tr><td><%= p.getPname()%></td><td><%= p.getPdesc()%></td></tr>



                <%

                                                }
                                            }
                %>
                <%

                                            String str1 = request.getParameter("id1");
                                            if (str1 != null) {
                                                int id1 = Integer.parseInt(request.getParameter("cid"));

                                                if (id1 != 0) {

                                                    policies p1 = new policies();

                                                    boolean b1 = p1.getCategoryrecords(id1);
                %>


                <tr><th>Policy Name</th><th>Policy description</th></tr>
                <tr><td><%= p1.getPname()%></td><td><%= p1.getPdesc()%></td></tr>
                <%

                                    }
                                }
                                // else
                                //response.sendRedirect("ViewpolicyForm.jsp");
                            }
                %>
            </table>








            <table align="center"><tr>
                    <td>

                        <input type="button" name="Details" value="Details" onclick="details();">
                        <input type="button" name="Installment" value="Installment" onclick="policyinst();">
                    </td>
                </tr>

            </table>
        </form>
    </body>
    <jsp:include page="footer.html"/>
</html>
