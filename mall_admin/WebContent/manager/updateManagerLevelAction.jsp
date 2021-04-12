<%@page import="gdu.mall.vo.Manager"%>
<%@page import="gdu.mall.dao.ManagerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//세션 체크
	Manager manager = (Manager)session.getAttribute("sessionManager");
	
	if(session.getAttribute("sessionManager") == null) {
	response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
	return;
	} else if(manager.getManagerLevel() < 2){
		System.out.println("관리자 권한이 부족합니다. 상위 관리자에게 문의하세요");
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//수집. 필요 데이터 모두 int이기 때문에 인코딩 불필요
	int managerNo = Integer.parseInt(request.getParameter("managerNo"));
	int managerLevel = Integer.parseInt(request.getParameter("managerLevel"));
	System.out.println("관리자Level 수정 No:"+ managerNo + " Level " +managerLevel + " ");
	
	ManagerDao.updateManagerLevel(managerNo, managerLevel);
	
	//리스트로 돌아가기
	response.sendRedirect(request.getContextPath()+"/manager/managerList.jsp");
%>