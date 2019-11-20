<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%
String id = request.getParameter("userId");
String driverName = "org.postgresql.Driver";
String connectionUrl = "jdbc:postgresql://localhost:5432/";
String dbName = "RateMyOnlineClass";
String userId = "postgres";
String password = "YellowJackets2k21";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Rate My Online Class</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
<p align="left">RATE MY ONLINE CLASS</p>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="homepage.html">Home</a></li>
        <li><a href="test.html">Submit an Online Class Review</a></li>
        <li><a href="NewFile.jsp">Search for a Class Review</a></li>
        <li><a href="demographicInfo.html">View Survey Taker Demographics</a></li>
      </ul>
    </div>
  </div>
</nav>

<style>
.container1 {
  background-color: black;
  color: white;
  margin: 20px;
  padding: 20px;
}
</style>

<div class="container1">
  <div class="row">
  
<form name="myform" method="GET">

<style>

</style>

<center>
<h2 align="center"><font><strong>Search for Online Course Reviews</strong></font></h2>

    <center>Quick Search <input type="radio" onclick="javascript:searchType();" name="filterType" id="qSearch"> Filter Search <input type="radio" onclick="javascript:searchType();" name="filterType" id="fSearch"><br>
    </center>
    
    
  <center> <td><input type="text" name="id" size="100" id="yesQuick" style="color:#000; visibility:hidden"></td>
   <td><input type="submit" id="btn" size="10" value="Search" style="visibility:hidden"><td></center>
  
    <script>
  	  function searchType() {
  	    if (document.getElementById('qSearch').checked==true) 
  	    {
  	        document.getElementById('yesQuick').style.visibility = 'visible';
  	        document.getElementById('btn').style.visibility = 'visible';
  	        //document.getElementById('s').style.visibility = 'visible';
  	        document.getElementById('a').style.visibility = 'hidden';
	        document.getElementById('b').style.visibility = 'hidden';
	        document.getElementById('c').style.visibility = 'hidden';
	        document.getElementById('d').style.visibility = 'hidden';
	        document.getElementById('e').style.visibility = 'hidden';
	        document.getElementById('f').style.visibility = 'hidden';
	        document.getElementById('g').style.visibility = 'hidden';
	        document.getElementById('h').style.visibility = 'hidden';
	        
	        <%
	        String x="quick";
	        %>
  	    }
  	    if(document.getElementById('fSearch').checked==true) {
  	        document.getElementById('yesQuick').style.visibility = 'hidden';
  	        document.getElementById('btn').style.visibility = 'hidden';
  	      document.getElementById('a').style.visibility = 'visible';
	        document.getElementById('b').style.visibility = 'visible';
	        document.getElementById('c').style.visibility = 'visible';
	        document.getElementById('d').style.visibility = 'visible';
	        document.getElementById('e').style.visibility = 'visible';
	        document.getElementById('f').style.visibility = 'visible';
	        document.getElementById('g').style.visibility = 'visible';
	        document.getElementById('h').style.visibility = 'visible';
	        <%
	        String x1="filter";
	        %>

  	    }
  	}
    </script> 
  <p>Select 'Quick Search' to perform a search for online course reviews that contain a word entered in search field.
   Select 'Filter Search' to perform a more defined search for online course reviews.</p>
  
  <br>Filter reviews by: <br>
 
  Course Satisfaction    Course Difficulty    Grade Received  Reviewer's Race<br>
  <br>Course Satisfaction
  <select id="a" onchange="myFunc()" name="satisfactionLv" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select course satisfaction</option>
  	<option value="Very Satisfied">Very Satisfied</option>
  	<option value="Satisfied">Satisfied</option>
  	<option value="Neutral">Neutral</option>
  	<option value="Disatisfied">Dissatisfied</option>
  	<option value="Very Disatisfied">Very Dissatisfied</option>
	</select>	
	
  <select id="b" name="courseDifficulty"  style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select course difficulty</option>
  	<option value="Very Easy">Very Easy</option>
  	<option value="Easy">Easy</option>
  	<option value="Normal">Normal</option>
  	<option value="Hard">Hard</option>
  	<option value="Very Hard">Very Hard</option>
	</select>	
	
	<select id="c" name="courseGrade"  style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select grade received</option>
  	<option value="A">A</option>
  	<option value="B">B</option>
  	<option value="C">C</option>
  	<option value="D">D</option>
  	<option value="F">F</option>
  	<option value="Withdrew from course">Withdrew from course</option>
	</select>	
	
	<select id="d" name="race"  style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select a race</option>
   	<option value="Asian">Asian</option>
  	<option value="Easy">Black/African-American</option>
  	<option value="Normal">White</option>
  	<option value="Hard">Native American/Alaskan Native</option>
  	<option value="Very Hard">Native Hawaiian/Pacific Islander</option>
  	<option value="Very Hard">Multiple races</option>
  	<option value="Very Hard">Other</option>
	</select>	
	
	<select id="e" name="satisfactionLv" required style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select a country</option>
  	<option value="Asian">Asian</option>
  	<option value="Easy">C</option>
  	<option value="Normal">White</option>
  	<option value="Hard">Native American/Alaskan Native</option>
  	<option value="Very Hard">Native Hawaiian/Pacific Islander</option>
  	<option value="Very Hard">Multiple races</option>
  	<option value="Very Hard">Other</option>
	</select>	
	
	<select id="f" name="gender" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select a gender</option>
  	<option value="Male">Male</option>
  	<option value="Female">Female</option>
	</select>	
	
	<select id="g" name="ageGroup"  style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select age group</option>
  	<option value="12orYounger">12 years old or younger</option>
  	<option value="13-17">13-17 years old</option>
  	<option value="18-24">18-24 years old</option>
  	<option value="25-34">25-34 years old</option>
  	<option value="35-44">35-44 years old</option>
  	<option value="45-54">45-54 years old</option>
  	<option value="55-64">55-64 years old</option>
  	<option value="65-74">65-74 years old</option>
	</select>
	
	<select id="h" name="learningStyle"  style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select learning style</option>
  	<option value="Very Easy">Reading/Writing</option>
  	<option value="Easy">Auditory</option>
  	<option value="Normal">Visual</option>
  	<option value="Hard">Kinesthetic</option>
	</select>		
	
	<br>


