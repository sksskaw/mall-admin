<%@page import="gdu.mall.vo.*"%>
<%@page import="gdu.mall.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션 검사
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	//수집
	Client client = new Client();
	client.setClientNo(Integer.parseInt(request.getParameter("clientNo")));
	client.setClientMail(request.getParameter("clientMail"));
	client.setClientPw(request.getParameter("clientPw"));
	
	//고객 정보 수정 메서드 호출
	ClientDao.updateClient(client);
	
	//고객 관리 리스트로 돌아가기
	response.sendRedirect(request.getContextPath()+"/client/clientList.jsp");
%>
