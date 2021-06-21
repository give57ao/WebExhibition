<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%@page import="java.sql.*" %>
    <%@page import="com.oreilly.servlet.MultipartRequest" %>
    <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
    <%@page import="java.util.*" %>
    <%@page import="java.io.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정할 뉴스 데이터 내용 처리 페이지</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<% 
ServletContext scontext = getServletContext();
String realFolder = scontext.getRealPath("images");
String id = request.getParameter("b_id");
int b_id;
try{
	
	String b_filename="";
	String b_filesize="";
	MultipartRequest multi = new MultipartRequest(request, realFolder, (1024*1024*5), "utf-8", new DefaultFileRenamePolicy());
	Enumeration<?> files = multi.getFileNames();
	String file1 = (String)files.nextElement();
	String fileName1 = multi.getFilesystemName(file1);
	
	if(fileName1 == null){
		b_filename="default.png";
		b_filesize="5517Bytes";
		
	}else{
		b_filename = fileName1;
		File file = multi.getFile("b_filename");
		b_filesize = ""+file.length()+"Bytes";
	}
	
	String b_name = multi.getParameter("b_name");
	String b_title = multi.getParameter("b_title");
	String b_content = multi.getParameter("b_content");
	String b_date = multi.getParameter("b_date");
	/* 데이터베이스 연동 - 드라이버 설정 */
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8", "root", "0323");
	Statement stmt = conn.createStatement();
	
	String sql = "update dho set b_name= '" +b_name+ "',  b_title=' "+b_title+"', b_content= '" +b_content+"', b_date = '"+b_date+"', b_filename ='"+ b_filename +"' where b_id=" + id;
	//String sql = "update test set name= '" + name+ "',  address=' "+address+"' , birthym = '"+birthym+"', dept ='"+dept+"' where id=" + id;
	//String sql = "update dho set b_name= '${b_name}'  b_title='${b_title}' , b_content = '${b_content}', b_filename ='${b_filename}', b_date ='${b_date}' where b_id='${id}'";
	stmt.executeUpdate(sql);
	//out.println(sql);
	response.sendRedirect("filist.jsp");

	stmt.close();
	conn.close();
	

}catch(Exception e){
   out.println(e); 
}

%> 


</body>
</html>