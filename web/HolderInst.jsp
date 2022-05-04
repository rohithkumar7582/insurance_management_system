<%--
    Document   : Catgeory1
    Created on : 26 Mar, 2011, 11:37:33 AM
    Author     : vedisoft
--%>
<%@page import="java.util.Vector,mypack.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean class="mypack.Holderinst" id="x"/>
<jsp:setProperty name="x" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Holders Installment Form</title>
        <Link rel="stylesheet" type="text/css" href="calender.css" />
        <Link rel="stylesheet" href="epoch_styles.css" type="text/css">
        <script type="text/javascript" src="Validation.js"></script>
        <script type="text/javascript" src="epoch_classes.js"></script>
        <script>
            function Add()
            {
                document.thisform.action="AddHolderInst.jsp";
                document.thisform.submit();
            }

            function edit1(eid)
            {

                document.thisform.HinstId.value=eid;
                document.thisform.action="EditHolderInst.jsp";
                document.thisform.submit();
                return false;
            }


            function delete1(eid,n)
            {
                var v=confirm("Do you really want to delete?");
                if(v)
                {

                    document.thisform.opn.value=n;
                    document.thisform.HinstId.value=eid;
                    //document.write( document.thisform.HinstId.value);
                    document.thisform.action="HolderInstDel.jsp";
                    document.thisform.submit();
                }
                return false;
            }
        </script>
    </head>
    <jsp:include page="header.html"/>
    <body>

        <form name="thisform" method="post">

            <input type="hidden" name="opn">
            <input type="hidden" name="HinstId">

            <table width="1000" border="1" width="800" align="center">
                <tr>
                    <th>Holder Id</th>

                    <th>Policy Inst ID</th>
                    <th>Total Amount</th>
                    <th>Due Date</th>
                    <th>Recieved</th>
                    <th>Rdate</th>
                    <th>Inst amt</th>
                    <th>Mode</th>
                    <th>ChequeNo</th>
                    <th>Bank</th>


                    <th colspan="4" align="left">&nbsp;&nbsp;Cdate</th><th><input type="button" value="add" onclick="Add()"/></th>

                </tr>



                <%


                            Vector v = Holderinst.getRecords();

                            for (int i = 0; i < v.size(); i++) {
                                Vector v1 = (Vector) v.elementAt(i);
                                int eid = (Integer) v1.elementAt(0);

                %>
                <tr>
                    <td><%=v1.elementAt(1)%></td>
                    <td> <%=v1.elementAt(2)%></td>
                    <td><%=v1.elementAt(3)%></td>
                    <td> <%=v1.elementAt(4)%></td>
                    <td> <%=v1.elementAt(5)%></td>
                    <td> <%=v1.elementAt(6)%></td>
                    <td> <%=v1.elementAt(7)%></td>
                    <td> <%=v1.elementAt(8)%></td>
                    <td> <%=v1.elementAt(9)%></td>
                    <td> <%=v1.elementAt(10)%></td>
                    <td> <%=v1.elementAt(11)%></td>


                    <%  }
                    %>





            </table>

        </form>
    </body>
    <jsp:include page="footer.html"/>
</html>