<script>
function myFunc() 
{
	var input, filter, ul, li, x, y;
	
	input=document.getElementId(a);
	filter=input.value.toUpperCase();; 
	ul= document.getElementById("table1");
	li = document.getElementsByTagName("td");
		
		for(i=0; i<li.length;i++) {
			x=li[i].getElementsByTagName('x')[0];
			if (x.innerHTML.toUpperCase().indexOf(filter)>-1) {
				li[i].style.display="";
			}else{
				li[i].style.display="none";
			}
			}
	
}
</script> 
  <table align="center" id="table1" cellpadding="5" cellspacing="5" border="1">
<tr>


</tr>
<tr bgcolor="#A52A2A">
<td><b>Review Number</b></td>
<td><b>Course Name</b></td>
<td><b>Instructor Name</b></td>
<td><b>University Name</b></td>
<td><b>Satisfaction Level</b></td>
<td><b>Course Difficulty</b></td>
<td><b>Grade Received</b></td>
<td><b>Description of Learning Experience</b></td>
<td><b>Date Submitted</b></td>
</tr>



<%
  

try{ 
	
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

String a=request.getParameter("a");
String b=request.getParameter("b");
String c=request.getParameter("c");
String d=request.getParameter("d");
String e=request.getParameter("e");
String f=request.getParameter("f");
String g=request.getParameter("g");
String h=request.getParameter("h");

String ID=request.getParameter("id");

String sql =("SELECT * FROM surveyentries WHERE coursename LIKE '%"+ID+"%'" 
+" OR instructorname LIKE '%"+ID+"%' OR universityname LIKE '%"+ID+"%' OR satisfication LIKE '%"+ID+"%' OR difficulty LIKE '%"+ID+"%' OR enrollyear LIKE '%"+ID+"%'" 
+" OR gradereceived LIKE '%"+ID+"%' OR describexp LIKE '%"+ID+"%'");

resultSet = statement.executeQuery(sql);


while(resultSet.next()){
	
%>

<tr class="x" bgcolor="#DEB887">

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("coursename") %></td>
<td><%=resultSet.getString("instructorname") %></td>
<td><%=resultSet.getString("universityname") %></td>
<td><%=resultSet.getString("satisfication") %></td>
<td><%=resultSet.getString("difficulty") %></td>
<td><%=resultSet.getString("gradereceived") %></td>
<td> <div style="word-break:break-all;"><%=resultSet.getString("describexp") %></div></td>
<td><%=resultSet.getString("timestamp") %></td>
</tr>


<%
}


} catch (Exception e) {
e.printStackTrace();
}
%>
	
</table>
 </form>
  
</body>
</html>


