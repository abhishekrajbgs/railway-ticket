<%@ taglib uri="http://www.tagunit.org/tagunit/core" prefix="tagunit" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>




<tagunit:assertEquals name="Testing">
  <tagunit:actualResult>
    <c:set var="p1" value="12345"/>
    <c:set var="p2" value="12345"/>
    <c:choose>
        <c:when test="${ p1==p2}">
         Password matched!!
        </c:when>
        <c:otherwise>
          Password doesnot matched!!
        </c:otherwise>
    </c:choose>
  </tagunit:actualResult>
  <tagunit:expectedResult>
    Password matched!!
  </tagunit:expectedResult>
</tagunit:assertEquals>


<%
String email="raj@gmail.com";
String pwd= "12345";

String tempemail,temppasswd,tempfname,templname,tempaddress,tempgender,tempcontactno;int tempcreditcardno;
int flag=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/train?user=root&password=12345");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	
	  ResultSet result = state.executeQuery("select * from user_details where email='"+email+"'");
	
	  if(result.next()){
		   tempemail = result.getString("email");
			temppasswd=result.getString("pwd");
		    if(tempemail.equals(email) && temppasswd.equals(pwd))
			{
				flag=1;
				pageContext.setAttribute("mail", tempemail);
				pageContext.setAttribute("pwd2", temppasswd);
				
			}
	
	  }
	pageContext.setAttribute("mail1", email);
	pageContext.setAttribute("pwd1", pwd);
%>
<tagunit:assertEquals name="Email matching">
  <tagunit:actualResult>
  
    <c:set var="e4" value="raj@gmail.com"/>
    <c:choose>
        <c:when test="${ mail1==mail}">
		<c:out value="${mail1}"/>
         Credential matched!!
        </c:when>
        <c:otherwise>
         Credential doesnot matched!!
        </c:otherwise>
    </c:choose>
  </tagunit:actualResult>
  <tagunit:expectedResult>
    raj@gmail.comCredential matched!!
  </tagunit:expectedResult>
</tagunit:assertEquals>


<tagunit:assertEquals name="Password matching">
  <tagunit:actualResult>
    <c:choose>
        <c:when test="${ pwd1==pwd2}">
		<c:out value="${pwd1}"/>
         Password matched!!
        </c:when>
        <c:otherwise>
		<c:out value="${pwd1}"/>
         Password doesnot matched!!
        </c:otherwise>
    </c:choose>
  </tagunit:actualResult>
  <tagunit:expectedResult>
   12345Password matched!!
  </tagunit:expectedResult>
</tagunit:assertEquals>
<%
	   connect.close();
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
  }
 %>