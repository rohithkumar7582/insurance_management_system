<%-- 
    Document   : PolicyForm
    Created on : 25 Mar, 2011, 11:26:02 AM
    Author     : vedisoft
--%>

<%@page import="mypack.*"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="mypack.policies" id="x"/>
<jsp:setProperty name="x" property="*"/>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <script type="text/javascript" src="Validation.js">
           </script>
    </head>

<%
HttpSession ss=request.getSession();
response.setHeader("Cache-control", "no-cache");
String un=(String)ss.getAttribute("uname");
String pw=(String)ss.getAttribute("pass");
 if (un==null)
{
     response.sendRedirect("Login.jsp");
 }
response.setContentType("text/html");
//PrintWriter out=response.getWriter();
//RequestDispatcher r=request.getRequestDispatcher("Login.jsp");
//r.include(request, response);
%>


    <title>policy form</title>
            <script>
        function validation()
  {
    if(!validString(document.frm.pname,3,"Please Enter valid policy name"))
    return false;
    if(!validString(document.frm.pdesc,3,"Invalid description"))
    return false;
    return true;
}
</script>
    <body>
         <jsp:include page="header.html"/>
           <form name="frm" method="post" >


            <table  width="1000" border="2" align="center">


                <tr>
                    <td>
                        Company Name
                    </td>
                    <td>
                        <select name="compid">
                        <%=companies.getCompany()%>
                        </select>
                    </td>
                </tr>
                   <tr>
                    <td>
                        Category Name
                    </td>
                    <td>
                        <select name="cid">
                        <%=categories.getCategory()%>
                        </select>
                    </td>
                </tr>
                         <tr>
                <td> Policy Name</td>
                <td> <input type="text" name="pname"></td>

            </tr>
            <tr>
                <td>Policy desc</td>
                <td> <input type="text" name="pdesc"></td>
            </tr>
              <tr>

                <td> <input type="submit" name="btn" value=Add onclick="return validation()"></td>
            </tr>
            </table>
        </form>
        <%
                    String b = request.getParameter("btn");
                    String cn = request.getParameter("pname");
                    String addr = request.getParameter("pdesc");
                         if (b != null) {
                        if (b.equals("Add")) {

                          //  x.setPname(cn);
                       //    x.setPdesc(addr);
                         
   
                            boolean b1 = x.add();
                            if (b1) {
                              out.print("<h1 align='center'>record inserted successfully</h1>");
                            }
                        }
                    }
                  
   %>

    </body>
      <jsp:include page="footer.html"/>
</html>
