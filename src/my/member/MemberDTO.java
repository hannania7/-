package my.member;

public class MemberDTO {
	private int no;
	private String name;
	private String id;
	private String password;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private String joindate;
	private String add1;
	private String add2;
	private String add3;
	private String gp1;
	private String gp2;
	private String gp3;
	
	public String getGp3() {
		return gp3;
	}

	public void setGp3(String gp3) {
		this.gp3 = gp3;
	}

	public String getGp1() {
		return gp1;
	}

	public void setGp1(String gp1) {
		this.gp1 = gp1;
	}

	public String getGp2() {
		return gp2;
	}

	public void setGp2(String gp2) {
		this.gp2 = gp2;
	}

	public String getAdd1() {
		return add1;
	}

	public void setAdd1(String add1) {
		this.add1 = add1;
	}

	public String getAdd2() {
		return add2;
	}

	public void setAdd2(String add2) {
		this.add2 = add2;
	}

	public String getAdd3() {
		return add3;
	}

	public void setAdd3(String add3) {
		this.add3 = add3;
	}

	public MemberDTO(int no, String id) {
		super();
		this.no = no;
		this.id = id;
	}
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	
	public String getEmail() {
		return email;   
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
}
