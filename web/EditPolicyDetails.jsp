<%--
    Document   : EditCompany
    Created on : 15 Mar, 2011, 12:12:34 PM
    Author     : vedisoft
--%>
<%@page import="mypack.policydetails"%>
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
            if(!validString(document.frm.optinno,3,"Please Enter valid Optinno"))
                return false;
            if(!validString(document.frm.option,3,"Invalid option"))
                return false;
            if(!validNum(document.frm.Amt,3,"Invalid Amount"))
                return false;

            return true;
        }
    </script>
    <jsp:include page="header.html"/>
    <body>

        <%

                    int id = Integer.parseInt(request.getParameter("PDid"));
                    policydetails x = policydetails.getRecord(id);
        %>


        <form name="frm">
            <input type="hidden" name="PDid" value="<%=x.getPDid()%>">

            <table  align="center" width="1000" border="2" border-color:red>
                          <tr>
                    <td> Policy Name</td>
                    <td> <select name="Pid">
                            <%=policies.getPolicy()%>
                        </select></td>


                </tr>
                <tr>
                    <td>Option no</td>
                    <td> <input type="text" name="optionno" value="<%=x.getOptionno()%>"</td>

                </tr>
                <tr>
                    <td> option</td>
                    <td> <input type="text" name="option" value="<%=x.getOption()%>"></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text" name="Amt" value="<%=x.getAmt()%>"</td>
                </tr>
                <tr>
                    <td> <input type="submit" name="btn" value="update" onclick="return validation()"></td>
                </tr>
            </table>
        </form>


        <%
                    String b = request.getParameter("btn");
                    if(b!=null){
                    String pid = request.getParameter("Pid");
                    int pd = Integer.parseInt(pid);
                    String opnno = request.getParameter("optionno");
                    String opn = request.getParameter("option");
                    String amt2 = request.getParameter("Amt");
                    int amt = Integer.parseInt(amt2);
                    if (b != null) {
                        if (b.equals("update")) {
                            x.setPid(pd);

                            x.setOptionno(opnno);
                            x.setOption(opn);
                            x.setAmt(amt);
                            boolean b1 = x.update();
                            if (b1) {
                                response.sendRedirect("PolicyDetails.jsp");
                            }
                        }
                    }}
        %>
    </body>
    <jsp:include page="footer.html"/>
</html>
