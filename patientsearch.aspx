
<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Data.Odbc"%>
<%

	Response.Write("<html><head><title>Patients</title></head><body>");

	OdbcConnection myconn;
	OdbcCommand mycmd;
	OdbcDataReader myreader;
    
    var search = Request.Form["txtsearch"];

    myconn = new OdbcConnection(@"Driver={ODBC Driver 13 for SQL Server};
    Server=tcp:sahrms.database.windows.net,1433;Database=Patients;Uid=sahrmsadmin;Pwd=Admin442;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30");
    mycmd = new OdbcCommand("SELECT * from patienttable where LName like '%" + search +"&'",myconn);
    
	
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