<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*"%>
<%@page import="gdu.mall.dao.*"%>
<%
	// 세션 검사 관리자 권한 1 이상만 볼 수 있도록.
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//수집
	request.setCharacterEncoding("utf-8");
	String categoryName = request.getParameter("categoryName");
	int categoryWeight = Integer.parseInt(request.getParameter("categoryWeight"));
	
	//카테고리 중복체크
	if(CategoryDao.selectCategoryName(categoryName) != null) {
		System.out.println("이미 등록된 카테고리 입니다.");
		response.sendRedirect(request.getContextPath()+"/category/insertCategoryForm.jsp");
		return;
	}
	
	//카테고리 입력 메서드 호출
	CategoryDao.insertCategory(categoryName, categoryWeight);
	
	//카테고리 목록으로 돌아가기
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
%>
