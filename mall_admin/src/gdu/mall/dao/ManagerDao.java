package gdu.mall.dao;
import gdu.mall.util.DBUtil;
import gdu.mall.vo.Manager;
import java.sql.*;
import java.util.ArrayList;

public class ManagerDao {
	
	//
	public static ArrayList<Manager> selectManagerListByZero() throws Exception {

		String sql="select manager_no managerNo, manager_id managerId, manager_date managerDate from manager where manager_level=0 order by manager_date desc limit 5";
		ArrayList<Manager> list = new ArrayList<Manager>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);

		System.out.println("selectManagerListByZero stmt : "+stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Manager m = new Manager();
			m.setManagerNo(rs.getInt("managerNo"));
			m.setManagerId(rs.getString("managerId"));
			m.setManagerDate(rs.getString("managerDate"));
			list.add(m);
		}
		return list;
	}
	
	// 천체 행 수 가져오기
	public static int totalCount(String searchWord) throws Exception {
		
		String sql = "";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		int totalRow = 0;
		
		if(searchWord.equals("")) {
			sql = "SELECT COUNT(*) FROM manager";
			stmt = conn.prepareStatement(sql);
		} else {
			sql = "SELECT COUNT(*) FROM manager WHERE manager_id LIKE ?";
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
	
	//관리자 삭제를 위한 메서드
	public static void deleteManager(int managerNo) throws Exception {
		String sql="DELETE FROM manager WHERE manager_no = ?";
		
		// DB연결
		Connection conn = DBUtil.getConnection();
		System.out.println("deleteManager "+conn);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, managerNo);
		
		stmt.executeUpdate();
	}
	
	//관리자 레벨 수정을 위한 메서드
	public static void updateManagerLevel(int managerNo, int managerLevel) throws Exception {
		String sql="UPDATE manager SET manager_level = ? WHERE manager_no = ?";
		
		// DB연결
		Connection conn = DBUtil.getConnection();
		System.out.println("updateManagerLevel "+conn);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, managerLevel);
		stmt.setInt(2, managerNo);
		
		stmt.executeUpdate();
		
	}
	
	//목록 메서드
	public static ArrayList<Manager> selectManagerList(int rowPerPage, int beginRow, String searchWord) throws Exception{
		// 검색 기능을 위한 동적 쿼리
		// 동적 쿼리를 위한 변수, 객체 초기화
		String sql="";
		ArrayList<Manager> list = new ArrayList<Manager>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		
		if(searchWord.equals("")) { // 검색어가 없을 때
			
			sql="SELECT manager_No managerNo, manager_id managerId, manager_name managerName, manager_date managerDate, manager_level managerLevel FROM manager order by manager_level DESC, manager_date ASC limit ?,?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
		} else { // 검색어가 있을 때
			
			sql="SELECT manager_No managerNo, manager_id managerId, manager_name managerName, manager_date managerDate, manager_level managerLevel FROM manager WHERE manager_name like ? order by manager_level DESC, manager_date ASC limit ?,?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+searchWord+"%");
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
		}
		
		System.out.println("selectManagerList stmt : "+stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Manager m = new Manager();
			m.setManagerNo(rs.getInt("manager_No"));
			m.setManagerId(rs.getString("manager_id"));
			m.setManagerName(rs.getString("manager_name"));
			m.setManagerDate(rs.getString("manager_date"));
			m.setManagerLevel(rs.getInt("manager_level"));
			list.add(m);
		}
		
		return list;
	}
	
	
	// 입력 메서드
	public static int insertManager(String managerId, String managerPw, String managerName) throws Exception {
		String sql = "INSERT INTO manager(manager_id, manager_pw, manager_name, manager_date,manager_level) VALUES(?,?,?,now(),0)";
		
		int rowCnt = 0; //입력성공시 1, 실패 0
		
		Connection conn = DBUtil.getConnection();
		
		//디버깅
		System.out.println("insertManager "+conn);
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, managerId);
		stmt.setString(2, managerPw);
		stmt.setString(3, managerName);
		rowCnt = stmt.executeUpdate();

		return rowCnt;
	}
	
	// id 중복체크 메서드
	public static String selectManagerId(String managerId) throws Exception {
		String sql = "SELECT manager_id FROM manager WHERE manager_id = ?";
		String returnManagerId = null;
		
		Connection conn = DBUtil.getConnection();
		
		//디버깅
		System.out.println("selectManagerId "+conn);
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, managerId);
		ResultSet rs = stmt.executeQuery();		
		if(rs.next()) {
			returnManagerId = rs.getString("manager_id");
		}
		return returnManagerId;
	}
	
	// 로그인 메서드
	public static Manager login(String managerId, String managerPw) throws Exception {
		String sql = "SELECT manager_id, manager_name, manager_level FROM manager WHERE manager_id=? AND manager_pw=? AND manager_level>0";
		Manager manager = null;
		
		Connection conn = DBUtil.getConnection();
		
		//디버깅
		System.out.println("login "+conn);
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, managerId);
		stmt.setString(2, managerPw);
		System.out.println(stmt + " <--login() sql");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			manager = new Manager();
			manager.setManagerId(rs.getString("manager_id"));
			manager.setManagerName(rs.getString("manager_name"));
			manager.setManagerLevel(rs.getInt("manager_level"));
		}
		return manager;
	}
	
}