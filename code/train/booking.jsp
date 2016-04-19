<!DOCTYPE html>
<html>
<head>
<marquee><h2 style="color:green">WELCOME TO INDIAN RAILWAY</marquee></h2>
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body background="51.jpg">
<%
String x = (String)application.getAttribute("id");
//out.println(x);
%>

<h3> <a href = "search1.jsp">search train </a></h3>
<h3> <a href = "seatAvailability1.jsp">seat availability </a></h3>
<h3> <a href = "reserve1.jsp">reservation </a></h3>
<h3> <a href = "cancel1.jsp">cancel tickets </a></h3>
<h3> <a href = "history.jsp">booking History </a></h3>
<h3><a href = "login.html">log out </a></h3>

</body>
</html>