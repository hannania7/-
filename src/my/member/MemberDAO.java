package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import my.shop.CategoryBean;



public class MemberDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	private static MemberDAO per;

	public static MemberDAO getInstance() { //싱글톤패턴=객체로 호출할 때 생성자를 계속 만들 지 않고 하나만 만듬
		if(per == null) {
			per = new MemberDAO();
		}
		return per;
	}

	private MemberDAO() {
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
	public boolean searchID(String userid) {
		getConnection();
		boolean flag=false;
		String sql="select id from members where id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				flag=true;
			}
		}catch(SQLException e) {
			System.out.println("searchID sql오류");
		}finally{
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



			}catch(SQLException e) {

			}


		}


		return flag;
	}
	public int insertData(MemberDTO mbean) {
		getConnection();
		String sql = "insert into members values(memseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int cnt=-1;
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mbean.getName());
			pstmt.setString(2, mbean.getId());
			pstmt.setString(3, mbean.getPassword());
			pstmt.setString(4, mbean.getEmail());
			pstmt.setString(5, mbean.getHp1());
			pstmt.setString(6, mbean.getHp2());
			pstmt.setString(7, mbean.getHp3());
			pstmt.setString(8, mbean.getJoindate());
			pstmt.setString(9, mbean.getAdd1());
			pstmt.setString(10, mbean.getAdd2());
			pstmt.setString(11, mbean.getAdd3());
			pstmt.setString(12, mbean.getGp1());
			pstmt.setString(13, mbean.getGp2());
			pstmt.setString(14, mbean.getGp3());
       
			cnt=pstmt.executeUpdate();
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("insert sql오류");
		}finally{
			try{
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		return cnt;			
	}
	public MemberDTO getMemberByrrn(String name,String email) {
		
		
		getConnection();
		String sql = "select * from members where name=? and email=?";
		MemberDTO mdto=null;
		System.out.println("conn="+conn);
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			System.out.println("여기1");
			rs=pstmt.executeQuery();
			System.out.println("여기2");
			if(rs.next()) {
				System.out.println("여기3");   
				mdto=getMemberBean(rs);
				System.out.println("mdto="+mdto);
			}           
			
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("getMemberByrrn sql오류");
		}finally{
			try{
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
				if(rs!=null)
					rs.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		System.out.println("mdto"+mdto);
		return mdto;
	}
		
		public MemberDTO getMemberByIdAndName(String id,String name,String email) {
			getConnection();
			String sql = "select * from members where id=? and name=? and email=?";
			MemberDTO mdto=null;
			
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, email);
				
				System.out.println("여기1");
				rs=pstmt.executeQuery();
				System.out.println("여기2");
				if(rs.next()) {
					System.out.println("여기3");   
					mdto=getMemberBean(rs);
					System.out.println("mdto="+mdto);
				}          
				
				
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("getMemberByrrn sql오류");
			}finally{
				try{
					if(pstmt!=null)
						pstmt.close();
					if(conn!=null)
						conn.close();
					if(rs!=null)
						rs.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
			}
			return mdto;
		}
		public MemberDTO getMemberInfo(String id,String password) {
			getConnection();
			String sql = "select * from members where id=? and password=?";
			MemberDTO mdto=null;
			System.out.println("conn="+conn);
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				System.out.println("여기1");
				rs=pstmt.executeQuery();
				System.out.println("여기2");
				if(rs.next()) {
					System.out.println("여기3");   
					mdto=getMemberBean(rs);
					System.out.println("mdto="+mdto);
				}          
				
				 
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("getMemberByrrn sql오류");
			}finally{
				try{
					if(pstmt!=null)
						pstmt.close();
					if(conn!=null)
						conn.close();
					if(rs!=null)
						rs.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
			}
			
			return mdto;
		}
	
	private MemberDTO getMemberBean(ResultSet rs) {
		System.out.println("getMemberBean");
		MemberDTO mdto=null;
		try{
			mdto=new MemberDTO();
			mdto.setNo(rs.getInt("no"));
			mdto.setName(rs.getString("name"));
			mdto.setId(rs.getString("id"));
			mdto.setPassword(rs.getString("password"));
			mdto.setEmail(rs.getString("email"));
			mdto.setHp1(rs.getString("hp1"));
			mdto.setHp2(rs.getString("hp2"));
			mdto.setHp3(rs.getString("hp3"));
			mdto.setJoindate(rs.getString("joindate"));
			mdto.setAdd1(rs.getString("add1"));
			mdto.setAdd2(rs.getString("add2"));
			mdto.setAdd3(rs.getString("add3"));
			mdto.setGp1(rs.getString("gp1"));
			mdto.setGp2(rs.getString("gp2"));
			mdto.setGp3(rs.getString("gp3"));
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mdto;
	}
	
	public ArrayList<MemberDTO> getAllSelect(){
		getConnection();
		ArrayList<MemberDTO> lists=new ArrayList<MemberDTO>();
		String sql="select * from members";
		
		try {
			pstmt=conn.prepareStatement(sql);
			System.out.println("sql준비완료");
			rs=pstmt.executeQuery();
			System.out.println("실행성공");
			while(rs.next()) {      
				MemberDTO bean=new MemberDTO();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				bean.setId(rs.getString("id"));
				bean.setPassword(rs.getString("password"));
				bean.setEmail(rs.getString("email"));
				bean.setHp1(rs.getString("hp1"));
				bean.setHp2(rs.getString("hp2"));
				bean.setHp3(rs.getString("hp3"));
				bean.setJoindate(rs.getString("joindate"));
				bean.setAdd1(rs.getString("add1"));
				bean.setAdd2(rs.getString("add2"));
				bean.setAdd3(rs.getString("add3"));
				bean.setGp1(rs.getString("gp1"));
				bean.setGp2(rs.getString("gp2"));
				bean.setGp3(rs.getString("gp3"));
				lists.add(bean);     
			}      
			
	}catch(Exception e) {
		System.out.println("sql오류2");
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
	}





