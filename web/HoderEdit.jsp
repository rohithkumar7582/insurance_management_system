<%--
    Document   : Catgeory1
    Created on : 26 Mar, 2011, 11:37:33 AM
    Author     : vedisoft
--%>
<%@page import="java.util.Vector,mypack.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

 <jsp:useBean id="y" class="mypack.Holderinst"/>
<jsp:setProperty name="y" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Holders Installment Form</title>
        <Link rel="stylesheet" type="text/css" href="calender.css" />
<Link rel="stylesheet" href="epoch_styles.css" type="text/css">
<script type="text/javascript" src="Validation.js"></script>
<script type="text/javascript" src="epoch_classes.js"></script>
        
    </head>
    <jsp:include page="header.html"/>
    <body>
       
        <%
        int eid=Integer.parseInt(request.getParameter("HinstId"));
  
        y.getRecord(eid);
       %>
       <form name="frm" action="HolderInstControl.jsp" method="post">
          
            <input type="hidden" name="opn"  value="2"  size="20">
               <input type="hidden" name="HinstId" value="<%= y.getHinstId() %>" >
            <table style="margin-left: 60px"  width="500" border="2" align="center">
                <tr>
                    <td> Holder ID</td>
                    <td> <select name="HolderId">
                            <%=holders.getHolder()%>
                        </select></td></tr>

                <tr>
                    <td> Policy Inst ID</td>
                    <td> <select name="Pinstid">
                            <%=policyinst.getPolicyInst()%>
                        </select></td>
                </tr>
                <tr>
                    <td> Total Amount</td>
                    <td> <input type="text" name="Amt" value="<%= y.getAmt() %>"></td>
                </tr>
                <tr><th align="left">Due date<font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="Duedate"  id="popup_container"  size="20" value="<%= y.getDuedt() %>" ></td></tr>
                <tr>
                    <td>Recieved</td>
                    <td> <input type="text" name="Received" value="<%= y.getReceived() %>"></td>
                </tr>
                <tr><th align="left">recieved Date <font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="Rdate"  id="popup_contain"  size="20" value="<%= y.getRdate() %>"></td></tr>
                <tr>
                    <td>Amount</td>
                    <td> <input type="text" name="Amount" value="<%= y.getAmount() %>"></td>
                </tr>
                <tr>
                    <td>Mode</td>
                    <td> <input type="text" name="Mode" value="<%= y.getMode() %>"></td>
                </tr>
                <tr>
                    <td>ChequeNo</td>
                    <td> <input type="text" name="Chno" value="<%= y.getChno() %>"></td>
                </tr>
                <tr>
                    <td>Bank</td>
                    <td> <input type="text" name="Bank" value="<%= y.getBank() %>"></td>
                </tr>
                <tr><th align="left">C Date <font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="Cdate"  id="popup_cont"  size="20" value="<%= y.getCdate() %>"></td></tr>
                <tr>

                    <td> <input type="submit" name="btn" value=Update></td>
                </tr>

            </table>

        </form>



    </body>
    <jsp:include page="footer.html"/>
</html>
