package my.shop;

public class CategoryBean {
	private int cnum;
	private String code;
	private String cname;
	
	public CategoryBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CategoryBean(int cnum, String code, String cname) {
		super();
		this.cnum = cnum;
		this.code = code;
		this.cname = cname;
	}

	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	
}
