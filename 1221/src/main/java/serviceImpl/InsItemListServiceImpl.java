package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.InsItemListDao;
import service.InsItemListService;
import vo.InsItemListVO;
import vo.ItemListVO;

@Service
public class InsItemListServiceImpl implements InsItemListService{
	
	@Autowired
	InsItemListDao dao;

	@Override
	public int insamtplus(ItemListVO ivo) {
		return dao.insamtplus(ivo);
	}

	@Override
	public int insert(InsItemListVO invo) {
		return dao.insert(invo);
	}

	@Override
	public List<ItemListVO> list() {
		return dao.list();
	}

	@Override
	public int totalupdate(ItemListVO ivo) {
		return dao.totalupdate(ivo);
	}

	@Override
	public int insupdate(ItemListVO ivo) {
		return dao.insupdate(ivo);
	}

}
