<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
<marquee><h2 style="color:green">WELCOME TO INDIAN RAILWAY</marquee></h2>
</head>
<body background="25.jpg">
<h2> Search : </h2> 

<form method = "get" action = "search.jsp">
<table>
<tr><td><b>Source :</b></td><td><input type="text" name="src" /></td></tr>
<tr><td><b>Destination :</b></td><td><input type="text" name="dest" /></td></tr>
<tr><td><b>date (YYYY-MM-DD) :</b></td><td><input type="date" name="date" /></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="submit" /> <input type="reset" value="reset" /></td></tr></td></tr>
<%
String x = (String)application.getAttribute("id");
//out.println(x);
%>

</table>
</form>

<form method = "get" action = "booking.jsp">
<p>
<input type="submit" value="Back" >
</p>
</form>

</body>
</html>