package com.com.com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.InsItemListService;
import vo.InsItemListVO;
import vo.ItemListVO;

@Controller
public class InsItemListController {

	@Autowired
	InsItemListService inservice;

	// update
	@RequestMapping(value = "insamtplus")
	public ModelAndView insamtplus(ModelAndView mv, ItemListVO ivo) {
		int insamtplus = inservice.insamtplus(ivo);
		if (insamtplus > 0) {
			mv.addObject("code", true);
		} else {
			mv.addObject("code", false);
		}
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "initeminsert")
	public ModelAndView initeminsert(ModelAndView mv, InsItemListVO invo) {
		int insert = inservice.insert(invo);
		if (insert > 0) {
			mv.addObject("code", true);
		} else {
			mv.addObject("code", false);
		}
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "insupdate")
	public ModelAndView insupdate(ModelAndView mv, ItemListVO ivo) {

		int insupdate = inservice.insupdate(ivo);
		if (insupdate > 0) {
			mv.addObject("code", true);
		} else {
			mv.addObject("code", false);
		}
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "totalupdate")
	public ModelAndView totalupdate(ModelAndView mv, ItemListVO ivo) {

		int totalupdate = inservice.totalupdate(ivo);
		if (totalupdate > 0) {
			mv.addObject("code", true);
		} else {
			mv.addObject("code", false);
		}
		mv.setViewName("jsonView");
		return mv;
	}

}
