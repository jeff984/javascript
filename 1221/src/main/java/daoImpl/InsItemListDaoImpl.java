package daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.InsItemListDao;
import vo.InsItemListVO;
import vo.ItemListVO;

@Repository
public class InsItemListDaoImpl implements InsItemListDao{
	
	@Autowired
	SqlSession sqlsession;
	
	private static final String NameSpace = "com.mappers.insitemlistMapper.";

	@Override
	public int insamtplus(ItemListVO ivo) {
		return sqlsession.update(NameSpace+"insamtplus",ivo);
	}

	@Override
	public int insert(InsItemListVO invo) {
		return sqlsession.insert(NameSpace+"insert",invo);
	}

	@Override
	public List<ItemListVO> list() {
		return sqlsession.selectList(NameSpace+"list");
	}

	@Override
	public int totalupdate(ItemListVO ivo) {
		return sqlsession.update(NameSpace+"totalupdate",ivo);
	}

	@Override
	public int insupdate(ItemListVO ivo) {
		return sqlsession.update(NameSpace+"insupdate",ivo);
	}


}
