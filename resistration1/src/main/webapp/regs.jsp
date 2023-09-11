<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  
  <%

  try{
	  Connection connection;
	  int result;
	  String query;
	  PreparedStatement preparedStatement;
	  Class.forName("com.mysql.cj.jdbc.Driver");
	  connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weja2?user=root&password=root");
	  query="insert into student values(?,?,?,?)";
	  preparedStatement=connection.prepareStatement(query);
	  preparedStatement.setString(1, request.getParameter("Name"));
	  preparedStatement.setString(2,request.getParameter("Email"));
	  preparedStatement.setLong(3, Long.parseLong(request.getParameter("Contact")));
	  preparedStatement.setString(4,request.getParameter("Address"));
	  result=preparedStatement.executeUpdate();
	  if(result!=0){
		 System.out.println("student registration successful!!");
	  }
	  else{
		  System.out.println("student registration failed!!");  
	  }
	  
  }
  catch(Exception e){
	  e.printStackTrace();
  }%>
  

</body>
</html>