<%--
    Document   : AddCategory
    Created on : 17 Mar, 2011, 12:09:48 PM
    Author     : vedisoft
--%>
<%@page import="java.util.Vector" %>
<%@page import="mypack.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="mypack.holders" id="x"/>
<jsp:setProperty name="x" property="*"/>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Holders</title>
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
if(!validString(document.frm.Hstate,3,"Invalid Web"))

return false;
if(!validEmail(document.frm.Hemail,3,"Invalid Email"))
return false;

if(!validNum(document.frm.Hmobile,10,"Invalid Phone Number & it should be 10 digit number"))
return false;
return true;
}
</script>


    <body>
        <jsp:include page="header.html"/>
        <form name="frm">

            <table  width="1000" border="2" align="center">
                <tr>
                    <td> Holders Name</td>
                    <td> <input type="text" name="Hname"></td>


                </tr>
                <tr>
                    <td> Holder Address</td>
                    <td> <input type="text" name="Hadd"></td>
                </tr>
                <tr>
                    <td> Holder City </td>
                    <td> <input type="text" name="Hcity"></td>
                </tr>
                <tr>
                    <td>Holder State</td>
                    <td> <input type="text" name="Hstate"></td>
                </tr>
                <tr>
                    <td>Holder Email</td>
                    <td> <input type="text" name="Hemail"></td>
                </tr>
                <tr>
                    <td>Holder Mobile</td>
                    <td> <input type="text" name="Hmobile"></td>
                </tr>
                <tr>
                    <td>Policy Details Id</td>
                    <td> <select name="PDid">
                            <%=policydetails.getPolicyDetails()%>
                        </select></td>
                </tr>

                <tr>

                    <td> <input type="submit" name="btn" value=Add onclick="return validation()"></td>
                </tr>

            </table>

        </form>

        <%

                    String b = request.getParameter("btn");
                    if (b != null) {
                        if (b.equals("Add")) {
                            int hd = 0;
                            
                       
                            String hnm = request.getParameter("Hname");
                            String haddr = request.getParameter("Hadd");
                            String hcity = request.getParameter("Hcity");
                            String hst = request.getParameter("Hstate");
                            String hem = request.getParameter("Hemail");
                            String hmob = request.getParameter("Hmobile");
                                 String pdid = request.getParameter("PDid");
                            hd = Integer.parseInt(pdid);
                            x.setPDid(hd);
                            x.setHname(hnm);
                            x.setHadd(haddr);
                            x.setHcity(hcity);
                            x.setHstate(hst);
                            x.setHemail(hem);
                            x.setHmobile(hmob);



                            
                           
                            boolean b1 = x.add();
                            if (b1) {
                                response.sendRedirect("HoldersForm.jsp");
                            }

                        }
                    }

        %>



    </body>
    <jsp:include page="footer.html"/>
</html>

