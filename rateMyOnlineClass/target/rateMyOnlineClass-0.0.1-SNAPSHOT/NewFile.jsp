<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>

<%!
 static String x, x1;
%>

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
ResultSet resultSet2 = null;

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
  
<form name="myform" onSubmit="return IsEmpty()" method="GET">

<script>document.addEventListener('contextmenu', event => event.preventDefault());</script>

<center>
<h2 align="center"><font><strong>Search for Online Course Reviews</strong></font></h2>

    <center>Quick Search <input type="radio" onclick="javascript:searchType();" name="filterType" id="qSearch"> Filter Search <input type="radio" onclick="javascript:searchType();" name="filterType" id="fSearch"><br>
    </center>
   
     
   <p>Select 'Quick Search' to perform a search for online course reviews that contain a word entered in search field.
   Select 'Filter Search' to perform a more defined search for online course reviews.</p>
   
  <center> <td><input type="text" name="id" size="100" required oninput="this.setCustomValidity('')" 
  oninvalid="this.setCustomValidity('Please enter a search term')"
  placeholder="Enter a search term" id="yesQuick" style="color:#000; visibility:hidden"></td>
  
   
   <td><input type="submit" onclick="javascript:IsEmpty();" id="btn" size="10" value="Search" style="visibility:hidden"><td></center>

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
	        document.getElementById('myP').style.visibility = 'hidden';
	       
  	    }
  	    else if(document.getElementById('fSearch').checked==true) {
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
	        document.getElementById('myP').style.visibility = 'visible';
	       
  	    }
  	}
  	 
    </script> 
  
 
 
 <p id="myP" style="visibility:hidden">Filter reviews by:
  </p>




    <select id="a" name="satisfactionLv" onchange="doSearch()" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select course satisfaction</option>
  	<option value="Very Satisfied">Very Satisfied</option>
  	<option value="Satisfied">Satisfied</option>
  	<option value="Neutral">Neutral</option>
  	<option value="Dissatisfied">Dissatisfied</option>
  	<option value="Very Dissatisfied">Very Dissatisfied</option>
	</select>	
	
  <select id="b" name="courseDifficulty"  onchange="doSearch2()" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select course difficulty</option>
  	<option value="Very Easy">Very Easy</option>
  	<option value="Easy">Easy</option>
  	<option value="Normal">Normal</option>
  	<option value="Hard">Hard</option>
  	<option value="Very Hard">Very Hard</option>
	</select>	
	
	<select id="c" name="courseGrade"  onchange="doSearch3()" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select grade received</option>
  	<option value="A">A</option>
  	<option value="B">B</option>
  	<option value="C">C</option>
  	<option value="D">D</option>
  	<option value="F">F</option>
  	<option value="Withdrew from course">Withdrew from course</option>
	</select>	
	
	<select id="d" name="race"  onchange="doSearch4()" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select a race</option>
   	<option value="Asian">Asian</option>
  	<option value="Black/African-American">Black/African-American</option>
  	<option value="White">White</option>
  	<option value="Native American/Alaskan Native">Native American/Alaskan Native</option>
  	<option value="Native Hawaiian/Pacific Islander">Native Hawaiian/Pacific Islander</option>
  	<option value="Multiple races">Multiple races</option>
  	<option value="Other">Other</option>
	</select>	
	
	<select id="e" name="country" onchange="doSearch5()" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select a country</option>
  	<option value="Afghanistan">Afghanistan</option>
	<option value="Albania">Albania</option>
	<option value="Algeria">Algeria </option>
	<option value="Andorra">Andorra </option>
	<option value="Angola">Angola </option>
	<option value="Anguilla">Anguilla</option>
	<option value="Antigua & Barbuda">Antigua & Barbuda</option>
	<option value="Argentina">Argentina</option>
	<option value="Armenia">Armenia</option>
	<option value="Australia">Australia</option>
	<option value="Austria">Austria</option>
	<option value="Azerbaijan">Azerbaijan</option>
	<option value="Bahamas">Bahamas</option>
	<option value="Bahrain"> Bahrain</option>
	<option value="Bangladesh">Bangladesh </option>
	<option value="Barbados">Barbados</option>
	<option value="Belarus">Belarus</option>
	<option value="Belgium">Belgium </option>
	<option value="Belize">Belize</option>
	<option value="Benin">Benin</option>
	<option value="Bermuda">Bermuda</option>
	<option value="Bhutan">Bhutan</option>
	<option value="Bolivia">Bolivia</option>
	<option value="Bosnia & Herzegovina">Bosnia & Herzegovina</option>
	<option value="Botswana">Botswana</option>
	<option value="Brazil">Brazil</option>
	<option value="Brunei Darussalam">Brunei Darussalam</option>
	<option value="Bulgaria">Bulgaria</option>
	<option value="Burkina Faso">Burkina Faso</option>
	<option value="Burundi">Burundi</option>
	
	<option value="Cambodia">Cambodia </option>
	<option value="Cameroon"> Cameroon</option>
	<option value="Canada"> Canada</option>
	<option value="Cape Verde">Cape Verde</option>
	<option value="Cayman Islands">Cayman Islands</option>
	<option value="Central African Republic">Central African Republic</option>
	<option value="Chad">Chad </option>
	<option value="Chile">Chile </option>
	<option value="China">China </option>
	<option value="China - Hong Kong / Macau">China - Hong Kong / Macau</option>
	<option value="Colombia">Colombia</option>
	<option value="Comoros">Comoros</option>
	<option value="Congo">Congo</option>
	<option value="Congo, Democratic Republic of (DRC)">Congo, Democratic Republic of (DRC)</option>
	<option value="Costa Rica">Costa Rica</option>
	<option value="Croatia">Croatia</option>
	<option value="Cuba">Cuba</option>
	<option value="Cyprus">Cyprus</option>
	<option value="Czech Republic">Czech Republic</option>
	<option value="Denmark">Denmark</option>
	<option value="Djibouti">Djibouti</option>
	<option value="Dominica">Dominica</option>
	<option value="Dominican Republic">Dominican Republic</option>
	<option value="Ecuador">Ecuador</option>
	<option value="Egypt">Egypt</option>
	<option value="El Salvador">El Salvador</option>
	<option value="Equatorial Guinea">Equatorial Guinea</option>
	<option value="Eritrea">Eritrea</option>
	<option value="Estonia">Estonia</option>
	<option value="Eswatini">Eswatini</option>
	<option value="Ethiopia">Ethiopia</option>
	<option value="Fiji">Fiji</option>
	<option value="Finland">Finland</option>
	<option value="France">France</option>
	<option value="French Guiana">French Guiana</option>
	<option value="Gabon">Gabon </option>
	<option value="Gambia, Republic of The">Gambia, Republic of The</option>
	<option value="Georgia">Georgia </option>
	<option value="Germany">Germany</option>
	<option value="Ghana">Ghana</option>
	<option value="Great Britain">Great Britain</option>
	<option value="Greece">Greece</option>
	<option value="Grenada">Grenada</option>
	<option value="Guadeloupe">Guadeloupe</option>
	<option value="Guatemala">Guatemala</option>
	<option value="Guinea">Guinea</option>
	<option value="Guinea-Bissau">Guinea-Bissau</option>
	<option value="Guyana">Guyana</option>
	<option value="Haiti">Haiti </option>
	<option value="Honduras">Honduras </option>
	<option value="Hungary">Hungary </option>
	<option value="Iceland">Iceland</option>
	<option value="India">India</option>
	<option value="Indonesia">Indonesia</option>
	<option value="Iran">Iran</option>
	<option value="Iraq">Iraq</option>
	<option value="Israel">Israel</option>
	<option value="Italy">Italy</option>
	<option value="Ivory Coast">Ivory Coast</option>
	<option value="Jamaica">Jamaica </option>
	<option value="Japan">Japan </option>
	<option value="Jordan">Jordan </option>
	<option value="Kazakhstan">Kazakhstan </option>
	<option value="Kenya">Kenya</option>
	<option value="North Korea">North Korea</option>
	<option value="South Korea">South Korea </option>
	<option value="Kosovo">Kosovo</option>
	<option value="Kuwait">Kuwait</option>
	<option value="Kyrgyz Republic (Kyrgyzstan)">Kyrgyzstan</option>
	<option value="Laos"> Laos</option>
	<option value="Latvia"> Latvia</option>
	<option value="Lebanon">Lebanon</option>
	<option value="Lesotho">Lesotho</option>
	<option value="Liberia">Liberia</option>
	<option value="Libya">Libya</option>
	<option value="Liechtenstein">Liechtenstein </option>
	<option value="Lithuania">Lithuania</option>
	<option value="Luxembourg">Luxembourg</option>
	<option value="Madagascar">Madagascar </option>
	<option value="Malawi">Malawi </option>
	<option value="Malaysia">Malaysia </option>
	<option value="Maldives">Maldives </option>
	<option value="Mali">Mali</option>
	<option value="Malta">Malta</option>
	<option value="Martinique">Martinique</option>
	<option value="Mauritania">Mauritania</option>
	<option value="Mauritius">Mauritius</option>
	<option value="Mayotte">Mayotte</option>
	<option value="Mexico">Mexico</option>
	<option value="Moldova, Republic of">Moldova</option>
	<option value="Monaco">Monaco</option>
	<option value="Mongolia">Mongolia</option>
	<option value="Montenegro">Montenegro</option>
	<option value="Montserrat">Montserrat</option>
	<option value="Morocco">Morocco</option>
	<option value="Mozambique">Mozambique</option>
	<option value="Myanmar/Burma">Myanmar/Burma</option>
	<option value="Namibia">Namibia</option>
	<option value="Nepal">Nepal</option>
	<option value="New Zealand">New Zealand</option>
	<option value="Nicaragua">Nicaragua</option>
	<option value="Niger">Niger</option>
	<option value="Nigeria">Nigeria</option>
	<option value="North Macedonia, Republic of">North Macedonia</option>
	<option value="Norway">Norway </option>
	<option value="Oman">Oman </option>
	<option value="Pacific Islands">Pacific Islands</option>
	<option value="Pakistan">Pakistan </option>
	<option value="Panama">Panama</option>
	<option value="Papua New Guinea">Papua New Guinea</option>
	<option value="Paraguay">Paraguay</option>
	<option value="Peru">Peru </option>
	<option value="Philippines">Philippines</option>
	<option value="Poland">Polland</option>
	<option value="Portugal">Philippines</option>
	<option value="Puerto Rico">Polland</option>
	<option value="Qatar">Polland</option>
	<option value="Reunion">Reunion</option>
	<option value="Romania">Romania</option>
	<option value="Russian Federation">Russian Federation</option>
	<option value="Rwanda">Rwanda</option>
	<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
	<option value="Saint Lucia">Saint Lucia</option>
	<option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
	<option value="Samoa">Samoa</option>
	<option value="Sao Tome and Principe">Sao Tome and Principe</option>
	<option value="Saudi Arabia">Saudi Arabia</option>
	<option value="Senegal">Senegal</option>
	<option value="Serbia">Serbia</option>
	<option value="Seychelles">Seychelles</option>
	<option value="Sierra Leone">Sierra Leone</option>
	<option value="Singapore">Singapore</option>
	<option value="Slovak Republic (Slovakia)">Serbia</option>
	<option value="Slovenia">Slovenia</option>
	<option value="Solomon Islands">Serbia</option>
	<option value="Somalia">Somalia</option>
	<option value="South Africa">South Africa</option>
	<option value="South Sudan">South Sudan</option>
	<option value="Spain">Spain</option>
	<option value="Sri Lanka">Sri Lanka</option>
	<option value="Sudan">Sudan</option>
	<option value="Suriname">Suriname</option>
	<option value="Sweden">Sweden</option>
	<option value="Switzerland">Switzerland</option>
	<option value="Syria">Syria</option>
	<option value="Tajikistan">Tajikistan</option>
	<option value="Tanzania">Tanzania</option>
	<option value="Thailand">Thailand</option>
	<option value="Netherlands">Netherlands</option>
	<option value="Timor Leste">Timor Leste</option>
	<option value="Togo">Togo</option>
	<option value="Trinidad & Tobago">Trinidad & Tobago</option>
	<option value="Tunisia">Tunisia</option>
	<option value="Turkey">Turkey</option>
	<option value="Turkmenistan">Turkmenistan</option>
	<option value="Turks & Caicos Islands">Turks & Caicos Islands</option>
	<option value="Uganda">Uganda</option>
	<option value="Ukraine">Ukraine</option>
	<option value="United Arab Emirates">United Arab Emirates</option>
	<option value="United States of America (USA)">United States of America</option>
	<option value="Uruguay">Uruguay</option>
	<option value="Uzbekistan">Uzbekistan</option>
	<option value="Venezuela">Venezuela</option>
	<option value="Vietnam">Vietnam</option>
	<option value="Virgin Islands (UK)">Virgin Islands (UK)</option>
	<option value="Virgin Islands (US)">Virgin Islands (US)</option>
	<option value="Yemen">Yemen</option>
	<option value="Zambia">Zambia</option>
	<option value="Zimbabwe">Zimbabwe</option>
	</select>	
	
	<select id="f" name="gender" onchange="doSearch6()"  style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select a gender</option>
  	<option value="Male">Male</option>
  	<option value="Female">Female</option>
	</select>	
	
	<select id="g" name="ageGroup" onchange="doSearch7()" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select age group</option>
  	<option value="12 or Younger">12 years old or younger</option>
  	<option value="13-17">13-17 years old</option>
  	<option value="18-24">18-24 years old</option>
  	<option value="25-34">25-34 years old</option>
  	<option value="35-44">35-44 years old</option>
  	<option value="45-54">45-54 years old</option>
  	<option value="55-64">55-64 years old</option>
  	<option value="65-74">65-74 years old</option>
	</select>
	
	<select id="h" name="learningStyle" onchange="doSearch8()" style="color:#000; visibility:hidden">   
	<option value="" disabled selected>Select learning style</option>
  	<option value="Reading/Writing">Reading/Writing</option>
  	<option value="Auditory">Auditory</option>
  	<option value="Visual">Visual</option>
  	<option value="Kinesthetic">Kinesthetic</option>
	</select>		
	<br>
	
	</center>
	

  <table align="center" id="table1" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr class="header" bgcolor="#AAA">
