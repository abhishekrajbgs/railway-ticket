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
String user_id="raj";
String pwd= "12345";

String tempemail,temppasswd,tempfname,templname,tempaddress,tempgender,tempcontactno;int tempcreditcardno;
int flag=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/train?user=root&password=12345");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	
	  ResultSet result = state.executeQuery("select * from user_details where user_id='"+user_id+"'");
	
	  if(result.next()){
		   tempemail = result.getString("user_id");
			temppasswd=result.getString("pwd");
		    if(tempemail.equals(user_id) && temppasswd.equals(pwd))
			{
				flag=1;
				pageContext.setAttribute("user_id2", tempemail);
				pageContext.setAttribute("pwd2", temppasswd);
				
			}
	
	  }
	pageContext.setAttribute("user_id1", user_id);
	pageContext.setAttribute("pwd1", pwd);
%>
<tagunit:assertEquals name="user_id matching">
  <tagunit:actualResult>
  
    <c:set var="e4" value="raj"/>
    <c:choose>
        <c:when test="${ user_id1==user_id2}">
		<c:out value="${user_id1}"/>
         Credential matched!!
        </c:when>
        <c:otherwise>
         Credential doesnot matched!!
        </c:otherwise>
    </c:choose>
  </tagunit:actualResult>
  <tagunit:expectedResult>
    raj.comCredential matched!!
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