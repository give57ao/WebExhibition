<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>업로드 내용 확인 페이지</title>
<style>
img{
width:150px;
height:150px;}
</style>
</head>
<body>
<div> 업로드 내용 확인 페이지 </div>
<a href="fwrite.jsp">데이터 업로드 페이지 바로가기</a>
<p>
<table border="1" cellspacing="0" cellpadding="5">
<tr>
 <th> 번호 </th> <th> 이미지 </th>
 <th> 제목 </th> <th> 작성자 </th>
 <th> 날짜 </th>  
</tr>
<% request.setCharacterEncoding("utf-8"); %>
<%
try{
	String b_name, b_mail, b_title, b_content, b_date, b_filename, b_filesize;	
	int b_id, pagecount;
	int datacount = 0;
	/* 데이터베이스 연동 - 드라이버 설정 */
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8", "root", "0323");
	Statement stmt = conn.createStatement();
	/* 페이지 처리하기 위한 구문 */
	ResultSet rs0 = stmt.executeQuery("select count(b_id) from dho");
	if(rs0.next()){
		datacount = rs0.getInt(1);
		rs0.close();
	}
	int pagesize = 10;
	if((datacount%10)== 0)pagecount = datacount/(pagesize+1) + 1;
	else pagecount = datacount/ pagesize +1;
	int mypage = 1; int abpage = 1;
	if(request.getParameter("mypage")!=null){
		mypage = Integer.parseInt(request.getParameter("mypage"));
		abpage = (mypage-1) *pagesize + 1;
		if(abpage <=0)abpage = 1;
	}
	ResultSet rs = stmt.executeQuery("select b_id, b_name , b_title, b_content, b_filename, b_filesize, b_date from dho");
	if(!rs.next()){
		pagesize=0;
	}else{
	 rs.absolute(abpage);
	}
	for(int k=1; k<=pagesize; k++){
		b_id = rs.getInt(1);
		b_name = rs.getString(2);
		b_title = rs.getString(3);
		b_content = rs.getString(4);
		b_filename = rs.getString(5);
		b_filesize = rs.getString(6);
		b_date = rs.getString(7);
		%>
		<tr>
		<td> <%=b_id %> </td>
		<td> <img src="images/<%=b_filename %>"> </td>
		<td> <a href="fview.jsp?b_id=<%=b_id %>"><%=b_title %> </a> </td>
		<td><%=b_name %></td>
		<td><%=b_date %></td>
		</tr>
		<%
		if(rs.getRow() == datacount){
			break;
		}else{
			rs.next();
		}
	}
		rs.close();
		stmt.close();
		conn.close();
%>	
	</table>
	<% /* 페이지 가 번호 로 처리 되는 구문 */
	if(pagecount !=1){
		for(int l=1; l<=mypage - 1; l++){
			out.println("<a href=filist.jsp?mypage=" + l + ">" + l + "</a>");
			out.println("|");
		}
		out.println(mypage + "|");
		for(int l = mypage +1; l<=pagecount; l++){
			out.println("<a href=filist.jsp?mypage=" + l + ">" + l + "</a>");
			out.println("|");
		}
	}else{
		out.println(mypage + "|");
	}
}catch(Exception e){
	out.println(e);
}

%>





</body>
</html>