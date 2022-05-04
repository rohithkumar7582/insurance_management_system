<%@page import="mypack.companies"%>
<%@page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="mypack.companies" id="x"/>
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
    <body>
 <jsp:include page="header.html"/>
        <form name="frm" action="AddCompany.jsp">


            <table width="1000" border="2" align="center">
            <tr>
                <td> Company Name</td>
                <td> <input type="text" name="Compname"></td>

            </tr>
            <tr>
                <td> Address</td>
                <td> <input type="text" name="Address"></td>
            </tr>
            <tr>
                <td> City</td>
                <td> <input type="text" name="City"></td>
            </tr>
            <tr>
                <td> Email</td>
                <td> <input type="text" name="Email"></td>
            </tr>
            <tr>
                <td> Web</td>
                <td> <input type="text" name="web"></td>
            </tr>
            <tr>
                <td> Phone</td>
                <td> <input type="text" name="Phone"> </td>
            </tr>
            <tr>

                <td> <input type="submit" name="btn" value=Add onclick="return validation()"></td>
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
                        if (b.equals("Add")) {

                            x.setCompname(cn);
                            x.setAddress(addr);
                            x.setCity(ci);
                            x.setEmail(em);
                            x.setWeb(web);
                            x.setPhone(ph);
                            boolean b1 = x.add();
                            if (b1) {
                             response.sendRedirect("CompanyForm.jsp");
                            }
                        }
                    }
        %>



    </body>
       <jsp:include page="footer.html"/>
</html>
