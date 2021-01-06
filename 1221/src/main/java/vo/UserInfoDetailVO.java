package vo;

public class UserInfoDetailVO {

	private String id;
	private String userinfodetailcd;
	private String relcd;
	private int addrcd;
	private String addrname;
	private String mobiletelno;
	private String hometelno;
	private String insuser;
	private String insdate;
	private String useyn;
	private String delivname;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserinfodetailcd() {
		return userinfodetailcd;
	}
	public void setUserinfodetailcd(String userinfodetailcd) {
		this.userinfodetailcd = userinfodetailcd;
	}
	public String getRelcd() {
		return relcd;
	}
	public void setRelcd(String relcd) {
		this.relcd = relcd;
	}
	public int getAddrcd() {
		return addrcd;
	}
	public void setAddrcd(int addrcd) {
		this.addrcd = addrcd;
	}
	public String getAddrname() {
		return addrname;
	}
	public void setAddrname(String addrname) {
		this.addrname = addrname;
	}
	public String getMobiletelno() {
		return mobiletelno;
	}
	public void setMobiletelno(String mobiletelno) {
		this.mobiletelno = mobiletelno;
	}
	public String getHometelno() {
		return hometelno;
	}
	public void setHometelno(String hometelno) {
		this.hometelno = hometelno;
	}
	public String getInsuser() {
		return insuser;
	}
	public void setInsuser(String insuser) {
		this.insuser = insuser;
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
	public String getDelivname() {
		return delivname;
	}
	public void setDelivname(String delivname) {
		this.delivname = delivname;
	}
	
	@Override
	public String toString() {
		return "UserInfoDetail [id=" + id + ", userinfodetailcd=" + userinfodetailcd + ", relcd=" + relcd + ", addrcd="
				+ addrcd + ", addrname=" + addrname + ", mobiletelno=" + mobiletelno + ", hometelno=" + hometelno
				+ ", insuser=" + insuser + ", insdate=" + insdate + ", useyn=" + useyn + ", delivname=" + delivname
				+ "]";
	}
	
}
