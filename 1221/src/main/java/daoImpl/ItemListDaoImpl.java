package daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.ItemListDao;
import searchCriteria.Search;
import vo.ItemListVO;

@Repository
public class ItemListDaoImpl implements ItemListDao {

	@Autowired
	SqlSession sqlsession;
	
	private static final String NameSpace = "com.mappers.itemlistMapper.";

//	@Override
//	public List<ItemListVO> list() {
//		return sqlsession.selectList(NameSpace+"list");
//	}

	@Override
	public String newitemcd() {
		return sqlsession.selectOne(NameSpace+"newitemcd");
	}

	@Override
	public List<ItemListVO> categorylist(String upcd) {
		return sqlsession.selectList(NameSpace+"categorylist",upcd);
	}

	@Override
	public List<ItemListVO> list(ItemListVO ivo) {
		return sqlsession.selectList(NameSpace+"list",ivo);
	}

	@Override
	public int insert(ItemListVO ivo) {
		return sqlsession.insert(NameSpace+"insert",ivo);
	}

	@Override
	public int update(ItemListVO ivo) {
		return sqlsession.update(NameSpace+"update",ivo);
	}

	
	

}
