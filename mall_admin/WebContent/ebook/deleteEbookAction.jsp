<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.dao.*"%>
<%@ page import="gdu.mall.vo.*"%>
<%
	//관리자 인증 코드
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");

	int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
	
	Ebook ebook = new Ebook();
	ebook.setEbookNo(ebookNo);
	
	EbookDao.deleteEbook(ebook);
	
	response.sendRedirect(request.getContextPath() + "/ebook/ebookList.jsp");
%>