<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>데이터 업로드 페이지</title>
</head>
<body>
<div> 제품 등록 관리자 페이지 </div>
<p>
<form name="myform" action="fwrite_act.jsp" method="post" enctype="multipart/form-data">
<table border="1" cellspacing="0" cellpadding="5">
<tr> 
<th> 이미지 파일 </th>
<td> <input type="file" name="b_filename"> </td>
</tr> 	
<tr>
<th> 작성자 </th>
<td> <input type="text" name="b_name" value=""> </td>
</tr>
<tr>
<th> 날짜 </th>
<td> <input type="text" name="b_date" value=""> </td>
</tr>
<tr>
<th> 제목 </th>
<td> <input type="text" name="b_title" value=""> </td>
</tr>
<tr>
<th> 내용 </th>
<td> <textarea name="b_content" rows="5" cols="45"> </textarea> </td>
</tr>
<tr>
<td colspan="2"> <input type="submit"  value="저장"> 
 <input type="reset" value="취소">
 </td>
</tr>
</table>
</form>





</p>
</body>
</html>