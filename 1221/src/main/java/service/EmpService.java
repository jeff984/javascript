package service;

import java.util.List;

import vo.EmpVO;
import vo.UserInfoVO;

public interface EmpService {

	List<EmpVO> list();

	UserInfoVO detail(String id);

	int insert(UserInfoVO uv);


}
