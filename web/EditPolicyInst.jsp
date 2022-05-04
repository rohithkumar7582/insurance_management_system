<%--
    Document   : EditCompany
    Created on : 15 Mar, 2011, 12:12:34 PM
    Author     : vedisoft
--%>
<%@page import="mypack.policyinst"%>
<%@page import="java.util.Vector" %>
<%@page import="mypack.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Policy Inst</title>
        <script type="text/javascript" src="Validation.js">
        </script>
    </head>
    <script>
        function validation()
        {
            if(!validNum(document.frm.optinno,3,"Please Enter valid inst no"))
                return false;
            if(!validNum(document.frm.option,3,"Invalid amount"))
                return false;
            if(!validString(document.frm.Amt,3,"Invalid inst type"))
                return false;

            return true;
        }
    </script>
    <jsp:include page="header.html"/>
    <body>

        <%

                    int id = Integer.parseInt(request.getParameter("Pinstid"));
                    //out.print(id);
                    policyinst x = policyinst.getRecord(id);

        %>


        <form name="frm">
            <input type="hidden" name="Pinstid" value="<%=x.getPinstid()%>">

            <table  align="center" width="1000" border="2" border-color:red>
                <tr>
                    <td> Policy Detail option</td>
                    <td> <select name="PDid">
                            <%=policydetails.getPolicyDetails()%>
                        </select></td>


                </tr>
                <tr>
                    <td>Inst no</td>
                    <td> <input type="text" name=Instno" value="<%= x.getInstno()%>"</td>

                </tr>
                <tr>
                    <td> Amount</td>
                    <td> <input type="text" name="amt" value="<%= x.getAmt()%>"></td>
                </tr>
                <tr>
                    <td>Inst type</td>
                    <td><input type="text" name="Insttype" value="<%= x.getInsttype()%>"</td>
                </tr>
                <tr>
                    <td> <input type="submit" name="btn" value=update onclick="return validation()"></td>
                </tr>
            </table>
        </form>


        <%
                    String b = request.getParameter("btn");
                    if (b != null) {
                        int Pinstid = Integer.parseInt(request.getParameter("Pinstid"));
                        String pid = request.getParameter("PDid");
                        int pd = Integer.parseInt(pid);
                        String instno = request.getParameter("Instno");
                        int insno = Integer.parseInt(instno);
                        String amt1 = request.getParameter("amt");
                        int amt2 = Integer.parseInt(amt1);
                        String intype = request.getParameter("Insttype");


                        x.setPinstid(Pinstid);
                        x.setPDid(pd);

                        x.setInstno(insno);
                        x.setAmt(amt2);
                        x.setInsttype(intype);
                        boolean b1 = x.update();
                        if (b1) {
                            response.sendRedirect("PolicyInst.jsp");
                        }

                    }
        %>
    </body>
    <jsp:include page="footer.html"/>
</html>
