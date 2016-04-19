<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body background="59.jpg">
<marquee><h2 style="color:green">WELCOME TO INDIAN RAILWAY</marquee></h2>
<h2> Seat Availability : </h2> 

<form method = "get" action = "seatAvailability.jsp">
<table>
<tr><td><b>train Id :</b></td><td><input type="text" name="train_no" /></td></tr>
<tr><td><b>Route Id :</b></td><td><input type="text" name="r_id" /></td></tr>
<tr><td><b>Source Station :</b></td><td><input type="text" name="src" /></td></tr>
<tr><td><b>Destination Station :</b></td><td><input type="text" name="dest" /></td></tr>
<tr><td><b>Date (YYYY-MM-DD) :</b></td><td><input type="text" name="date" /></td></tr>
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