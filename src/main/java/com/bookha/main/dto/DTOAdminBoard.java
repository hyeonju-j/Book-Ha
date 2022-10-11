package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTOAdminBoard {
	private int seq;
	private int user_num;
	private String subject;
	private String content;
	private String wdate;
	private String wgap;
	private int rowno;
	private String user_nickname;
	private String user_mail;
	private String user_name;
	private String user_phonenumber;
}