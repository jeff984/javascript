package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CodeMngDao;
import service.CodeMngService;
import vo.CodeMngVO;

@Service
public class CodeMngServiceImpl implements CodeMngService{

	@Autowired
	CodeMngDao dao;

	@Override
	public List<CodeMngVO> list() {
		return dao.list();
	}

	@Override
	public CodeMngVO detail(String cdno) {
		return dao.detail(cdno);
	}

	@Override
	public int countUp() {
		return dao.countUp();
	}

	@Override
	public String newcode() {
		return dao.newcode();
	}

	@Override
	public int insert(CodeMngVO cvo) {
		return dao.insert(cvo);
	}

	@Override
	public int update(CodeMngVO cvo) {
		return dao.update(cvo);
	}

	
}
