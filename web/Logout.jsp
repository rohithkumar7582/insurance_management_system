
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout page</title>
    </head>
    <jsp:include page="logo.html"/>

      <br><br><br><br><br>


     <body bgcolor="#A8A8A8">
         <h1 align="center">Logged Out Successfully</h1>


                <form method="get" action="check.jsp">
                    <table bgcolor=#666666 border="1" align="center" size="600" cellspacing="2" cellpadding="0">
                        <tr>
                            <td>User name</td>
                            <td><input type="text" name="uname" ></td>

                        </tr>
                          <tr>
                            <td>Password</td>
                            <td><input type="password" name="pass"></td>

                        </tr>
                        <tr>
                            <td><input type="submit" value="Login"></td>
                        </tr>

                    </table>
                </form>

              </body>
</html>
