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
	
	
	myconn.Open();
    mycmd.ExecuteNonQuery();
	
    

	myconn.Close();
	
	%>