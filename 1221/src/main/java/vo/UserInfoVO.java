package vo;

public class UserInfoVO {

	private String id;
	private String pass;
	private String name;
	private String insdate;
	private String useyn;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInsdate() {
		return insdate;
	}
	public void setInsdate(String insdate) {
		this.insdate = insdate;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	@Override
	public String toString() {
		return "UserInfoVO [id=" + id + ", pass=" + pass + ", name=" + name + ", insdate=" + insdate + ", useyn="
				+ useyn + "]";
	}
}
