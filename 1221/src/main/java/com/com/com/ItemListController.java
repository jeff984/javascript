package com.com.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.InsItemListService;
import service.ItemListService;
import vo.ItemListVO;

@Controller
public class ItemListController {

	@Autowired
	ItemListService iservice;
	
	@Autowired
	InsItemListService inservice;
	
	@RequestMapping(value="itemlistBackup")
	public ModelAndView itemlistBackup(ModelAndView mv) {
	
//		List<ItemListVO> list = iservice.list();
//		mv.addObject("list", list);
		mv.setViewName("itemlistBackup");
		return mv;
	}
	
	@RequestMapping(value="itemlist")
	public ModelAndView itemlist(ModelAndView mv,ItemListVO ivo) {
	
		List<ItemListVO> todayinslist = inservice.list();
		mv.addObject("todayinslist", todayinslist);
		mv.setViewName("itemlist");
		return mv;
	}
	
	@RequestMapping(value="getlist")
	public ModelAndView getlist(ModelAndView mv,ItemListVO ivo) {
		List<ItemListVO> getlist = iservice.list(ivo);
		mv.addObject("getlist", getlist);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping(value="newitemcd")
	public ModelAndView newitemcd(ModelAndView mv) {
		String newitemcd = iservice.newitemcd();
		mv.addObject("newitemcd", newitemcd);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/*@RequestMapping(value="categorylist")
	public ModelAndView categorylist(ModelAndView mv) {
		
		List<ItemListVO> categorylist = iservice.categorylist();
		mv.addObject("categorylist", categorylist);
		mv.setViewName("jsonView");
		return mv;
	}*/
	
	@RequestMapping(value="category")
	public ModelAndView category(ModelAndView mv,String upcd) {
		List<ItemListVO> categorylist = iservice.categorylist(upcd);
		mv.addObject("categorylist", categorylist);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="itemaddcode")
	public ModelAndView itemaddcode(ModelAndView mv, ItemListVO ivo) {
		int insert = iservice.insert(ivo);
		if(insert > 0 ) {
			mv.addObject("code",true);
		}else {
			mv.addObject("code",false);
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="itemuptcode")
	public ModelAndView itemuptcode(ModelAndView mv, ItemListVO ivo) {
		int insert = iservice.update(ivo);
		if(insert > 0 ) {
			mv.addObject("code",true);
		}else {
			mv.addObject("code",false);
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	
}
