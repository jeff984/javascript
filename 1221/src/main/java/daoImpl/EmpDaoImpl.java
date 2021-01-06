package daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.EmpDao;
import vo.EmpVO;
import vo.UserInfoVO;

@Repository
public class EmpDaoImpl implements EmpDao {

	@Autowired
	SqlSession sqlsession;
	
	private static final String NameSpace = "com.mappers.empMapper.";

	@Override
	public List<EmpVO> list() {
		return sqlsession.selectList(NameSpace+"list");
	}

	@Override
	public UserInfoVO detail(String id) {
		return sqlsession.selectOne(NameSpace+"detail",id);
	}

	@Override
	public int insert(UserInfoVO uv) {
		return sqlsession.insert(NameSpace+"insert",uv);
	}

	
	
	
	
	
	
	
}
