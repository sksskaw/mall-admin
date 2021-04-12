package gdu.mall.dao;

import java.sql.*;
import java.util.ArrayList;
import gdu.mall.util.DBUtil;
import gdu.mall.vo.Client;

public class ClientDao {
	
	//고객 정보 제거 메서드
	public static void deleteClient(int clientNo) throws Exception {
		String sql="DELETE FROM client WHERE client_no = ?";
		
		//DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		System.out.println("deleteClient stmt : "+stmt);
		
		stmt.setInt(1, clientNo);
		
		stmt.executeUpdate();
	}
	
	//고객 정보 수정 메서드
	public static void updateClient(Client client) throws Exception {
		
		String sql="UPDATE client SET client_mail=? WHERE client_no=? AND client_pw=PASSWORD(?)";
		
		//DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		System.out.println("updateClient stmt : "+stmt);
		
		stmt.setString(1, client.getClientMail());
		stmt.setInt(2, client.getClientNo());
		stmt.setString(3, client.getClientPw());
		
		stmt.executeUpdate();
	}
	
	//고객 정보 수정을 위한 해당 고객 정보 가져오기
	public static Client selectClientOne(int clientNo) throws Exception {
		
		String sql="SELECT client_no clientNo, client_mail clientMail, client_pw clientPw FROM client WHERE client_no = ?";
		
		//DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);

		// 디버깅
		System.out.println("selectClientOne stmt : "+stmt);
		
		stmt.setInt(1, clientNo);
		ResultSet rs = stmt.executeQuery();
		
		Client c = new Client();
		
		if(rs.next()) {
			c.setClientNo(rs.getInt("clientNo"));
			c.setClientMail(rs.getString("clientMail"));
			c.setClientPw(rs.getString("clientPw"));
		}
		
		return c;
	}

	// 천체 행 수 가져오기
	public static int totalCount(String searchWord) throws Exception {
		
		String sql = "";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		int totalRow = 0;
		
		if(searchWord.equals("")) {
			sql = "SELECT COUNT(*) FROM client";
			stmt = conn.prepareStatement(sql);
		} else {
			sql = "SELECT COUNT(*) FROM client WHERE client_mail LIKE ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+searchWord+"%");
		}
		System.out.println("totalCount "+conn);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			totalRow = rs.getInt("count(*)");
		}
		
		return totalRow;
	}
	
	// 리스트 정보 가져오기
	public static ArrayList<Client> selectClientListByPage(int rowPerPage, int beginRow, String searchWord) throws Exception{
		// 검색 기능을 위한 동적 쿼리
		// 동적 쿼리를 위한 변수, 객체 초기화
		String sql="";
		ArrayList<Client> list = new ArrayList<Client>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;

		if(searchWord.equals("")) { // 검색어가 없을 때
			
			sql="SELECT client_no clientNo, client_mail clientMail, client_date clientDate FROM client ORDER BY client_date DESC LIMIT ?, ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
		} else { // 검색어가 있을 때
			
			sql="SELECT client_no clientNo, client_mail clientMail, client_date clientDate FROM client WHERE client_mail like ? ORDER BY client_date DESC LIMIT ?, ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+searchWord+"%");
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
		}
		// 디버깅
		System.out.println("selectClientListByPage stmt : "+stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Client c = new Client();
			c.setClientNo(rs.getInt("clientNo"));
			c.setClientMail(rs.getString("clientMail"));
			c.setClientDate(rs.getString("clientDate"));
			list.add(c);
		}
		
		return list;
	}
}