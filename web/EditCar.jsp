<%--
    Document   : EditCompany
    Created on : 15 Mar, 2011, 12:12:34 PM
    Author     : vedisoft
--%>
<%@page import="mypack.cars"%>
<%@page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="mypack.cars" id="y"/>
<jsp:setProperty name="y" property="*"/>
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
if(!validString(document.frm.Compname,3,"Please Enter valid Name"))
return false;
if(!validString(document.frm.Address,3,"Invalid Address"))
return false;

if(!validString(document.frm.City,3,"Invalid City"))
return false;
if(!validString(document.frm.web,3,"Invalid Web"))

return false;
if(!validEmail(document.frm.Email,3,"Invalid Email"))
return false;

if(!validNum(document.frm.Phone,10,"Invalid Phone Number & it should be 10 digit number"))
return false;
return true;
}
</script>
    <jsp:include page="header.html"/>
    <body>

         <%

                    int id = Integer.parseInt(request.getParameter("compid"));
                    cars x = cars.getRecord(id);
        %>


        <form name="frm" action="EditCompany.jsp">
            <input type="hidden" name="compid" value="<%= y.getCompid() %>">
            <br> <br> <br> <br> <br> <br> <br>
            <table  align="center" width="1000" border="2" border-color:red>
            <tr>
                <td> Vehicle No</td>
                <td> <input type="text" name="Address" value=<%=x.getAddress()%> </td>
            </tr>
            <tr>
                <td> Make</td>
                <td> <input type="text" name="Address" value=<%=x.getAddress()%> </td>
            </tr>
            <tr>
                <td> Model</td>
                <td> <input type="text" name="City" value=<%=x.getCity()%> </td>
            </tr>
            <tr>
                <td> Owner</td>
                <td> <input type="text" name="Email" value=<%=x.getEmail()%> </td>
            </tr>
            <tr>
                <td> Year</td>
                <td> <input type="text" name="Phone" value=<%=x.getPhone()%> </td>
            </tr>
            <tr>

                <td> <input type="submit" name="btn" value=update onclick="return validation()"></td>
            </tr>
        </table>

    </form>
               <%
                    String b = request.getParameter("btn");
                    String cn = request.getParameter("Compname");
                    String addr = request.getParameter("Address");
                    String ci = request.getParameter("City");
                    String em = request.getParameter("Email");
                    String web = request.getParameter("web");
                    String ph = request.getParameter("Phone");
                    if (b != null) {
                        if (b.equals("update")) {
                            x.setCompid(id);
                            x.setCompname(cn);
                            x.setAddress(addr);
                            x.setCity(ci);
                            x.setEmail(em);
                            x.setPhone(ph);
                            boolean b1 = x.update();
                            if (b1) {
                            response.sendRedirect("CarForm.jsp");
                            }
                        }
                    }
        %>
    </body>
    <jsp:include page="footer.html"/>
</html>
