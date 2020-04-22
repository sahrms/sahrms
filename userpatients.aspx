<html>

<head>
    <center><h1>Shippensburg Area Hospital Record Management System</h1></center>
    <br>

<!--css for nav bar-->

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
    }
    
    .topnav {
      overflow: hidden;
      background-color: #333;
    }
    
    .topnav a {
      float: inline-end;
      color: #f2f2f2;
      text-align: center;
      padding: 20px 20px;
      text-decoration: none;
      font-size: 17px;
    }
    
    .topnav a:hover {
      background-color: #ddd;
      color: black;
    }

    </style>


 </head>

<body>
    <center>
            <!--Navigation Bar-->
            <div class="topnav">
                <a href="adminhomepage.html">Home</a>
                <a href="userpatients.aspx">Patients</a>
                <a href="prescriptions.html">Prescriptions</a>
                <a href="payment.html">Payment</a>
                <a href="manuals.html">Manuals</a>

              </div>
            
              <br>
              <br>
              <h4><center>SAHRMS Patients</center></h4>

              <br><br>
            <!--SEARCH BAR- ONLY SEARCHES BY LASTNAME-->
            <center>Search Patient by Last Name</center>
            <form name="search" method="Post" action="patientsearch.aspx">
                <input type="text" name="txtsearch"><input type="submit" value="Search">
            </form>

            <!--BUTTON FOR ADDING PATIENT-->
            <button class="button" onClick="window.open('patientform.html');">
                <span class="icon">Add New Patient</span>
            </button>

           <!--BUTTON FOR EDIT PATIENT-->
           <button class="button" onClick="window.open('editpatientrecords.html');">
               <span class="icon">Edit Patient</span>
           </button>
           
           <!--BUTTON FOR DELETE
           <button class="button">
               <span class="icon">Delete</span>
           </button>-->

<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Data.Odbc"%>
<%

	Response.Write("<html><head><title>Patients</title></head><body>");

	OdbcConnection myconn;
	OdbcCommand mycmd;
	OdbcDataReader myreader;
	
    myconn = new OdbcConnection(@"Driver={ODBC Driver 13 for SQL Server};
    Server=tcp:sahrms.database.windows.net,1433;Database=Patients;Uid=sahrmsadmin;Pwd=Admin442;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30");
    mycmd = new OdbcCommand("Select * from PATIENTS",myconn);
    
	
	myconn.Open();
    myreader = mycmd.ExecuteReader();
    
	
	Response.Write("<center><table border=1 id=patienttable><td width=75px align=center>Patient ID</td>");
	Response.Write("<td width=150px align=center>First Name</td>");
    Response.Write("<td width=150px align=center>Last Name</td>");
    Response.Write("<td width=150px align=center>Date of Birth</td>");
    Response.Write("<td width=500px align=center>Home Address</td>");
    Response.Write("<td width=150px align=center>Phone Number</td>");
    Response.Write("<td width=150px align=center>Emergency Contact Number</td>");
    Response.Write("<td width=150px align=center>Primary Doctor</td>");
    
	while ((myreader.Read()))
	{
	  Response.Write("<tr>");
	  Response.Write("<td align=center>"+ myreader["PatientID"]+"</td>");
	  Response.Write("<td align=center>"+myreader["FName"] + "</td>");
	  Response.Write("<td align=center>"+myreader["LName"]+"</td>");
      Response.Write("<td align=center>"+myreader["DOB"]+"</td>");
      Response.Write("<td align=center>"+myreader["Home_Address"]+"</td>");
      Response.Write("<td align=center>"+myreader["Phone_Num"]+"</td>");
      Response.Write("<td align=center>"+myreader["E_Contact_Num"]+"</td>");
      Response.Write("<td align=center>"+myreader["UserID"]+"</td>");
      

	  Response.Write("<br>");
	}

	Response.Write("</table></center>");

	myreader.Close();
	myconn.Close();
	
	%>
	
	</body>
    </html>
    


</body>
</html>