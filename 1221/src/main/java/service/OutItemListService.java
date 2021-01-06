package service;

import java.util.List;

import vo.OutItemListVO;

public interface OutItemListService {

	List<OutItemListVO> list();

//	int insert(OutItemListVO ov);

	int update(OutItemListVO ov);

}
