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
	
	String categoryName = request.getParameter("categoryName");
	
	if(categoryName.equals("")){
		System.out.println("카테고리를 선택해주세요! 필수 옵션입니다.");
		response.sendRedirect(request.getContextPath() + "/ebook/insertEbookForm.jsp");
		return;
	}
	
	Ebook ebook = new Ebook();
	ebook.setEbookISBN(request.getParameter("ebookISBN"));
	System.out.println("ebookISBN : "+ request.getParameter("ebookISBN")); //디버깅

	//중복 처리
	if(EbookDao.ebookOne(ebook).getEbookISBN() != null){
		System.out.println("ebookISBN값이 중복됩니다.");
		response.sendRedirect(request.getContextPath() + "/ebook/insertEbookForm.jsp");
		return;
	}
	
	
	
	
	ebook.setCategoryName(categoryName);
	//ebook.ebookISBN = request.getParameter("ebookISBN"); 위에서 중복처리하기 전에 미리 받음
	ebook.setEbookTitle(request.getParameter("ebookTitle"));
	ebook.setEbookAuthor(request.getParameter("ebookAuthor"));
	ebook.setEbookCompany(request.getParameter("ebookCompany"));
	ebook.setEbookPageCount(Integer.parseInt(request.getParameter("ebookPageCount")));
	ebook.setEbookPrice(Integer.parseInt(request.getParameter("ebookPrice")));
	ebook.setEbookSummary(request.getParameter("ebookSummary"));

	ebook.ebookVarPrint();  //디버깅
	
	//입력 메서드 호출
	EbookDao.insertEbook(ebook);
	
	response.sendRedirect(request.getContextPath() + "/ebook/ebookList.jsp");
%>