package com.com.com;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.EmpService;
import vo.EmpVO;
import vo.UserInfoVO;

@Controller
public class EmpController {

	@Autowired
	EmpService service;
	
	@RequestMapping(value="empList")
	public ModelAndView empList(ModelAndView mv,EmpVO ev) {
		List<EmpVO> list = service.list();
		mv.addObject("list",list);
		mv.setViewName("empList");
		return mv;
	}
	
	@RequestMapping(value="loginf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("loginf");
		return mv;
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public ModelAndView login(ModelAndView mv,HttpServletRequest request, UserInfoVO uv, String id, String password) {
		//System.out.println("this is id ="+id);
		//System.out.println("this is password ="+password);
		uv = service.detail(id);
		
		
		if(uv==null) {
			mv.setViewName("loginf");
		//	System.out.println("1��");
		}else {
			if(!uv.getPass().toString().equals(password)) {
				//System.out.println("2��");
				//System.out.println(password);
				//System.out.println(uv.getPass());
				//System.out.println(password == uv.getPass());
				mv.setViewName("loginf");
			}else {
				//System.out.println("3��");
				request.getSession().setAttribute("logID", uv.getId());
				mv.setViewName("main");
				
			}
		}
		return mv;
	}
	
	@RequestMapping(value="main")
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value="inviteMember")
	public ModelAndView inviteMember(ModelAndView mv) {
		mv.setViewName("inviteMember");
		return mv;
	}
	
	
	
	//@ResponseBody
	@RequestMapping(value="idCheck")
	public ModelAndView idCheck(ModelAndView mv, String id,UserInfoVO uv) {
		uv = service.detail(id.toString());
		if(uv == null) {
			mv.addObject("result","true");
			System.out.println("�ߺ��ȵ�");
		}else {
			mv.addObject("result","false");
			System.out.println("�ߺ���");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="join")
	public ModelAndView join(ModelAndView mv, UserInfoVO uv) {
		if(service.insert(uv)>0) {
			mv.addObject("result", "true");
		}else {
			mv.addObject("result", "false");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
}
