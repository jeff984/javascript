package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.EmpDao;
import service.EmpService;
import vo.EmpVO;
import vo.UserInfoVO;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	EmpDao dao;

	@Override
	public List<EmpVO> list() {
		return dao.list();
	}

	@Override
	public UserInfoVO detail(String id) {
		return dao.detail(id);
	}

	@Override
	public int insert(UserInfoVO uv) {
		return dao.insert(uv);
	}
	
	

	
}
