<%--
    Document   : EditCompany
    Created on : 15 Mar, 2011, 12:12:34 PM
    Author     : vedisoft
--%>
<%@page import="mypack.policies"%>
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
            if(!validString(document.frm.optinno,3,"Please Enter valid policy name"))
                return false;
            if(!validString(document.frm.option,3,"Invalid description"))
                return false;
            
            return true;
        }
    </script>
    <jsp:include page="header.html"/>
    <body>

        <%

                    int id = Integer.parseInt(request.getParameter("Pid"));
                    policies x = policies.getRecord(id);
        %>


        <form name="frm"  action="EditPolicyForm.jsp">
            <input type="hidden" name="Pid" value="<%=x.getPid()%>">

            <table style="margin-left: 60px" align="center" width="1000" border="2" border-color:red>
                          <tr>
                    <td> Company Name</td>
                    <td> <select name="Compid">
                            <%=companies.getCompany()%>
                        </select></td>


                </tr>
                   <tr>
                    <td>category Name</td>
                    <td> <select name="cid">
                            <%=categories.getCategory()%>
                        </select></td>


                </tr>
                <tr>
                    <td>Policy name</td>
                    <td> <input type="text" name="Pname" value="<%=x.getPname()%>"</td>

                </tr>
                <tr>
                    <td>Policy desc</td>
                    <td> <input type="text" name="Pdesc" value="<%=x.getPdesc()%>"></td>
                </tr>
             
                <tr>
                    <td> <input type="submit" name="btn" value="update" onclick="return validation()"></td>
                </tr>
            </table>
        </form>


        <%
                    String b = request.getParameter("btn");
                    if(b!=null){
                    String cpid = request.getParameter("Compid");
                    int pd = Integer.parseInt(cpid);
                    String cid1 = request.getParameter("cid");
                      int cid2 = Integer.parseInt(cid1);
                    String pn = request.getParameter("Pname");
                    String pd1 = request.getParameter("Pdesc");
                  
                    if (b != null) {
                        if (b.equals("update")) {
                            x.setCompid(pd);
                            x.setCid(cid2);
                            x.setPname(pn);
                            x.setPdesc(pd1);
                            boolean b1 = x.update();
                            if (b1) {%>
                            <h2>record updated successfully</h2>
                             <%
                            }
                        }
                    }}
        %>
    </body>
    <jsp:include page="footer.html"/>
</html>
