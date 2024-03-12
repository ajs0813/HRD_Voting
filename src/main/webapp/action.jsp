<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dbpkg.DBPKG" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 처리 결과</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

// 폼 데이터 수신
String jumin = request.getParameter("jumin");
String name = request.getParameter("name");
String number = request.getParameter("number");
String time = request.getParameter("time");
String area = request.getParameter("area");
String check = request.getParameter("check");

Connection conn = null;
PreparedStatement pstmt = null;

try {
    // 데이터베이스 연결
    conn = DBPKG.getConnection();
    
    // SQL 쿼리 작성
    String sql = "INSERT INTO tbl_vote_202005 (V_JUMIN, V_NAME, M_NO, V_TIME, V_AREA , V_CONFIRM) VALUES (?, ?, ?, ?, ?, ?)";
    
    // PreparedStatement 준비
    pstmt = conn.prepareStatement(sql);
    
    // 파라미터 설정
    pstmt.setString(1, jumin);
    pstmt.setString(2, name);
    pstmt.setString(3, number);
    pstmt.setString(4, time);
    pstmt.setString(5, area);
    pstmt.setString(6, check);
    
    // 쿼리 실행
    pstmt.executeUpdate();
    
    // 리다이렉션
    response.sendRedirect("index.jsp");
} catch (Exception e) {
	System.out.println("투표하기 오류 : " + e.getMessage());
} finally {
    // 자원 해제
    try {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>
