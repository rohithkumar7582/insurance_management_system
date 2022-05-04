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
<jsp:useBean class="mypack.policydetails" id="x"/>
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
if(!validString(document.frm.optionno,3,"Please Enter valid option no"))
return false;
if(!validString(document.frm.option,3,"Invalid Option"))
return false;

if(!validNum(document.frm.Amt,3,"Invalid amount"))
return false;
return true;
}
</script>
    <body>
        <jsp:include page="header.html"/>
        <form name="frm">

            <table style="margin-left: 60px"  width="500" border="2" align="center">
                <tr>
                    <td> Policy Name</td>
                    <td> <select name="Pid">
                            <%=policies.getPolicy()%>
                        </select></td>


                </tr>
                <tr>
                    <td> Option No</td>
                    <td> <input type="text" name="optionno"></td>
                </tr>
                <tr>
                    <td> Option </td>
                    <td> <input type="text" name="option"></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td> <input type="text" name="Amt"></td>
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
                            int amt = 0;
                            String pid = request.getParameter("Pid");
                            pd = Integer.parseInt(pid);
                            String opno = request.getParameter("optionno");
                            String op = request.getParameter("option");
                            String amt2 = request.getParameter("Amt");
                            amt = Integer.parseInt(amt2);




                            x.setPid(pd);
                            x.setOptionno(opno);
                            x.setOption(op);
                            x.setAmt(amt);
                            boolean b1 = x.add();
                            if (b1) {
                                response.sendRedirect("PolicyDetails.jsp");
                            }

                        }
                    }

        %>



    </body>
    <jsp:include page="footer.html"/>
</html>

