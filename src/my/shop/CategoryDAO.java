package my.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import my.member.MemberDAO;

public class CategoryDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	private static CategoryDAO per;

	public static CategoryDAO getInstance() { //싱글톤패턴=객체로 호출할 때 생성자를 계속 만들 지 않고 하나만 만듬
		if(per == null) {
			per = new CategoryDAO();
		}
		return per;
	}

	private CategoryDAO() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 오류");
			e.printStackTrace();
		}
	}
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(url,dbid,dbpw);
			System.out.println("연결 성공");
		} catch (SQLException e) {
			System.out.println("연결 오류");
			e.printStackTrace();
		}

	}
	public int insertCategory(CategoryBean cbean) {
		getConnection();
		int cnt=-1;
		String sql="insert into category values(catseq.nextval,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,cbean.getCode());
			pstmt.setString(2,cbean.getCname());
			cnt=pstmt.executeUpdate();
			System.out.println("code="+cbean.getCode());
	}catch(Exception e) {
		System.out.println("sql오류");
	}finally {
		try {
		if(conn!=null) {
			conn.close();
		}
		if(pstmt!=null) {
			pstmt.close();
		}
		}catch(Exception e) {
			
		}
	}
		return cnt;
	}
	public ArrayList<CategoryBean> getAllCategory() {
		getConnection();
		ArrayList<CategoryBean> lists=new ArrayList<CategoryBean>();
		String sql="select * from category order by cnum asc";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CategoryBean cbean=new CategoryBean();
				cbean.setCnum(rs.getInt("cnum"));
				cbean.setCode(rs.getString("code"));
				cbean.setCname(rs.getString("cname"));
				lists.add(cbean);     
			}
	}catch(Exception e) {
		System.out.println("sql오류");
	}finally {
		try {
		if(conn!=null) {
			conn.close();
		}
		if(pstmt!=null) {
			pstmt.close();
		}
		if(rs!=null) {
			rs.close();
		}
		}catch(Exception e) {
			
		}
	}
		return lists;
	}
	public int deleteCategory(int cnum) {
		getConnection();
		int cnt=-1;
		ArrayList<CategoryBean> lists=new ArrayList<CategoryBean>();
		String sql="delete from category where cnum=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,cnum);
			cnt=pstmt.executeUpdate();
			
	}catch(Exception e) {
		System.out.println("sql오류");
	}finally {
		try {
		if(conn!=null) {
			conn.close();
		}
		if(pstmt!=null) {
			pstmt.close();
		}
		
		}catch(Exception e) {
			
		}
	}
		return cnt;
	
	}

}
