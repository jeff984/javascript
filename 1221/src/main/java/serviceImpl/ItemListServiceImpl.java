package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ItemListDao;
import searchCriteria.Search;
import service.ItemListService;
import vo.ItemListVO;

@Service
public class ItemListServiceImpl implements ItemListService {

	@Autowired
	ItemListDao dao;

//	@Override
//	public List<ItemListVO> list() {
//		return dao.list();
//	}

	@Override
	public String newitemcd() {
		return dao.newitemcd();
	}

	@Override
	public List<ItemListVO> categorylist(String upcd) {
		return dao.categorylist(upcd);
	}

	@Override
	public List<ItemListVO> list(ItemListVO ivo) {
		return dao.list(ivo);
	}

	@Override
	public int insert(ItemListVO ivo) {
		return dao.insert(ivo);
	}

	@Override
	public int update(ItemListVO ivo) {
		return dao.update(ivo);
	}

	
}
