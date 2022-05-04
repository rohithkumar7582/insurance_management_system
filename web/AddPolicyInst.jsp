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
<jsp:useBean class="mypack.policyinst" id="x"/>
<jsp:setProperty name="x" property="*"/>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add policy inst</title>
            <script type="text/javascript" src="Validation.js">
       </script>
    </head>
    <script>
    function validation()
{
if(!validInt(document.frm.Instno,3,"Please Enter valid Inst No"))
return false;
if(!validInt(document.frm.amt,3,"Invalid Amount"))
return false;

if(!validString(document.frm.Insttype,3,"Installment type"))
return false;
return true;
}
    </script>


    <body>
        <jsp:include page="header.html"/>
        <form name="frm">

            <table width="1000" border="2" align="center">
                <tr>
                    <td> Policy Detail Option</td>
                    <td> <select name="PDid">
                            <%=policydetails.getPolicyDetails()%>
                        </select></td>


                </tr>
                <tr>
                    <td> Inst No</td>
                    <td> <input type="text" name="Instno"></td>
                </tr>
                <tr>
                    <td> Amount </td>
                    <td> <input type="text" name="amt"></td>
                </tr>
                <tr>
                    <td>Inst Type</td>
                    <td> <input type="text" name="Insttype"></td>
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
                            int pd = 0;
                          
                            String pid = request.getParameter("PDid");
                            pd = Integer.parseInt(pid);
                            String instno = request.getParameter("Instno");
                            int inno = Integer.parseInt(instno);
                            String op = request.getParameter("amt");
                            int op1 = Integer.parseInt(op);
                            String insttype = request.getParameter("Insttype");

                            x.setPDid(pd);
                            x.setInstno(inno);
                            x.setAmt(op1);
                            x.setInsttype(insttype);
                            boolean b1 = x.add();
                            if (b1) {
                                response.sendRedirect("PolicyInst.jsp");
                            }

                        }
                    }

        %>



    </body>
    <jsp:include page="footer.html"/>
</html>

