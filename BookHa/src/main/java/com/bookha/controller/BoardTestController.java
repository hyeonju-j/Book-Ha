package com.bookha.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class BoardTestController {

	@RequestMapping(value = "/review_list.do")
	public ModelAndView listTest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("review_board/board_list2");
		return mv;
	}
	
	@RequestMapping(value = "/review_write.do")
	public ModelAndView writeTest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("review_board/board_write2");
		return mv;
	}
	
	@RequestMapping(value = "/review_view.do")
	public ModelAndView viewTest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("review_board/board_view2");
		return mv;
	}
	
	@RequestMapping(value = "/share_list.do")
	public ModelAndView shareList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("share_board/board_list1");
		return mv;
	}
	
	@RequestMapping(value = "/share_write.do")
	public ModelAndView shareWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("share_board/board_write1");
		return mv;
	}
	
	@RequestMapping(value = "/share_view.do")
	public ModelAndView shareView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("share_board/board_view1");
		return mv;
	}
	
	@RequestMapping(value = "/admin_main.do")
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("admin_board/board_main1");
		return mv;
	}
	
	@RequestMapping(value = "/admin_list.do")
	public ModelAndView adminList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("admin_board/board_list1");
		return mv;
	}
	
	@RequestMapping(value = "/admin_write.do")
	public ModelAndView adminWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("admin_board/board_write1");
		return mv;
	}
	
	@RequestMapping(value = "/admin_view.do")
	public ModelAndView adminView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("admin_board/board_view1");
		return mv;
	}
	
	// 공지게시글 확인
	@RequestMapping(value = "/notice_view.do")
	public ModelAndView noticeView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("admin_board/board_notice1");
		return mv;
	}
	
}