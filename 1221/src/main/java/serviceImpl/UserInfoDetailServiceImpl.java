package serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserInfoDetailDao;
import service.UserInfoDetailService;
import vo.UserInfoDetailVO;

@Service
public class UserInfoDetailServiceImpl implements UserInfoDetailService {
	
	@Autowired
	UserInfoDetailDao dao;

	@Override
	public int insert(UserInfoDetailVO udv) {
		return dao.insert(udv);
	}
	
	

}
