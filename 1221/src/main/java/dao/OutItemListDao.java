package dao;

import java.util.List;

import vo.OutItemListVO;

public interface OutItemListDao {
	
	List<OutItemListVO> list();
	
//	int insert(OutItemListVO ov);
	
	int update(OutItemListVO ov);


}
