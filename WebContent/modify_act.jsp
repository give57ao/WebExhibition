<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정할 뉴스 데이터 내용 처리 페이지</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<% 

try{
	String b_name=request.getParameter("b_name");
	String b_title=request.getParameter("b_title");
	String b_content=request.getParameter("b_content");
	String b_filename=request.getParameter("b_filename");
	String b_date=request.getParameter("b_date");
	int id = Integer.parseInt(request.getParameter("b_id"));
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8", "root", "0323");
	Statement stmt = conn.createStatement();
	String sql = "update dho set b_name= '" + b_name+ "',  b_title=' "+b_title+"' , b_content = '"+b_content+"', b_filename ='"+b_filename+"', b_date ='"+b_date+"' where id=" + id;
	//String sql = "update dho set b_name= '" + b_name+ "',  b_title=' "+b_title+"' , b_content = '"+b_content+"', b_filename ='"+b_filename+"', b_date ='"+b_date+"' where id=" id;
	stmt.executeUpdate(sql);
	response.sendRedirect("fview.jsp");
	stmt.close();
	conn.close();
	

}catch(Exception e){
   out.println(e); 
}

%> 


</body>
</html>