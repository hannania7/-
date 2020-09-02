package my.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.oreilly.servlet.MultipartRequest;


public class ProductDao {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	private static ProductDao per;

	public static ProductDao getInstance() { //싱글톤패턴=객체로 호출할 때 생성자를 계속 만들 지 않고 하나만 만듬
		if(per == null) {
			per = new ProductDao();
		}
		return per;
	}
	public ProductDao(){
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 실패");
		}
	}
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(url, dbid, dbpw);
		} catch (SQLException e) {
			System.out.println("연결 실패");
		}
	}

	public int insertProduct(MultipartRequest mr) {
		getConnection();
		int cnt=-1;

		String pname=mr.getParameter("pname");
		
		String pcategory_fk=mr.getParameter("pcategory_fk");
		pcategory_fk+=mr.getParameter("pcode");
		//pcategory_fk = pcategory_fk + pcode

		String pcompany=mr.getParameter("pcompany");
		String pimage=mr.getFilesystemName("pimage");
		int pqty=Integer.parseInt(mr.getParameter("pqty"));
		int price=Integer.parseInt(mr.getParameter("price"));
		String pspec=mr.getParameter("pspec");
		String pcontents=mr.getParameter("pcontents");
		int point=Integer.parseInt(mr.getParameter("point"));       

		String sql="insert into product(pnum,pname,pcategory_fk,pcompany,pimage,pqty,price,pspec,pcontents,point,pinputdate) values(catprod.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,pname);
			pstmt.setString(2,pcategory_fk);
			pstmt.setString(3,pcompany);
			pstmt.setString(4,pimage);
			pstmt.setInt(5,pqty);
			pstmt.setInt(6,price);
			pstmt.setString(7,pspec);
			pstmt.setString(8,pcontents);
			pstmt.setInt(9,point);

			Date d = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String today=sdf.format(d);
			pstmt.setString(10,today);
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
	public ArrayList<ProductBean> getAllProduct(){
		getConnection();
		ArrayList<ProductBean> lists=new ArrayList<ProductBean>();

		String sql="select * from product";
		try {
			pstmt=conn.prepareStatement(sql);

			rs=pstmt.executeQuery();

			lists=makeArrayList(rs);

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


	public ArrayList<ProductBean> makeArrayList(ResultSet rs){
		ArrayList<ProductBean> lists=new ArrayList<ProductBean>();
		try {
			while(rs.next()) {
				ProductBean bean=new ProductBean();
				bean.setPnum(rs.getInt("pnum"));
				bean.setPname(rs.getString("pname"));
				bean.setPcategory_fk(rs.getString("pcategory_fk"));
				bean.setPcompany(rs.getString("pcompany"));
				bean.setPimage(rs.getString("pimage"));
				bean.setPqty(rs.getInt("pqty"));
				bean.setPrice(rs.getInt("price"));
				bean.setPspec(rs.getString("pspec"));
				bean.setPcontents(rs.getString("pcontents"));
				bean.setPoint(rs.getInt("point"));
				bean.setPinputdate(rs.getString("pinputdate"));
				lists.add(bean);
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
	//상세보기, 수정form
	public ArrayList<ProductBean> getOneProduct(int pnum) {
		ArrayList<ProductBean> lists=new ArrayList<ProductBean>();
		getConnection();


		String sql="select * from product where pnum=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			rs=pstmt.executeQuery();

			lists=makeArrayList(rs);

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

	public int deleteProduct(int pnum) {
		getConnection();

		int cnt=-1;
		String sql="delete from product where pnum=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
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
	public int getUpdateProduct(MultipartRequest mr) {
		getConnection();

		int cnt=-1;

		String sql="update product set pname=?,pcategory_fk=?,pcompany=?,pimage=?,pqty=?,price=?,pspec=?,pcontents=?,point=? where pnum=?";
		try {
			pstmt=conn.prepareStatement(sql);
			String pname=mr.getParameter("pname");
			String pcategory_fk=mr.getParameter("pcategory_fk");
			String pcompany=mr.getParameter("pcompany");
			String pimage=mr.getFilesystemName("pimage");
			String old_pimage=mr.getParameter("old_pimage");
			if(pimage == null) { //새로 선택한 파일이 없다면,
				pimage = old_pimage; // 기존 이미지를 집어 넣는다.
			}
		
			int pqty=Integer.parseInt(mr.getParameter("pqty"));
			int price=Integer.parseInt(mr.getParameter("price"));
			String pspec=mr.getParameter("pspec");
			String pcontents=mr.getParameter("pcontents");
			int point=Integer.parseInt(mr.getParameter("point"));
			int pnum=Integer.parseInt(mr.getParameter("pnum"));
			
			
			pstmt.setString(1, pname);
			pstmt.setString(2, pcategory_fk);
			pstmt.setString(3, pcompany);
			pstmt.setString(4, pimage);
			pstmt.setInt(5, pqty);
			pstmt.setInt(6, price);
			pstmt.setString(7, pspec);    
			pstmt.setString(8, pcontents);
			pstmt.setInt(9, point);
			pstmt.setInt(10, pnum);
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

	public void updatePimage(int pnum) {
		getConnection();
		
		try {
			String sql="update product set pimage=null where pnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			pstmt.executeUpdate();

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




		}
	//"HIT","NEW","BEST","NORMAL"
	public ArrayList<ProductBean> getSelectBySpec(String spec){
		getConnection();
		ArrayList<ProductBean> lists=null;

		
		String sql="select * from product where pspec=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, spec);
			
			rs=pstmt.executeQuery();

			lists=makeArrayList(rs);

		}catch(Exception e) {
			System.out.println("sql오류");
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch(Exception e) {

			}
		}

		return lists;
	}
	public ArrayList<ProductBean> getSelectByCategory(String code){
		getConnection();
		ArrayList<ProductBean> lists=null;

		
		String sql="select * from product where PCATEGORY_FK like ?"; 
		
		try { 
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, code+"%"); // man%
			
			rs=pstmt.executeQuery();

			lists=makeArrayList(rs);

		}catch(Exception e) {
			System.out.println("sql오류");
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch(Exception e) {

			}
		}

		return lists;
	}
	
}

	






