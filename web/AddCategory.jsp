<%-- 
    Document   : AddCategory
    Created on : 17 Mar, 2011, 12:09:48 PM
    Author     : vedisoft
--%>
<%@page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="mypack.categories" id="x"/>
<jsp:setProperty name="x" property="*"/>

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
if(!validString(document.frm.cname,3,"Please Enter cate valid Name"))
return false;
if(!validString(document.frm.cdetails,3,"Invalid details"))
return false;

return true;
}
</script>
 
        <body>
       <jsp:include page="header.html"/>
        <form name="frm" action="AddCategory.jsp">


            <table width="1000" border="2" align="center">
            <tr>
                <td> Category Name</td>
                <td> <input type="text" name="cname"></td>

            </tr>
            <tr>
                <td> Category Details</td>
                <td> <input type="text" name="cdetails"></td>
            </tr>

            <tr>

            <td> <input type="submit" name="btn" value=Add onclick="return validation()"></td>
            </tr>
        </table>

    </form>
              <%
                    String b = request.getParameter("btn");
                    String cn = request.getParameter("cname");
                    String cd = request.getParameter("cdetails");

                    if (b != null) {
                        if (b.equals("Add")) {

                            x.setCname(cn);
                            x.setCdetails(cd);

                            boolean b1 = x.add();
                            if (b1) {
                             response.sendRedirect("Catgeory1.jsp");
                            }
                        }
                    }
        %>



    </body>
       <jsp:include page="footer.html"/>
</html>

   