package com.bookha.main.controller;

import com.bookha.main.dao.DAOAccount;
import com.bookha.main.dto.DTOUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping(value="account")
public class ControllerAccount {
	
	@Autowired
	DAOAccount dao_Account;
	
	@GetMapping("/user_account_setting")
	public ModelAndView userAccountSetting(ModelAndView mav) {
		mav.setViewName("mypage/user_account_setting");
		
		return mav;
	}
	
	@PostMapping("/update")
	public DTOUser updateAccount(@RequestBody DTOUser user) {
		dao_Account.updateAccount(user);
		return user;
	}
	
	
	@PostMapping("/delete")
	public DTOUser deleteAccount(@RequestBody DTOUser user, HttpSession session) {
		dao_Account.deleteAccount(user);

		session.setAttribute("login", false);
		
		session.setAttribute("user_num", 0);
		session.setMaxInactiveInterval(0);
		
		return user;
		
	}
	
	@PostMapping("/delete_kakao")
	public DTOUser deleteKakaoAccount(@RequestBody DTOUser user, HttpSession session) {
		dao_Account.deleteKakaoAccount(user);

		session.setAttribute("login", false);
		
		session.setAttribute("user_num", 0);
		session.setMaxInactiveInterval(0);
		
		return user;
		
	}
}
