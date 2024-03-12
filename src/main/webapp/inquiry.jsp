<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbpkg.DBPKG" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry</title>
</head>
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
<h1 style="text-align:center; margin:0;">후보조회</h1>
<br>
<form style="display:flex; justify-content:center; text-align:center;">
<table>
<tr>
<td>후보번호</td>
<td>성명</td>
<td>소속정당</td>
<td>학력</td>
<td>주민번호</td>
<td>지역구</td>
<td>대표전화</td>
</tr>

<%
Connection conn = null;
Statement stmt = null;
String p_school = "";

try{
	conn = DBPKG.getConnection();
	stmt = conn.createStatement();
	String sql = "select m_no, m_name, p_name, p_school, ";
	sql += "SUBSTR(m_jumin, 1, 6)||'-'||SUBSTR(m_jumin, 7, 6) as jumin, m_city, ";
	sql += "trim(p_tel1)||'-'||p_tel2||'-'||p_tel3 as tel ";
	sql += "from tbl_member_202005 M inner join tbl_party_202005 P ";
	sql += "on M.p_code=P.p_code ";
	sql += "order by m_no";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		p_school = rs.getString("p_school");
		switch(p_school){
		case "1" :
			p_school = "고졸";
			break;
		case "2" :
			p_school = "학사";
			break;
		case "3" :
			p_school = "석사";
		 	break;
		case "4" :
			p_school = "박사";
			break;
		}
		%>
		
		<tr>
		<td><%=rs.getString("m_no") %></td>
		<td><%=rs.getString("m_name") %></td>
		<td><%=rs.getString("p_name") %></td>
		<td><%=p_school %></td>
		<td><%=rs.getString("jumin") %></td>
		<td><%=rs.getString("m_city") %></td>
		<td><%=rs.getString("tel") %></td>
		</tr>
		
		<%
	}
	
} catch (Exception e){
	e.printStackTrace();
}
%>

</table>
</form>

</section>

<footer style="position:fixed; bottom:0px; width:100%; height:30px;text-align:center; line-height:30px; background-color: blue; color:white;">
HRDKOREA Copyright&copy; 2015 All rights reserved. human Resources Development Service of Korea.
</footer>

</body>
</html>