package daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.UserInfoDetailDao;
import vo.UserInfoDetailVO;

@Repository
public class UserInfoDetailDaoImpl implements UserInfoDetailDao {

	@Autowired
	SqlSession sqlsession;
	
	private static final String NameSpace = "com.mappers.userinfodetailMapper.";

	@Override
	public int insert(UserInfoDetailVO udv) {
		return sqlsession.insert(NameSpace+"insert",udv);
	}
	
	
	
	
}
