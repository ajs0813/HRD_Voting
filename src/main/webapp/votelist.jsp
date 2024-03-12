<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbpkg.DBPKG" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>votelist</title>
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
<h1 style="text-align:center; margin:0;">투표검수조회</h1>
<br>
<form style="display:flex; justify-content:center; text-align:center;">
<table>
<tr>
<td>성명</td>
<td>생년월일</td>
<td>나이</td>
<td>성별</td>
<td>후보번호</td>
<td>투표시간</td>
<td>유권자확인</td>
</tr>
<%
Connection conn = null;
Statement stmt = null;


try{
	conn = DBPKG.getConnection();
	stmt = conn.createStatement();
	String sql = "SELECT v_name,";
    sql+= " '19'||substr(v_jumin,1,2)||";
    sql+= " '년'||substr(v_jumin,3,2)||";
    sql+= " '월'||substr(v_jumin,5,2)||";
    sql+= " '일생' v_jumin,";
    sql+= " '만 '||(to_number(to_char(sysdate,'yyyy'))";
    sql+= " - to_number('19'||substr(v_jumin,1,2)))||'세' v_age,";
    sql+= " DECODE(substr(v_jumin,7,1),'1','남','여') v_gender, ";		   
    sql+= " m_no, ";
    sql+= " substr(v_time,1,2)||':'||substr(v_time,3,2) v_time, ";
    sql+= " DECODE(v_confirm,'Y','확인','미확인') v_confirm ";
    sql+= " FROM tbl_vote_202005 ";
    sql+= " WHERE v_area='제1투표장'";
		   
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		
		
		%>
		
		<tr>
		<td><%=rs.getString("v_name") %></td>
		<td><%=rs.getString("v_jumin") %></td>
		<td><%=rs.getString("v_age") %></td>
		<td><%=rs.getString("v_gender") %></td>
		<td><%=rs.getString("m_no") %></td>
		<td><%=rs.getString("v_time") %></td>
		<td><%=rs.getString("v_confirm") %></td>
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