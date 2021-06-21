<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 수정 페이지</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<% 
/*
int id = Integer.parseInt(request.getParameter("id"));
out.println("해당번호" + id);
*/
try{
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String birthym=request.getParameter("birthym");
	String dept=request.getParameter("dept");
	int id = Integer.parseInt(request.getParameter("id"));
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/numdb?useUnicode=true&characterEncoding=utf8","choo","123");
	Statement stmt = conn.createStatement();
	String sql = "update test set name= '" + name+ "',  address=' "+address+"' , birthym = '"+birthym+"', dept ='"+dept+"' where id=" + id;
	//String sql = "update test set name='"+name+"', address='"+address+"' ,birthym='"+birthym+"', dept='"+dept+"' where id =" id;
	stmt.executeUpdate(sql);
	response.sendRedirect("dbtest.jsp");
	stmt.close();
	conn.close();
	

}catch(Exception e){
   out.println(e); 
}

%> 


</body>
</html>