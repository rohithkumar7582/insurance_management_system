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
<jsp:useBean class="mypack.Holderinst" id="x"/>
<jsp:setProperty name="x" property="*"/>





<html>
    <head>
        <Link rel="stylesheet" href="emp.css" type="text/css">
        <Link rel="stylesheet" type="text/css" href="calender.css" />
        <Link rel="stylesheet" href="epoch_styles.css" type="text/css">
        <script type="text/javascript" src="Validation.js"></script>
        <script type="text/javascript" src="epoch_classes.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Holders Installment</title>

        <script language="JavaScript">

            var dp_cal1,dp_cal12,dp_cal3;
            window.onload = function () {
                dp_cal1  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
                dp_cal12  = new Epoch('epoch_popup','popup',document.getElementById('popup_contain'));
                dp_cal13  = new Epoch('epoch_popup','popup',document.getElementById('popup_cont'));


            };
        </script>

    </head>


    <body>
        <jsp:include page="header.html"/>
        <form name="frm"  method="post" action="HolderInstControl.jsp">
            <input type="hidden" name="opn"  value="1"  size="20">
           
            <table  width="1000" border="2" align="center">
                <tr>
                    <td> Holder ID</td>
                    <td> <select name="holderId">
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
                    <td> <input type="text" name="amt"></td>
                </tr>
                <tr><th align="left">Due date<font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="duedt"  id="popup_container"  size="20" ></td></tr>
                <tr>
                    <td>Recieved</td>
                    <td> <input type="text" name="received"></td>
                </tr>
                <tr><th align="left">recieved Date <font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="rdt"  id="popup_contain"  size="20" ></td></tr>
                <tr>
                    <td>Amount</td>
                    <td> <input type="text" name="amount"></td>
                </tr>
                <tr>
                    <td>Mode</td>
                    <td> <input type="text" name="Mode"></td>
                </tr>
                <tr>
                    <td>ChequeNo</td>
                    <td> <input type="text" name="Chno"></td>
                </tr>
                <tr>
                    <td>Bank</td>
                    <td> <input type="text" name="Bank"></td>
                </tr>
                <tr><th align="left">C Date <font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="cdt"  id="popup_cont"  size="20" ></td></tr>
                <tr>

                    <td> <input type="submit" name="btn" value=Add></td>
                </tr>

            </table>

        </form>





    </body>
    <jsp:include page="footer.html"/>
</html>


