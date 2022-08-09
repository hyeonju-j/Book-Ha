package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTO_Review_Board;
import com.bookha.main.dto.DTO_Review_Comment;

@Mapper
@Repository
public interface Mapper_Review {
	// Board
	ArrayList<DTO_Review_Board> list();
	
	DTO_Review_Board view(int seq);
	
	void view_Hit(int seq);
	
	int write_ok(DTO_Review_Board to);
	
	DTO_Review_Board modify(DTO_Review_Board to);
	
	int modify_ok(DTO_Review_Board to);
	
	int delete_ok(DTO_Review_Board to);
	
	// comment
	ArrayList<DTO_Review_Comment> comment_list(int board_seq);
	
	DTO_Review_Comment comment_write(DTO_Review_Comment to);
}