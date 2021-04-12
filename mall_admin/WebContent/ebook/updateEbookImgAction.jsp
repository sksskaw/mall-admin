<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.dao.*"%>
<%@ page import="gdu.mall.vo.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	//관리자 인증 코드
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//img 폴더의 실제 데스크탑 경로
	//String path = application.getRealPath("img");
	String path = "D:\\goodee\\web\\mall_admin\\WebContent\\img";
	System.out.println("path : " + path);
	
	//파일 다운로드
	int size = 1024 * 1024 * 100;
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	
	int ebookNo = Integer.parseInt(multi.getParameter("ebookNo"));
	String ebookImg = multi.getFilesystemName("ebookImg");
	System.out.println("ebookNo " + ebookNo + " ebookImg " + ebookImg);
	
	Ebook ebook = new Ebook();
	ebook.setEbookNo(ebookNo);
	ebook.setEbookImg(ebookImg);
	
	EbookDao.updateEbookImg(ebook);
	
	response.sendRedirect(request.getContextPath() + "/ebook/ebookOne.jsp?ebookNo="+ebookNo);
%>
