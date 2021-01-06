package service;

import java.util.List;

import vo.InsItemListVO;
import vo.ItemListVO;

public interface InsItemListService {

	int insamtplus(ItemListVO ivo);

	int insert(InsItemListVO invo);

	List<ItemListVO> list();

	int totalupdate(ItemListVO ivo);

	int insupdate(ItemListVO ivo);


	 

}
