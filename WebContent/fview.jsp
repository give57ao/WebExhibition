<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.* " %>    
<!DOCTYPE html>
<html>
   <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
         <!-- JS --> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <title>뉴스_상세페이지</title>
        

    </head>
    <body>
      <!-- header -->
    <div class="header"> 
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a href="index.jsp" class="navbar-brand">J Exhibition</a>
    
         <!-- Toggle Button -->
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
           <span class="navbar-toggler-icon"></span>
          </button> 


            <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a href="aboutus.html" class="nav-link">About us</a></li> 
                <li class="nav-item"><a href="news.jsp" class="nav-link">News</a></li>
            </ul> 
            </div> 
            </nav>
      </div>
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
			<div class="null"></div>
			<div class="null"></div>
			<div class="null"></div>
			<div class="null"></div>
			<div class="null"></div>
			<div class="null"></div>
			<div class="null"></div>
			

            <div class="news-detail">
            <h2> <%=b_title %> </h2>
            <h5> <%=b_date %></h5>
            <div class="null"></div>
            <h5> <%=b_name %></h5>	
            <div class="null"></div>
            <div><img src="images/<%=b_filename %>" ></div>
       		</div>
           
            
            <div class="null"></div>
            <div class="news-detail">
            <div> <%=b_content %></div>
			 </div>
<a href="modify.jsp?b_id=<%=b_id %>">수정하기 </a>
 <!-- Multiple annotations found at this line: - b_id cannot be resolved to a variable -->
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
<p>



   <div class="footer">
        <div>@J-Exhibition &nbsp; &nbsp; <a href="pp.html"> Privacy Policy</a></div>
        <div>경기도 파주시 파주읍 주라위길 159l </div>
        <div><a href="https://smart.doowon.ac.kr:8443/">Smart IT</a></div>
        </div>
</body>
</html>