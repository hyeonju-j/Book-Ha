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
}