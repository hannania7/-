package my.shop.mall;

public class OrdersBean {
	private String mname; //고객명
	private String mid; //고객아이디
	private String pname; //상품명
	private int qty; //수량
	private int amount; //전체가격
	
	
	
	
	
	
	public OrdersBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
