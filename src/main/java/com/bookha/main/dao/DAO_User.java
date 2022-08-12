package com.bookha.main.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookha.main.dto.DTO_User;
import com.bookha.main.mapper.Mapper_User;



@Service
public class DAO_User {

	@Autowired
	Mapper_User mapper_User;
	
	@Transactional
	public void userJoin(DTO_User user) {
		user.setUser_mail(user.getUser_mail());
		user.setUser_password(user.getUser_password());
		user.setUser_name(user.getUser_name());
		user.setUser_nickname(user.getUser_nickname());
		user.setUser_phonenumber(user.getUser_phonenumber());
		user.setUser_profile(null);
		user.setUser_profile_size(0);
		user.setUser_self(null);
		user.setUser_enterdate(user.getUser_enterdate());
		user.setUser_final(user.getUser_final());
		user.setUser_role(user.getUser_role());
		user.setUser_option(user.getUser_option());
		
		mapper_User.userJoin(user);
	}
	
	@Transactional
	public DTO_User signIn(DTO_User user) {
		user.setUser_mail(user.getUser_mail());
		user.setUser_password(user.getUser_password());
		
		if(!mapper_User.userSignIn(user).isEmpty()) {
			return user;
		}
		
		return null;
	}
	
	@Transactional
	public String chkSameId(DTO_User user) {
		if(user.getUser_mail().equals(mapper_User.chkSameId(user.getUser_mail()))) {
			return "0";
		}
		
		return "1";
	}
	
	@Transactional
	public String chkSameNickname(DTO_User user) {
		if(user.getUser_nickname().equals(mapper_User.chkSameNickname(user.getUser_nickname()))) {
			return "0";
		}
		
		return "1";
	}
	
	@Transactional
	public List<Map<String, String>> findUserId(DTO_User user) {
		
		return mapper_User.findUserId(user);
	}
	
	@Transactional
	public List<Map<String, String>> findPw(DTO_User user) {
		
		return mapper_User.findPw(user);
	}
}