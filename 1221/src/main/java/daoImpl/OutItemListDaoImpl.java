package daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.OutItemListDao;
import vo.OutItemListVO;

@Repository
public class OutItemListDaoImpl implements OutItemListDao{

	@Autowired
	SqlSession sqlsession;
	
	private static final String NameSpace = "com.mappers.outitemlistMapper.";

	@Override
	public List<OutItemListVO> list() {
		return sqlsession.selectList(NameSpace+"list");
	}

//	@Override
//	public int insert(OutItemListVO ov) {
//		return sqlsession.insert(NameSpace+"insert",ov);
//	}

	@Override
	public int update(OutItemListVO ov) {
		return sqlsession.update(NameSpace+"update",ov);
	}
	
	
	
}
