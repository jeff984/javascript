package daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.CodeMngDao;
import vo.CodeMngVO;

@Repository
public class CodeMngDaoImpl implements CodeMngDao {

	@Autowired
	SqlSession sqlsession;
	
	private static final String NameSpace = "com.mappers.codemngMapper.";

	@Override
	public List<CodeMngVO> list() {
		return sqlsession.selectList(NameSpace+"list");
	}

	@Override
	public CodeMngVO detail(String cdno) {
		return sqlsession.selectOne(NameSpace+"detail",cdno);
	}

	@Override
	public int countUp() {
		return sqlsession.update(NameSpace+"countUp");
	}

	@Override
	public String newcode() {
		return sqlsession.selectOne(NameSpace+"newcode");
	}

	@Override
	public int insert(CodeMngVO cvo) {
		return sqlsession.insert(NameSpace+"insert",cvo);
	}

	@Override
	public int update(CodeMngVO cvo) {
		return sqlsession.update(NameSpace+"update",cvo);
	}

	
	
	
	
	
	
}
