package gdu.mall.dao;

import java.sql.*;
import java.util.ArrayList;

import gdu.mall.util.DBUtil;
import gdu.mall.vo.Ebook;

public class EbookDao {

	//오늘 들어온 책 추출
	public static ArrayList<Ebook> selectTodayInsertList() throws Exception {
		String sql="SELECT * FROM ebook WHERE DATE_FORMAT(ebook_date, \"%Y-%m-%d\") = CURDATE();";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		System.out.println("selectTodayInsertList "+stmt);
		
		ResultSet rs = stmt.executeQuery();
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		
		while(rs.next()) {
			Ebook e = new Ebook();
			e.setEbookNo(rs.getInt("ebook_no"));
			e.setCategoryName(rs.getString("category_name"));
			e.setEbookISBN(rs.getString("ebook_isbn"));
			e.setEbookTitle(rs.getString("ebook_title"));
			e.setEbookAuthor(rs.getString("ebook_author"));
			e.setEbookCompany(rs.getString("ebook_company"));
			e.setEbookImg(rs.getString("ebook_img"));
			e.setEbookDate(rs.getString("ebook_date"));
			e.setEbookPrice(rs.getInt("ebook_price"));
			list.add(e);
		}
		return list;
		
		
	}
	
	//ebook 이미지 제외 전체 데이터 수정 메서드
	public static void updateEbook(Ebook ebook) throws Exception {
		String sql = "UPDATE ebook SET ebook_isbn=?, category_name=?, ebook_title=?, ebook_author=?, ebook_company=?, ebook_page_count=?, ebook_price=?, ebook_summary=?, ebook_state=? WHERE ebook_No = ?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookISBN());
		stmt.setString(2, ebook.getCategoryName());
		stmt.setString(3, ebook.getEbookTitle());
		stmt.setString(4, ebook.getEbookAuthor());
		stmt.setString(5, ebook.getEbookCompany());
		stmt.setInt(6, ebook.getEbookPageCount());
		stmt.setInt(7, ebook.getEbookPrice());
		stmt.setString(8, ebook.getEbookSummary());
		stmt.setString(9, ebook.getEbookState());
		stmt.setInt(10, ebook.getEbookNo());
		
		System.out.println("updateEbook "+stmt);
		
		stmt.executeUpdate();
	}
	
	//ebook Summary 수정 메서드
		public static void updateEbookSummary(Ebook ebook) throws Exception {
			String sql = "UPDATE ebook SET ebook_Summary=? WHERE ebook_no = ?";
			
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, ebook.getEbookSummary());
			stmt.setInt(2, ebook.getEbookNo());
			System.out.println("updateEbookState "+stmt);
			
