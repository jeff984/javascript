package com.com.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.OutItemListService;
import vo.OutItemListVO;

@Controller
public class OutItemListController {

	@Autowired
	OutItemListService service;
	
	@RequestMapping(value="outitemlist")
	public ModelAndView outitemlist(ModelAndView mv,OutItemListVO ov) {
		List<OutItemListVO> list = service.list();
		mv.addObject("list", list);
		mv.setViewName("outitemlist");
		return mv;
	}
	
//	@RequestMapping(value="outitemlistInsert")
//	public ModelAndView outitemlistInsert(ModelAndView mv, OutItemListVO ov) {
//		int insert = service.insert(ov);
//		if(insert > 0) {
//			mv.addObject("code", true);
//		}else {
//			mv.addObject("code", false);
//		}
//		mv.setViewName("jsonView");
//		return mv;
//	}
	
	@RequestMapping(value="itemlistUpdate")
	public ModelAndView itemlistUpdate(ModelAndView mv, OutItemListVO ov) {
		System.out.println("탄다");
		int update = service.update(ov);
		if(update >0) {
			mv.addObject("code",true);
		}else {
			mv.addObject("code",false);
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	
	
	
	
}
