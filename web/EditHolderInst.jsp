<%--
    Document   : EditCompany
    Created on : 15 Mar, 2011, 12:12:34 PM
    Author     : vedisoft
--%>
<%@page import="mypack.Holderinst"%>
<%@page import="java.util.Vector" %>
<%@page import="mypack.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <Link rel="stylesheet" href="emp.css" type="text/css">
        <Link rel="stylesheet" type="text/css" href="calender.css" />
        <Link rel="stylesheet" href="epoch_styles.css" type="text/css">
        <script type="text/javascript" src="epoch_classes.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>holder inst</title>
        <script language="JavaScript">

            var dp_cal1,dp_cal12,dp_cal3;
            window.onload = function () {
                dp_cal1  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
                dp_cal12  = new Epoch('epoch_popup','popup',document.getElementById('popup_contain'));
                dp_cal13  = new Epoch('epoch_popup','popup',document.getElementById('popup_cont'));


            };
        </script>
        <script type="text/javascript" src="Validation.js">
        </script>
    </head>
    <script>
        function validation()
        {
            alert('hi');
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

                    int id = Integer.parseInt(request.getParameter("HinstId"));
                    Holderinst x = Holderinst.getRecord(id);
        %>


        <form name="frm">
            <input type="hidden" name="HinstId" value="<%=x.getHinstId()%>">

            <table style="margin-left: 60px" align="center" width="1000" border="2" border-color:red>
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
                    <td>total amount</td>
                    <td> <input type="text" name="Amt" value="<%=x.getAmt()%>"</td>
                </tr>

                <tr><th align="left">Due date<font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="Duedt"  id="popup_container"  size="20" value="<%=x.getDuedt()%>"></td></tr>

                <tr>
                    <td>Recieved</td>
                    <td> <input type="text" name="Received" value="<%=x.getReceived()%>"</td>

                </tr>
                <tr><th align="left">recieved Date <font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="Rdt"  id="popup_contain"  size="20" value="<%=x.getRdt()%>" ></td></tr>
                <tr>
                    <td>amount</td>
                    <td> <input type="text" name="Amount" value="<%=x.getAmount()%>"></td>
                </tr>
                <tr>
                    <td>Mode</td>
                    <td><input type="text" name="Mode" value="<%=x.getMode()%>"</td>
                </tr>
                <tr>
                    <td>Ch no</td>
                    <td><input type="text" name="Chno" value="<%=x.getChno()%>"</td>
                </tr>
                <tr>
                    <td>bank</td>
                    <td><input type="text" name="Bank" value="<%=x.getBank()%>"</td>
                </tr>

                <tr><th align="left">C Date <font color="red" size="2px">(dd-mm-yyyy)</font></th>
                    <td> <input type="text"  name="Cdt"  id="popup_cont"  size="20" value="<%= x.getCdt()%>"></td></tr>

                <tr>
                    <td> <input type="submit" name="btn" value="update" onclick="return validation()"></td>
                </tr>

            </table>
        </form>



        <%

                    String b = request.getParameter("btn");
                    if (b != null) {
                        if (b.equals("update")) {


                            String hi = request.getParameter("HinstId");
                            int h = Integer.parseInt(hi);

                            String hid = request.getParameter("HolderId");
                            int hd = Integer.parseInt(hid);
                            String pinstid = request.getParameter("Pinstid");
                            int pinsid = Integer.parseInt(pinstid);

                            String amt2 = request.getParameter("Amt");
                            int am = Integer.parseInt(amt2);
                            String dd = request.getParameter("Duedt");
                            String rcd = request.getParameter("Received");
                            String rd = request.getParameter("Rdt");
                            String amt1 = request.getParameter("Amount");
                            int am1 = Integer.parseInt(amt1);
                            String mode1 = request.getParameter("Mode");
                            String chno1 = request.getParameter("Chno");
                            String bank1 = request.getParameter("Bank");
                            String cdate1 = request.getParameter("Cdt");



                            x.setHinstId(h);
                            x.setHolderId(hd);
                            x.setPinstid(pinsid);
                            x.setAmt(am);
                            x.setDuedt(dd);
                            x.setReceived(rcd);
                            x.setRdt(rd);
                            x.setAmount(am1);
                            x.setMode(mode1);
                            x.setChno(chno1);
                            x.setBank(bank1);
                            x.setCdt(cdate1);
                            out.print(x.getHinstId());
                            boolean b1 = x.update();
                            if (b1) {
                                response.sendRedirect("HolderInstForm.jsp");
                            }


                        }
                    }

        %>
    </body>
    <jsp:include page="footer.html"/>
</html>
