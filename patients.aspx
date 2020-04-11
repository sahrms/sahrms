<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Data.Odbc"%>
<%

	Response.Write("<html><head><title>EMPLOYEE ASP in C# </title></head><body>");

	OdbcConnection myconn;
	OdbcCommand mycmd;
	OdbcDataReader myreader;
	
	myconn = new OdbcConnection(@"Driver={ODBC Driver 13 for SQL Server};Server=tcp:sahrms.database.windows.net,1433;Database=Patients;Uid=sahrmsadmin;Pwd=Admin442;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;
	mycmd = new OdbcCommand("Select*from Patients",myconn);
	
	Response.Write("<b>Data from the Names table in the EMPLOYEES ACCESS Database: C# Program</b>");
	
	myconn.Open();
	myreader = mycmd.ExecuteReader();
	
	Response.Write("<table border=1><td>ID</td>");
	Response.Write("<td> First Name </td>");
	Response.Write("<td> Last Name </td>");
	
	while ((myreader.Read()))
	{
	  Response.Write("<tr>");
	  Response.Write("<td>"+ myreader["ID"]+"</td>");
	  Response.Write("<td>"+myreader["First Name"] + "</td>");
	  Response.Write("<td>"+myreader["Last Name"]+"</td>");
      Response.Write("<td>"+myreader["DOB"]+"</td>");
      Response.Write("<td>"+myreader["Home_Address"]+"</td>");
      Response.Write("<td>"+myreader["PhoneNumber"]+"</td>");
      Response.Write("<td>"+myreader["Emergency Contact"]+"</td>");
      Response.Write("<td>"+myreader["Doctor"]+"</td>");
      

	  Response.Write("<br>");
	}

	Response.Write("</table></center>");

	myreader.Close();
	myconn.Close();
	
	%>
	
	</body>
	</html>