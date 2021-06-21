<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<% 
String b_name=null, b_title=null, b_content=null, b_filename=null, b_filesize = null, b_date=null;
int id = Integer.parseInt(request.getParameter("b_id"));
out.println("선택한 번호:" + id+ "<br/>");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8", "root", "0323");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select b_name, b_title, b_content, b_filename, b_date from dho where b_id="+id);
if(rs.next()){
	b_name = rs.getString(1);
	b_title = rs.getString(2);
	b_content = rs.getString(3);
	b_filename = rs.getString(4);
	b_date = rs.getString(5);
}
rs.close();
stmt.close();
conn.close();
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정할 뉴스 데이터 내용</title>
</head>
<body>
 
 


<form name="myform" action="modify_act.jsp" method="post" enctype="multipart/form-data">
<table border="1" cellspacing="0" cellpadding="5">
<tr>
<th>작성자</th> <td> <input type="text" name="name" value="<%=b_name%>"></td>
</tr>
<tr>
<th>제목</th> <td><input type="text" name="address" value="<%=b_title %>"></td>
<tr>
<th>내용</th> <td><input type="text" name="birthym" value="<%=b_content %>"></td>
</tr>
<tr>
<th> 이미지 파일 </th><td> <input type="file" name="b_filename" value="<%=b_filename %>">> </td>
</tr>
<tr>
  <td colspan="2">   
       <input type="hidden" name="id" value="<%=id %>">
        <input type="submit" value="수정"> 
        </td>
</tr>
</table>




</form>


</body>
</html>