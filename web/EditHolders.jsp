<%--
    Document   : EditCompany
    Created on : 15 Mar, 2011, 12:12:34 PM
    Author     : vedisoft
--%>
<%@page import="mypack.holders"%>
<%@page import="java.util.Vector" %>
<%@page import="mypack.*"%>
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
if(!validString(document.frm.Hname,3,"Enter valid Holder Name"))
return false;
if(!validString(document.frm.Hadd,3,"Invalid Address"))
return false;

if(!validString(document.frm.Hcity,3,"Invalid City"))
return false;
if(!validString(document.frm.Hstate,3,"Invalid State"))

return false;
if(!validEmail(document.frm.Hemail,3,"Invalid Email"))
return false;

if(!validNum(document.frm.Hmobile,10,"Invalid Phone Number & it should be 10 digit number"))
return false;
return true;
}
</script>
    <jsp:include page="header.html"/>
    <body>

        <%

                    int id = Integer.parseInt(request.getParameter("HolderId"));
                    holders x = holders.getRecord(id);
        %>


        <form name="frm">
            <input type="hidden" name="HolderId" value="<%=x.getHolderId()%>">

            <table align="center" width="1000" border="2" border-color:red>
                          <tr>
                    <td> Holder Name</td>
                     <td> <input type="text" name="Hname" value="<%=x.getHname()%>"</td>


                </tr>
                <tr>
                    <td>Holder Address</td>
                    <td> <input type="text" name="Hadd" value="<%=x.getHadd()%>"</td>

                </tr>
                <tr>
                    <td> Holder City</td>
                    <td> <input type="text" name="Hcity" value="<%=x.getHcity()%>"></td>
                </tr>
                <tr>
                    <td>Holder State</td>
                    <td><input type="text" name="Hstate" value="<%=x.getHstate()%>"</td>
                </tr>
                     <tr>
                    <td>Holder Email</td>
                    <td><input type="text" name="Hemail" value="<%=x.getHemail()%>"</td>
                </tr>
                     <tr>
                    <td>Holder Mobile</td>
                    <td><input type="text" name="Hmobile" value="<%=x.getHmobile()%>"</td>
                </tr>
                <tr>
                     <td>Policy Details ID</td>
                    <td> <select name="PDid">
                            <%=policydetails.getPolicyDetails()%>
                        </select></td>
                </tr>
                <tr>
                    <td> <input type="submit" name="btn" value="update" onclick="return validation()"></td>
                </tr>

            </table>
        </form>


        <%
                    String b = request.getParameter("btn");
                    if(b!=null){
                    String pid = request.getParameter("PDid");
                    int pd = Integer.parseInt(pid);
                    String hname = request.getParameter("Hname");
                    String haddr = request.getParameter("Hadd");
                    String hcity = request.getParameter("Hcity");
                     String hst = request.getParameter("Hstate");
                     String he= request.getParameter("Hemail");
                     String hmob=request.getParameter("Hmobile");
                    if (b != null) {
                        if (b.equals("update")) {
                            x.setPDid(pd);

                            x.setHname(hname);
                            x.setHadd(haddr);
                            x.setHcity(hcity);
                            x.setHemail(he);
                            x.setHmobile(hmob);
                            x.setHstate(hst);
                            boolean b1 = x.update();
                            if (b1) {
                                response.sendRedirect("HoldersForm.jsp");
                            }
                        }
                    }}
        %>
    </body>
    <jsp:include page="footer.html"/>
</html>
