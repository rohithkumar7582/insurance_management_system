<%-- 
    Document   : error
    Created on : 1 Apr, 2011, 3:21:58 PM
    Author     : vedisoft
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body BGCOLOR="#A8A8A8">


                <h2 align="center">Login</h2>
                <form method="get" action="check.jsp">
                    <table border="1" align="center" size="200">
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


        <h2>SORRY!!!!!!INCORRECT USERNAME AND PASSWORD</h2>
        
    </body>
</html>
