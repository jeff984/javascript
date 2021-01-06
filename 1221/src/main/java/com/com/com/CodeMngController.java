package com.com.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.CodeMngService;
import vo.CodeMngVO;

@Controller
public class CodeMngController {

	@Autowired
	CodeMngService service;

	@RequestMapping(value = "codemng")
	public ModelAndView codemng(ModelAndView mv, CodeMngVO cvo) {

		// ������ ������ ����ؼ� list �̱�
		List<CodeMngVO> list = service.list();
		mv.addObject("list", list);

		// String newcode = service.newcode();
		// System.out.println("this is newcode::::::::::::::::::::"+newcode);
		// mv.addObject("newcode",newcode);

		mv.setViewName("codemng");
		return mv;
	}

	// @RequestMapping(value="codemngdetail")
	// public ModelAndView codemngdetail(ModelAndView mv, String cdno,CodeMngVO cvo)
	// {
	// cvo = service.detail(cdno);
	// System.out.println("cdno::::::::::::::::::::::::::"+cdno);
	// System.out.println("this is cvo::::::::::::::::::::::::::"+cvo);
	// if(cvo != null) {
	// mv.addObject("code",0);
	// mv.addObject("cvo",cvo);
	// }else {
	// mv.addObject("code",1);
	// }
	// mv.setViewName("codemng");
	// return mv;
	// }

	@RequestMapping(value = "newcode")
	public ModelAndView newcode(ModelAndView mv) {
		String newcode = service.newcode();
		mv.addObject("newcode", newcode);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "addcode")
	public ModelAndView addcode(ModelAndView mv, CodeMngVO cvo) {
		int insert = service.insert(cvo);
		if (insert > 0) {
			mv.addObject("code", true);
		} else {
			mv.addObject("code", false);
		}
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "uptcode")
	public ModelAndView uptcode(ModelAndView mv, CodeMngVO cvo) {
		int insert = service.update(cvo);
		if (insert > 0) {
			mv.addObject("code", true);
		} else {
			mv.addObject("code", false);
		}
		mv.setViewName("jsonView");
		return mv;
	}

}
