package service;

import java.util.List;

import searchCriteria.Search;
import vo.ItemListVO;

public interface ItemListService {

	//List<ItemListVO> list();

	String newitemcd();

	List<ItemListVO> categorylist(String upcd);

	List<ItemListVO> list(ItemListVO ivo);

	int insert(ItemListVO ivo);
	
	int update(ItemListVO ivo);

	

	

}
