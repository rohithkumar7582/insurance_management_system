<%@page import="mypack.cars"%>
<%@page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="mypack.cars" id="x"/>
<jsp:setProperty name="x" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <script type="text/javascript" src="Validation.js">
           </script>
    </head>
        <script>
            /*
        function validation()

{
if(!validString(document.frm.vehno,10,"Please Enter valid Vehicle No"))
return false;
/*
if(!validString(document.frm.make,3,"Invalid make"))
return false;

if(!validString(document.frm.model,3,"Invalid model"))
return false;
if(!validString(document.frm.web,3,"Invalid Web"))

return false;
if(!validowner(document.frm.owner,3,"Invalid owner"))
return false;

if(!validNum(document.frm.year,4,"Invalid year & it should be 4 digit number"))
return false;
return true;
}*/
</script>
    <body>
 <jsp:include page="header.html"/>
        <form name="frm" action="AddCar.jsp">


            <table width="1000" border="2" align="center">
            <tr>
                <td> Vehicle No</td>
                <td> <input type="text" name="vehno"></td>

            </tr>
            <tr>
                <td> Make</td>
                <td> <input type="text" name="make"></td>
            </tr>
            <tr>
                <td> Model</td>
                <td> <input type="text" name="model"></td>
            </tr>
            <tr>
                <td> Owner</td>
                <td> <input type="text" name="owner"></td>
            </tr>
            <tr>
                <td> Year</td>
                <td> <input type="text" name="year"> </td>
            </tr>
            <tr>
                <td> CompId</td>
                <td> <input type="text" name="cid"> </td>
            </tr>
            <tr>
                <td> PolicyId</td>
                <td> <input type="text" name="pid"> </td>
            </tr>
            <tr>
                <td> HoldId</td>
                <td> <input type="text" name="hid"> </td>
            </tr>
            <tr>
                <td> <input type="submit" name="btn" value=Add onclick="return validation()"></td>
            </tr>
        </table>

    </form>
              <%
                    String b = request.getParameter("btn");
                    String cn = request.getParameter("vehno");
                    String addr = request.getParameter("make");
                    String ci = request.getParameter("model");
                    String em = request.getParameter("owner");
                    String ph = request.getParameter("year");
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    int pid = Integer.parseInt(request.getParameter("pid"));
                    int hid = Integer.parseInt(request.getParameter("hid"));
                    
                    out.println("Instruction Working : "+ request.getParameter("year"));
                    if (b != null) {
                        if (b.equals("Add")) {
                            x.setvehno(cn);
                            x.setmake(addr);
                            x.setmodel(ci);
                            x.setowner(em);
                            x.setyear(ph);
                            x.setcid(cid);
                            x.setpid(pid);
                            x.setpid(hid);
                            boolean b1 = x.add();
                            if (b1) {
                             response.sendRedirect("CarForm.jsp");
                            }
                        }
                    }
        %>



    </body>
       <jsp:include page="footer.html"/>
</html>
