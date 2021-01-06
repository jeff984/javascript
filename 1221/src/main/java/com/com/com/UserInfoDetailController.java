package com.com.com;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.UserInfoDetailService;
import vo.UserInfoDetailVO;

@Controller
public class UserInfoDetailController {

	@Autowired
	UserInfoDetailService dservice;
	
	@RequestMapping(value="detail")
	public ModelAndView detail(ModelAndView mv) {
		mv.setViewName("detail");
		return mv;
	}
	
	@RequestMapping(value="userinfodetailinsert")
	public ModelAndView userinfodetailinsert(ModelAndView mv, UserInfoDetailVO udv, HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("logID");
		udv.setId(id);
		if(dservice.insert(udv)>0) {
			mv.addObject("code", 0);
		}else {
			mv.addObject("code", 1);
		}
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="calculator")
	public ModelAndView calculator(ModelAndView mv) {
		mv.setViewName("calculator");
		return mv;
	}
	
	@RequestMapping(value="calcJquery")
	public ModelAndView calcJquery(ModelAndView mv) {
		mv.setViewName("calcJquery");
		return mv;
	}
	
	
}
