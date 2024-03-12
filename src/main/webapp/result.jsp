<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbpkg.DBPKG" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
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
<h1 style="text-align:center; margin:0;">후보자등수</h1>
<br>
<form style="display:flex; justify-content:center; text-align:center;">
<table>
<tr>
<td>후보번호</td>
<td>성명</td>
<td>총투표건수</td>
</tr>

<%
Connection conn = null;
Statement stmt = null;
String p_school = "";

try{
	conn = DBPKG.getConnection();
	stmt = conn.createStatement();
	String sql = "SELECT ";
    sql+= " M.m_no, M.m_name, count(*) AS v_total";
    sql+= " FROM tbl_member_202005 M, tbl_vote_202005 V";
    sql+= " WHERE M.m_no = V.m_no AND V.v_confirm = 'Y' ";
    sql+= " GROUP BY M.m_no, M.m_name";
    sql+= " ORDER BY v_total DESC";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		
		%>
		
		<tr>
		<td><%=rs.getString("m_no") %></td>
		<td><%=rs.getString("m_name") %></td>
		<td><%=rs.getString("v_total") %></td>
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