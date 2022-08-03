package com.bookha.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class KakaoAPITestController {

	@RequestMapping("/searchBookData.do")
	public ModelAndView searchBook(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		mv.setViewName("kakao_api_test1");
		return mv;
	}
}