package com.bookha.main.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOAttendance;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareTotal;
import com.bookha.main.dto.DTOUser;
import com.bookha.main.mapper.MapperMyPage;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAOMyPage implements MapperMyPage {

	@Autowired
	private MapperMyPage mapper;

	@Override
	public String checkAttendance(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.checkAttendance(user_num);
	}
	
	@Override
	public int addAttendance(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.addAttendance(user_num);
	}
	
	@Override
	public String addStamp() {
		// TODO Auto-generated method stub
		
		return mapper.addStamp();
	}
	
	@Override
	public ArrayList<DTOAttendance> listAt(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.listAt(user_num);
	}

	@Override
	public int countAttendance(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.countAttendance(user_num);
	}

	@Override
	public int countReview(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.countReview(user_num);
	}

	@Override
	public int countAlbum(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.countAlbum(user_num);
	}

	@Override
	public int countShare(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.countShare(user_num);
	}

	@Override
	public int checkPw(DTOUser dto) {
		// TODO Auto-generated method stub
		return mapper.checkPw(dto);
	}

	@Override
	public int changePf(DTOUser dto) {
		// TODO Auto-generated method stub
		return mapper.changePf(dto);
	}

	@Override
	public String reloadPf(int user_num) {
		// TODO Auto-generated method stub
		return mapper.reloadPf(user_num);
	}

	@Override
	public String pathKakao(int user_num) {
		// TODO Auto-generated method stub
		return mapper.pathKakao(user_num);
	}

}
