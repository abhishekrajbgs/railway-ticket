<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<body background="58.jpg">
<marquee><h2 style="color:green">WELCOME TO INDIAN RAILWAY</marquee></h2>
<%
String src= request.getParameter("src");
String dest= request.getParameter("dest");
String dat= request.getParameter("date");

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/train?user=root&password=12345");
	  
	  //statement query
	  try{
	 Statement state =connect.createStatement();
	 String sql ="select * from train natural join (has natural join route) where source like '"+src+"' and dest like '"+dest+"' and depart_date = '"+dat+"'";
	 ResultSet result = state.executeQuery(sql);
	 String AC,Sleeper,destn,srce,tm;
	 Date det;
	 int train_no,tot_seats,r_id,fare;
	 int bd[] = new int[20];
	 int i = 0;
	 %>
	 <h2> <b> train_no_____route_id____________|source___________|destination__________|sleeper___________|AC___________|fare_________|depart_date________|depart_time </b> </h2>
	 <%
	 while(result.next())
	 {
		train_no=result.getInt("train_no");
		tot_seats=result.getInt("tot_seats");
		AC= result.getString("AC_type");
		Sleeper= result.getString("sleeper_type");
		r_id=result.getInt("route_id");
		det= result.getDate("depart_date");
		tm= result.getString("depart_time");
		destn= result.getString("dest");
		srce= result.getString("source");
		fare=result.getInt("fare");
		%><br></br><%
		out.println(train_no +"__________|"+r_id+"__________|"+srce+"__________|"+destn+"__________|"+Sleeper+"__________|"+AC+"__________|"+fare+"__________|"+det+"__________|"+tm);
		bd[i] = train_no;
		application.setAttribute("bs_id",bd[i]);
		application.setAttribute("rt_id",r_id);
		application.setAttribute("ddet",det);
		application.setAttribute("dstn",destn);
		application.setAttribute("src",srce);
		%>
		<form method = "get" action = "seatAvail.jsp">
		<input type="submit" value="seatAvailability" >
		</form>
		<%
		out.print("\n");
		i++;
	 }
	 
		String x = (String)application.getAttribute("id");
		//out.println(x);

	 }
	 catch(Exception e)
	 {
	 out.println(""+e);
	 }
	 connect.close();
 %>
 
		<form method = "get" action = "search1.jsp">
		<input type="submit" value="Back" >
		</form>
		
 </body>
 </html>