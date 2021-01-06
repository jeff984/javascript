package vo;

public class InsItemListVO {

	private String itemcd;
	private String insitemlistcd; 
	private int insamt;
	private String insdate;
	private String insuser;
	public String getItemcd() {
		return itemcd;
	}
	public void setItemcd(String itemcd) {
		this.itemcd = itemcd;
	}
	public String getInsitemlistcd() {
		return insitemlistcd;
	}
	public void setInsitemlistcd(String insitemlistcd) {
		this.insitemlistcd = insitemlistcd;
	}
	public int getInsamt() {
		return insamt;
	}
	public void setInsamt(int insamt) {
		this.insamt = insamt;
	}
	public String getInsdate() {
		return insdate;
	}
	public void setInsdate(String insdate) {
		this.insdate = insdate;
	}
	public String getInsuser() {
		return insuser;
	}
	public void setInsuser(String insuser) {
		this.insuser = insuser;
	}
	
	@Override
	public String toString() {
		return "InsItemListVO [itemcd=" + itemcd + ", insitemlistcd=" + insitemlistcd + ", insamt=" + insamt
				+ ", insdate=" + insdate + ", insuser=" + insuser + "]";
	}
	
	
}