<td><b>Review Number</b></td>
<td><b>Course Name</b></td>
<td><b>Instructor Name</b></td>
<td><b>University Name</b></td>
<td><b>Satisfaction Level</b></td>
<td><b>Course Difficulty</b></td>
<td><b>Grade Received</b></td>
<td><b>Reviewer's Age Range</b></td>
<td><b>Learning Style</b></td>
<td><b>Reviewer's Race</b></td>
<td><b>Reviewer's Gender</b></td>
<td><b>Reviewer's Location</b></td>
<td><b>Description of Learning Experience</b></td>
<td><b>Date Submitted</b></td>
</tr>


<%

try{ 
	
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

String a=request.getParameter("satisfactionLv");
String b=request.getParameter("courseDifficulty");
String c=request.getParameter("courseGrade");
String d=request.getParameter("race");
String e=request.getParameter("country");
String f=request.getParameter("gender");
String g=request.getParameter("ageGroup");
String h=request.getParameter("learningStyle");
String radio=request.getParameter("filterType");


String ID;

ID=request.getParameter("id");

String sql =("SELECT * FROM surveyentries WHERE coursename LIKE '%"+ID+"%'" 
+" OR instructorname LIKE '%"+ID+"%' OR universityname LIKE '%"+ID+"%' OR satisfication LIKE '%"+ID+"%' OR difficulty LIKE '%"+ID+"%' OR enrollyear LIKE '%"+ID+"%'" 
+" OR gradereceived = '%"+ID+"%' OR describexp LIKE '%"+ID+"%'");

String sql2 =("SELECT * FROM surveyentries WHERE satisfication LIKE '%"+a+"%'" 
+" OR difficulty LIKE '%"+b+"%' OR gradereceived LIKE '%"+c+"%' OR studentrace LIKE '%"+d+"%' OR country LIKE '%"+e+"%' OR studentgender LIKE '%"+f+"%'" 
+" OR agegroup LIKE '%"+g+"%' OR learningstyle LIKE '%"+h+"%'");
//System.out.println(a);

//resultSet = statement.executeQuery(sql);
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	
%>

<script>
function doSearch() {
            var input, filter, found, table, tr, td, i, j,p;
           
            input = document.getElementById("a");
         
            
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            //p=table.getElementsByTagName("td");
            
            /*for (i = 0; i < tr.length; i++) {
              
            	  td = tr[i].getElementsByTagName("td");
            	    if (td) {
            	      p = td.textContent || td.innerText;
            	      if (p.toUpperCase().indexOf(filter) > -1) {
            	        tr[i].style.display = "";
            	      } else {
            	        tr[i].style.display = "none";
            	      }
            	    }
            	  }
            	td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                    //td[8].style.display="none";
                    found = false;
                } else {
                    tr[i].style.display = "none";
                }
            }*/
            
            /*for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                if (td) {
                  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                  } else {
                    tr[i].style.display = "none";
                  }
                }       
              }*/
              
              for (i = 2; i < tr.length; i++) {
                  td = tr[i].getElementsByTagName("td");
                  for (j = 0; j < td.length; j++) {
                      if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                          found = true;
                      }
                  }
                  if (found) {
                      tr[i].style.display = "";
                      found = false;
                  } else {
                      tr[i].style.display = "none";
                  }
              }
            
        }
