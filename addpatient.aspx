<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Data.Odbc"%>
<%

	OdbcConnection myconn;
	OdbcCommand mycmd;
	OdbcDataReader myreader;
	
	<!--string patientid = Request.Form["patientid"];
	string fname = Request.Form["fname"];
	string lname = Request.Form["lname"];
	string dob = Request.Form["dob"];
	string address = Request.Form["address"];
	string phone = Request.Form["phone"];
	string emergcon = Request.Form["emergcon"];
	string doctor = Request.Form["doctor"];

	Response.Write("<html><body>patientid &nbsp; fname</body></html>"); -->

   myconn = new OdbcConnection(@"Driver={ODBC Driver 13 for SQL Server};
    Server=tcp:sahrms.database.windows.net,1433;Database=Patients;Uid=sahrmsadmin;Pwd=Admin442;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30");
    mycmd = new OdbcCommand("INSERT INTO PATIENTS (PatientID, FName, LName, DOB, Home_Address, Phone_Num, E_Contact_Num, UserID) VALUES (patientid, fname, lname, dob, address, phone, emergcon, doctor)",myconn);
	
	
	myconn.Open();
    mycmd.ExecuteReader();
	
    

	myconn.Close();
	
	%>