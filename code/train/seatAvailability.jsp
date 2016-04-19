<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<body background="25.jpg">
<marquee><h2 style="color:green">WELCOME TO INDIAN RAILWAY</marquee></h2>
<%
int b_id= Integer.parseInt(request.getParameter("train_no"));
int r_id= Integer.parseInt(request.getParameter("r_id"));
String src= request.getParameter("src");
String dest= request.getParameter("dest");
String dat= request.getParameter("date");
/*application.setAttribute("bs_id",b_id);
application.setAttribute("rt_id",r_id);
application.setAttribute("ddet",dat);
application.setAttribute("dstn",dest);
application.setAttribute("src",src);*/

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/train?user=root&password=12345");
	  
	  //statement query
	  try{
	 Statement state =connect.createStatement();
	 int dateCmp=0;
	 String sq = "select datediff('"+dat+"',curdate()) as t";
	 ResultSet result = state.executeQuery(sq);
	 while(result.next())
	 {
		dateCmp=result.getInt("t");
	 }
	 if((dateCmp >=0 ) && (dateCmp<7))
	 {
	 String sql1 ="select tot_seats from train natural join (has natural join route) where train_no = "+b_id+" and route_id = "+r_id+ " and source like '"+src+"' and dest like '"+dest+"' and depart_date = '"+dat+"'";
	 String sql2 ="select count(*) as seats from reserves natural join records where train_no = "+b_id+" and route_id = "+r_id;
	 ResultSet result1 = state.executeQuery(sql1);
	 int tot_seats=0,seats=0,seatsAvailable=0;
	 while(result1.next())
	 {
		tot_seats=result1.getInt("tot_seats");
		//out.println(""+tot_seats);
	 }
	 ResultSet result2 = state.executeQuery(sql2);
	 while(result2.next())
	 {
		seats=result2.getInt("seats");
		//seats = 5;
		//out.println(""+seats);
	 }
		//out.println("check5");
		seatsAvailable = tot_seats - seats;
		out.println("Total available seats = "+seatsAvailable);

	 }
	 else
	 out.println("Enquired train is not in correct range of date!!! Please Try Again!!!");
	 }
	 catch(Exception e)
	 {
	 out.println(""+e);
	 }
	 connect.close();
 %>
 
 
 <form method = "get" action = "seatAvailability1.jsp">
<p>
<input type="submit" value="Back" >
</p>
</form>

 </body>
 </html>