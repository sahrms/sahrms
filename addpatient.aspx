<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Data.Odbc"%>
<%

	OdbcConnection myconn;
	OdbcCommand mycmd;
	OdbcDataReader myreader;

	string data= Request.Form("form");
	
    myconn = new OdbcConnection(@"Driver={ODBC Driver 13 for SQL Server};
    Server=tcp:sahrms.database.windows.net,1433;Database=Patients;Uid=sahrmsadmin;Pwd=Admin442;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30");
    mycmd = new OdbcCommand("INSERT INTO PATIENTS VALUES (" + Request.Form["patientid"] + "," + Request.Form["fname"] + "," + Request.Form["lname"] + "," + Request.Form["dob"] + "," + Request.Form["address"] + "," + Request.Form["phone"] + "," + Request.Form["emergcon"] + "," + Request.Form["doctor"] + ")",myconn);
	
	Response.Write("<center><table border=1><td width=75px align=center>Patient ID</td>");
        Response.Write("<td width=150px align=center>First Name</td>");
        Response.Write("<td width=150px align=center>Last Name</td>");
        Response.Write("<td width=150px align=center>Date of Birth</td>");
        Response.Write("<td width=500px align=center>Home Address</td>");
        Response.Write("<td width=150px align=center>Phone Number</td>");
        Response.Write("<td width=150px align=center>Emergency Contact Number</td>");
        Response.Write("<td width=150px align=center>Primary Doctor</td>");
	
	myconn.Open();
    //myreader = mycmd.ExecuteReader();
	


	//myreader.Close();
	myconn.Close();
	
	%>