</script>

<script>
function doSearch2() {
            var input, filter, found, table, tr, td, i, j;
            input = document.getElementById("b");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            for (i = 2; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                    found = false;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
</script>

<script>
function doSearch3() {
            var input, filter, found, table, tr, td, i, j;
            input = document.getElementById("c");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            for (i = 2; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                    found = false;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
</script>

<script>
function doSearch4() {
            var input, filter, found, table, tr, td, i, j;
            input = document.getElementById("d");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            for (i = 2; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                    found = false;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
</script>

<script>
function doSearch5() {
            var input, filter, found, table, tr, td, i, j;
            input = document.getElementById("e");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            for (i = 2; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                    found = false;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
</script>
<script>
function doSearch6() {
            var input, filter, found, table, tr, td, i, j;
            input = document.getElementById("f");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            for (i = 2; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                    found = false;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
</script>
<script>
function doSearch7() {
            var input, filter, found, table, tr, td, i, j;
            input = document.getElementById("g");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            for (i = 2; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                    found = false;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
</script>
<script>
function doSearch8() {
            var input, filter, found, table, tr, td, i, j;
            input = document.getElementById("h");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            for (i = 2; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                    found = false;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
</script>
<tr class="x" bgcolor="#666">

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("coursename") %></td>
<td><%=resultSet.getString("instructorname") %></td>
<td><%=resultSet.getString("universityname") %></td>
<td><%=resultSet.getString("satisfication") %></td>
<td><%=resultSet.getString("difficulty") %></td>
<td><%=resultSet.getString("gradereceived") %></td>
<td><%=resultSet.getString("agegroup") %></td>
<td><%=resultSet.getString("learningstyle") %></td>
<td><%=resultSet.getString("studentrace") %></td>
<td><%=resultSet.getString("studentgender") %></td>
<td><%=resultSet.getString("country") %></td>
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


