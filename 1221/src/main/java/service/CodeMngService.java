package service;

import java.util.List;

import vo.CodeMngVO;

public interface CodeMngService {

	List<CodeMngVO> list();

	CodeMngVO detail(String cdno);

	int countUp();

	String newcode();

	int insert(CodeMngVO cvo);

	int update(CodeMngVO cvo);

	

}
