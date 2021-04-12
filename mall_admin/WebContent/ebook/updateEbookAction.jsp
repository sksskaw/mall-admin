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
	
	Ebook ebook = new Ebook();
	ebook.setEbookNo(Integer.parseInt(request.getParameter("ebookNo")));
	
	ebook.setEbookISBN(request.getParameter("ebookISBN"));
	ebook.setCategoryName(request.getParameter("categoryName"));
	ebook.setEbookTitle(request.getParameter("ebookTitle"));
	ebook.setEbookAuthor(request.getParameter("ebookAuthor"));
	ebook.setEbookCompany(request.getParameter("ebookCompany"));
	ebook.setEbookPageCount(Integer.parseInt(request.getParameter("ebookPageCount")));
	ebook.setEbookPrice(Integer.parseInt(request.getParameter("ebookPrice")));
	ebook.setEbookSummary(request.getParameter("ebookSummary"));
	ebook.setEbookState(request.getParameter("ebookState"));
	
	ebook.ebookVarPrint();
	EbookDao.updateEbook(ebook);
	response.sendRedirect(request.getContextPath()  + "/ebook/ebookOne.jsp?ebookNo=" + ebook.getEbookNo());
%>