package vo;

public class ItemListVO {

	private String itemcd;
	private String itemname;
	private String madenmcd;
	private String itemunitcd;
	private int stockamt;
	private String stockyn;
	private String insuser;
	private String insdate;
	private String useyn;
	private String itemclscd;
	private String madename;
	private String itemunit;
	private int insamt;
	private String insitemlistcd;
	private int beforeinsamt;
	
	
	
	public int getBeforeinsamt() {
		return beforeinsamt;
	}
	public void setBeforeinsamt(int beforeinsamt) {
		this.beforeinsamt = beforeinsamt;
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
	public String getMadename() {
		return madename;
	}
	public void setMadename(String madename) {
		this.madename = madename;
	}
	public String getItemunit() {
		return itemunit;
	}
	public void setItemunit(String itemunit) {
		this.itemunit = itemunit;
	}
	public String getItemcd() {
		return itemcd;
	}
	public void setItemcd(String itemcd) {
		this.itemcd = itemcd;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getMadenmcd() {
		return madenmcd;
	}
	public void setMadenmcd(String madenmcd) {
		this.madenmcd = madenmcd;
	}
	public String getItemunitcd() {
		return itemunitcd;
	}
	public void setItemunitcd(String itemunitcd) {
		this.itemunitcd = itemunitcd;
	}
	public int getStockamt() {
		return stockamt;
	}
	public void setStockamt(int stockamt) {
		this.stockamt = stockamt;
	}
	public String getStockyn() {
		return stockyn;
	}
	public void setStockyn(String stockyn) {
		this.stockyn = stockyn;
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
	public String getItemclscd() {
		return itemclscd;
	}
	public void setItemclscd(String itemclscd) {
		this.itemclscd = itemclscd;
	}
	@Override
	public String toString() {
		return "ItemListVO [itemcd=" + itemcd + ", itemname=" + itemname + ", madenmcd=" + madenmcd + ", itemunitcd="
				+ itemunitcd + ", stockamt=" + stockamt + ", stockyn=" + stockyn + ", insuser=" + insuser + ", insdate="
				+ insdate + ", useyn=" + useyn + ", itemclscd=" + itemclscd + ", madename=" + madename + ", itemunit="
				+ itemunit + ", insamt=" + insamt + ", insitemlistcd=" + insitemlistcd + ", beforeinsamt="
				+ beforeinsamt + "]";
	}
	
	
}
