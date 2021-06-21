<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
   <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>News</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="colorlib.com">
        
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        
    
        <!-- JS --> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </head>	
    <body>
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
      <script> $('.carousel').carousel({ interval: 2000 }); </script>

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
      
             <!--검색 기능 폼-->
          <div class="s006">
      <form>
        <fieldset>
          
          <div class="inner-form">
            <div class="input-field">
              <button class="btn-search" type="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                  <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                </svg>
              </button>
              <input id="search" type="text" placeholder="Search.." value="" />
            </div>
          </div>
          <div class="suggestion-wrap">
            <span>미술</span>
            <span>갤러리</span>
            <span>가구</span>
            <span>행위예술</span>
            <span>비디오아트</span>
          </div>
        </fieldset>
      </form>
    </div>
      
      <% request.setCharacterEncoding("utf-8"); %>
<%
try{
	String b_name, b_title, b_content, b_date, b_filename, b_filesize;	
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
		 <!-- news container-->
        <div class="news-wrap">
		
        <div class="news-container">
		
		<img src="images/<%=b_filename %>">
		<div class="text">
		<a href="fview.jsp?b_id=<%=b_id %>"><%=b_title %> </a>
		<%=b_date %>
		</div>
		</div>
		</div>
		
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

}catch(Exception e){
	out.println(e);
}

%>
      
        <div class="footer">
        <div>@J-Exhibition &nbsp; &nbsp; <a href="pp.html"> Privacy Policy</a></div>
        <div>경기도 파주시 파주읍 주라위길 159l </div>
        <div><a href="https://smart.doowon.ac.kr:8443/">Smart IT</a></div>
        </div>
        

        




        <script src="index.js" async defer></script>

    </body>
</html>