			stmt.executeUpdate();
		}
		
	//ebook 상태 수정 메서드
	public static void updateEbookState(Ebook ebook) throws Exception {
		String sql = "UPDATE ebook SET ebook_state=? WHERE ebook_no = ?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookState());
		stmt.setInt(2, ebook.getEbookNo());
		System.out.println("updateEbookState "+stmt);
		
		stmt.executeUpdate();
	}
	
	//ebook 데이터 삭제 메서드
	public static void deleteEbook(Ebook ebook) throws Exception {
		String sql = "DELETE FROM ebook WHERE ebook_no = ?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebook.getEbookNo());
		
		System.out.println("deleteEbook "+stmt);
		
		stmt.executeUpdate();
	}
	
	//ebook 이미지 수정 메서드
	public static void updateEbookImg(Ebook ebook) throws Exception {
		
		String sql = "UPDATE ebook SET ebook_img=? WHERE ebook_no = ?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookImg());
		stmt.setInt(2, ebook.getEbookNo());
		
		System.out.println("updateEbookImg "+stmt);
		stmt.executeUpdate();
	}
	
	//ebook 정보 가져오기
	public static Ebook ebookOne(Ebook ebook) throws Exception {
		String sql="SELECT * FROM ebook WHERE ebook_no = ?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ebook.getEbookNo());
		
		System.out.println("ebookOne "+stmt);
		
		ResultSet rs = stmt.executeQuery();
		Ebook e = new Ebook();
		
		if(rs.next()) {
			e.setEbookNo(rs.getInt("ebook_no"));
			e.setEbookISBN(rs.getString("ebook_isbn"));
			e.setCategoryName(rs.getString("category_name"));
			e.setEbookTitle(rs.getString("ebook_title"));
			e.setEbookAuthor(rs.getString("ebook_author"));
			e.setEbookCompany(rs.getString("ebook_company"));
			e.setEbookPageCount(rs.getInt("ebook_page_count"));
			e.setEbookPrice(rs.getInt("ebook_price"));
			e.setEbookImg(rs.getString("ebook_img"));
			e.setEbookSummary(rs.getString("ebook_summary"));
			e.setEbookDate(rs.getString("ebook_date"));
			e.setEbookState(rs.getString("ebook_state"));
		}
		return e;
	}
	
	//ebook 입력 메서드
	public static void insertEbook(Ebook ebook) throws Exception {
		String sql="INSERT INTO ebook(ebook_isbn, category_name, ebook_title, ebook_author, ebook_company, ebook_page_count, ebook_price, ebook_img, ebook_summary, ebook_date, ebook_state) VALUES(?,?,?,?,?,?,?,'default.jpg',?,NOW(),'판매중')";
		
		Connection conn = DBUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookISBN());
		stmt.setString(2, ebook.getCategoryName());
		stmt.setString(3, ebook.getEbookTitle());
		stmt.setString(4, ebook.getEbookAuthor());
		stmt.setString(5, ebook.getEbookCompany());
		stmt.setInt(6, ebook.getEbookPageCount());
		stmt.setInt(7, ebook.getEbookPrice());
		stmt.setString(8, ebook.getEbookSummary());
		
		System.out.println("insertEbook "+stmt);
		
		stmt.executeUpdate();
		
		return ;
	}
	
	// ebook 천체 행 수 가져오기
	public static int totalCount(String categoryName) throws Exception {
		
		String sql = "";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		int totalRow = 0;
		
		if(categoryName.equals("")) {
			sql = "SELECT COUNT(*) FROM ebook";
			stmt = conn.prepareStatement(sql);
		} else {
			sql = "SELECT COUNT(*) FROM ebook where category_name=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, categoryName);
		}
		System.out.println("totalCount "+stmt);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			totalRow = rs.getInt("count(*)");
		}
		
		return totalRow;
	}
	
	// 전체 ebook 정보 가져오기
	public static ArrayList<Ebook> selectEbookList(int rowPerPage, int beginRow, String categoryName) throws Exception {
		
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		
		if(categoryName.equals("")) { // 카테고리 전체인경우
			
			String sql="select * from ebook ORDER BY ebook_date DESC LIMIT ?,?";
			
			stmt = conn.prepareStatement(sql);
			System.out.println("selectCategoryList stmt : "+stmt);
			
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
		} else { // 카테고리 선택
			
			String sql="select * from ebook where category_name=? ORDER BY ebook_date DESC LIMIT ?,?";
			
			stmt = conn.prepareStatement(sql);
			System.out.println("selectCategoryList stmt : "+stmt);
			
			stmt.setString(1, categoryName);
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
		}
		
		ResultSet rs = stmt.executeQuery();
		ArrayList<Ebook> list = new ArrayList<Ebook>();
		
		while(rs.next()) {
			Ebook e = new Ebook();
			e.setEbookNo(rs.getInt("ebook_no"));
			e.setCategoryName(rs.getString("category_name"));
			e.setEbookISBN(rs.getString("ebook_isbn"));
			e.setEbookTitle(rs.getString("ebook_title"));
			e.setEbookAuthor(rs.getString("ebook_author"));
			e.setEbookDate(rs.getString("ebook_date"));
			e.setEbookPrice(rs.getInt("ebook_price"));
			list.add(e);
		}
		return list;
	}

}
