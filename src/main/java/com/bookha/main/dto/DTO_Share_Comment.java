package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTO_Share_Comment {
	private int seq;
	private int user_num;
	private String content;
	private String wdate;
	private int board_seq;
}