<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.* " %>    
<!DOCTYPE html>
<html>
   <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>뉴스_상세페이지</title>
        

    </head>
    <body>
<%
/*  예외 처리문  */ 
  try{
	  String b_name, b_title, b_content, b_date, b_filename, b_filesize; 
		int b_id; 
		String id = request.getParameter("b_id"); 
		/*  데이터베이스 드라이버 설정  */ 
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8", "root", "0323");
		Statement stmt = conn.createStatement();
		String sql = "select b_id, b_name,  b_title, b_content, b_filename, b_filesize, b_date from dho where b_id="+id;
		ResultSet rs = stmt.executeQuery(sql); 
		
		if(rs.next()){
			b_id = rs.getInt(1);
			b_name = rs.getString(2);
			b_title = rs.getString(3);
			b_content = rs.getString(4);
			b_filename = rs.getString(5);
			b_filesize = rs.getString(6);
			b_date = rs.getString(7);
			
		
			
%> 
            
   
            
            <h2> <%=b_title %> </h2>
            <h5> <%=b_date %></h5>
            <div class="null"></div>
            <h5> <%=b_name %></h5>	
            <div class="null"></div>
            <div><img src="images/<%=b_filename %>" ></div>
       
           
            
            <div class="null"></div>
            <div class="news-detail">
            <div> <%=b_content %></div>
			 </div>
<%			
		}
	rs.close(); 	
	 
	conn.close(); 
  } catch(Exception e){
	  out.println(e); 
  }	

%>

<p> 
<a href="news.jsp">  뒤로가기  </a>
<a href="modify.jsp">수정하기</a>

  <div class="footer">
</body>
</html>