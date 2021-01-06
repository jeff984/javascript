package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OutItemListDao;
import service.OutItemListService;
import vo.OutItemListVO;

@Service
public class OutItemListServiceImpl implements OutItemListService {

	@Autowired
	OutItemListDao dao;

	@Override
	public List<OutItemListVO> list() {
		return dao.list();
	}

//	@Override
//	public int insert(OutItemListVO ov) {
//		return dao.insert(ov);
//	}

	@Override
	public int update(OutItemListVO ov) {
		return dao.update(ov);
	}
}
