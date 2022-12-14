package com.bookha.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookha.main.dto.DTOUser;


@Mapper
public interface MapperUser {
	void userJoin(DTOUser user);
	
	void kakaoUserJoin(DTOUser user);
	
	List<Map<String, String>> userSignIn(DTOUser user);
	
	String chkSameId(String string);
	
	String chkSameNickname(String string);
	
	List<Map<String, String>> findUserId(DTOUser user);
	
	Map<String, String> findPw(DTOUser user);
	
	void deleteAccount(DTOUser user);
	
	void deleteKakaoAccount(DTOUser user);
	
	void updateAccount(DTOUser user);
	
	DTOUser userSetting(int user_num );
	
	int changeProfile(DTOUser user);
	
	int adminNum();
	
	public int checkNickname(String user_nickname);
	
	public int checkId(String user_mail);
	
	public int checkKakaoId(String user_mail);
	
	public int lastUserNum();
}
