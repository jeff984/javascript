package dao;

import java.util.List;

import searchCriteria.Search;
import vo.ItemListVO;

public interface ItemListDao {
	
	//List<ItemListVO> list();
	
	String newitemcd();
	
	List<ItemListVO> categorylist(String upcd);
	
	List<ItemListVO> list(ItemListVO ivo);
	
	int insert(ItemListVO ivo);
	
	int update(ItemListVO ivo);
}
