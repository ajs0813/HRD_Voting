<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbpkg.DBPKG" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vote</title>
</head>
<script type="text/javascript" src="check.js"></script>
<style>

a{
text-decoration:none;
color: white;
}

table, td{
border:1px solid black;
border-collapse:collapse;
}
</style>
<body>

<header style="position:fixed; top:0px; width:100%; height:60px; background-color:blue; color:white; text-align:center; line-height:60px;">
(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05
</header>

<nav style="position:fixed; top:60px; width:100%; height:30px; background-color:purple; color:white; line-height:30px;">
<a href="inquiry.jsp">후보조회 &nbsp;</a>
<a href="vote.jsp">투표하기 &nbsp;</a>
<a href="votelist.jsp">투표검수조회 &nbsp;</a>
<a href="result.jsp">후보자등수 &nbsp;</a>
<a href="index.jsp">홈으로</a>
</nav>

<section style="position: fixed; top: 90px; width:100%; height:100%; background-color:gray;">
<h1 style="text-align:center; margin:0;">투표하기</h1>
<br>
<form method="post" name="frm" action="action.jsp" style="display:flex; justify-content:center;">
<table>
<tr>
<td>주민번호</td>
<td><input type="text" name="jumin">예 : 8906153154726</td>
</tr>
<tr>
<td>성명</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>투표번호</td>
<td>
<select name="number">
<option>
<option value="1">[1]김후보</option>
<option value="2">[2]이후보</option>
<option value="3">[3]박후보</option>
<option value="4">[4]조후보</option>
<option value="5">[5]최후보</option>
</select>
</td>
</tr>
<tr>
<td>투표시간</td>
<td><input type="text" name="time"></td>
</tr>
<tr>
<td>투표장소</td>
<td><input type="text" name="area"></td>
</tr>
<tr>
<td>유권자확인</td>
<td>
<input type="radio" name="check" value="Y">확인
<input type="radio" name="check" value="N">미확인
</td>
</tr>
<tr>
<td colspan="2" style="text-align:center;">
<input type="submit" value="투표하기" onclick="return voteCheck()">
<input type="reset" value="다시하기" onclick="return cancel()">
</td>

</tr>


</table>
</form>

</section>

<footer style="position:fixed; bottom:0px; width:100%; height:30px;text-align:center; line-height:30px; background-color: blue; color:white;">
HRDKOREA Copyright&copy; 2015 All rights reserved. human Resources Development Service of Korea.
</footer>

</body>
</html>