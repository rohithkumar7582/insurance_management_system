<%--
    Document   : EditCompany
    Created on : 15 Mar, 2011, 12:12:34 PM
    Author     : vedisoft
--%>
<%@page import="mypack.categories"%>
<%@page import="java.util.Vector" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <script type="text/javascript" src="Validation.js">
       </script>
    </head>
            <script>
      function validation()
{
if(!validString(document.frm.cname,3,"Please Enter valid category Name"))
return false;
if(!validString(document.frm.cdetails,3,"Invalid details"))
return false;

return true;
}
</script>
    <jsp:include page="header.html"/>
    <body>

         <%

                    int id = Integer.parseInt(request.getParameter("cid"));
                    categories x = categories.getRecord(id);
        %>


        <form name="frm" action="EditCategory.jsp">
            <input type="hidden" name="cid" value="<%=x.getCid()%>">
        
            <table align="center" width="1000" border="2" border-color:red>
            <tr>
                <td> Category Name</td>
                <td> <input type="text" name="cname" value="<%=x.getCname()%>"</td>

            </tr>
            <tr>
                <td> Category Details</td>
                <td> <input type="text" name="cdetails" value="<%=x.getCdetails()%>" </td>
            </tr>
            <tr>
                <td> <input type="submit" name="btn" value=update onclick="return validation()"></td>
            </tr>
        </table>
        </form>


               <%
                    String b = request.getParameter("btn");
                    String cn = request.getParameter("cname");
                    String cd = request.getParameter("cdetails");

                    if (b != null) {
                        if (b.equals("update")) {
                            x.setCid(id);
                            x.setCname(cn);
                            x.setCdetails(cd);
                            boolean b1 = x.update();
                            if (b1) {
                            response.sendRedirect("Catgeory1.jsp");
                            }
                        }
                    }
        %>
    </body>
    <jsp:include page="footer.html"/>
</html>
