package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.shop.ProductBean;


public class OrdersDao {
	//dbcp
	private DataSource ds; 
	Connection conn = null;
	
	public OrdersDao() {
		try {        
		Context initContext = new  InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		 
		conn=ds.getConnection(); 
		}catch(Exception e) {
			
		}
	}
	public int insertOrders(int no,Vector<ProductBean> cv) {
		PreparedStatement pstmt=null;
		int cnt=-1;
		String sql="insert into orders values(orderseq.nextval,?,?,?,?)";
		try {
			for(int i=0;i<cv.size();i++){
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,no);
				pstmt.setInt(2,cv.get(i).getPnum());
				pstmt.setInt(3,cv.get(i).getPqty());
				pstmt.setInt(4,cv.get(i).getTotalPrice());
				cnt += pstmt.executeUpdate();
				
			}

	}catch(Exception e) {
		System.out.println("sql오류");
	}finally {
		try {
			/*if(conn!=null) {
				conn.close();
			}*/ //안됨 이유는 conn연결이 아예 종료됨 그럼 담에 사용못함(연결설정을 다르게 했기 때문=메서드 호출로 안하고 생성자로 함)
			if(pstmt!=null) {
				pstmt.close();
			}
		}catch(Exception e) {

		}
	}
		
	return cnt;
	}//insertOrders;

	public Vector<OrdersBean> getOrderList(String memid){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Vector<OrdersBean> lists=new Vector<OrdersBean>();
		String sql= "select m.name mname, m.id mid, p.pname ppname,o.qty oqty, o.amount oamount" +
					" from (members m join orders o on m.no = o.memno)" +
					" join product p on o.pnum=p.pnum" +
					" where m.id = ?";
		try {
			
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, memid);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					OrdersBean bean=new OrdersBean();
					bean.setMname(rs.getString("mname"));
					bean.setMid(rs.getString("mid"));
					bean.setPname(rs.getString("ppname"));
					bean.setQty(rs.getInt("oqty"));
					bean.setAmount(rs.getInt("oamount"));
					
					lists.add(bean);
				}
			
		
		
		
		

	}catch(Exception e) {
		System.out.println("sql오류");
	}finally {
		try {
			/*if(conn!=null) {
				conn.close();
			}*/ //안됨 이유는 conn연결이 아예 종료됨 그럼 담에 사용못함(연결설정을 다르게 했기 때문=메서드 호출로 안하고 생성자로 함)
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