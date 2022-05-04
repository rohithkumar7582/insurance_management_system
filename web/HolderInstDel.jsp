
<%@ page import="java.util.*,mypack.*" %>
<jsp:useBean id="x" class="mypack.Holderinst" />
<jsp:setProperty name="x" property="*" />
<BR>
<%
boolean b = x.delete();
if(b)
{
response.sendRedirect("HolderInstForm.jsp");
%>
<h2 align="Center"> Record Deleted Successfully </h2>
<%
}
else
{
%>
<h2 align="Center"> Record Deletion Failure</h2>
<%
}
%>
