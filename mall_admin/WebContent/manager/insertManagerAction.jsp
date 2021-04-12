<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.dao.ManagerDao" %>
<%@ page import="gdu.mall.vo.Manager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//수집.
	request.setCharacterEncoding("UTF-8");
	String managerId = request.getParameter("managerId");
	String managerPw = request.getParameter("managerPw");
	String managerName = request.getParameter("managerName");
	//디버깅
	System.out.println("managerId : " + managerId + " managerPw : " + managerPw + " managerName : " + managerName);
	
	//ID 중복체크
	String returnManagerId = ManagerDao.selectManagerId(managerId);
	if(returnManagerId != null) {
		System.out.println("사용중인 아이디 입니다");
		response.sendRedirect(request.getContextPath()+"/manager/insertManagerForm.jsp");
		return;
	}
	
	ManagerDao.insertManager(managerId, managerPw, managerName);
%>
	<div>
		매니저 등록 성공. 승인 후 사용 가능합니다.
		<a href="<%=request.getContextPath()%>/adminIndex.jsp">관리자 홈</a>
	</div>
</body>
</html>