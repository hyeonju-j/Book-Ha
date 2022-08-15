package com.bookha.main.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTO_Review_Board;
import com.bookha.main.dto.DTO_Review_Comment;
import com.bookha.main.mapper.Mapper_Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAO_Review_Board implements Mapper_Review {

	@Autowired
	private Mapper_Review mapper;

	@Override
	public ArrayList<DTO_Review_Board> listAll() {
		return mapper.listAll();
	}
	
	@Override
	public ArrayList<DTO_Review_Board> listHashTag(String hashTag) {
		return mapper.listHashTag(hashTag);
	}

	@Override
	public DTO_Review_Board view(int seq) {
		return mapper.view(seq);
	}
	
	@Override
	public void view_hit(int seq) {
		// TODO Auto-generated method stub
		mapper.view_hit(seq);
	}

	@Override
	public int write_ok(DTO_Review_Board to) {
		int flag = 1;
		int result = mapper.write_ok(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public DTO_Review_Board modify(DTO_Review_Board to) {
		// TODO Auto-generated method stub
		return mapper.modify(to);
	}

	@Override
	public int modify_ok(DTO_Review_Board to) {
		// TODO Auto-generated method stub
		return mapper.modify_ok(to);
	}

	@Override
	public int delete_ok(DTO_Review_Board to) {
		// TODO Auto-generated method stub
		
		int flag = 1;
		int result = mapper.delete_ok(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public ArrayList<DTO_Review_Comment> comment_list(int board_seq) {
		// TODO Auto-generated method stub
		return mapper.comment_list(board_seq);
	}

	@Override
	public int comment_write(DTO_Review_Comment to) {
		// TODO Auto-generated method stub
		return mapper.comment_write(to);
	}

	@Override
	public int comment_delete(int comment_seq) {
		// TODO Auto-generated method stub
		return mapper.comment_delete(comment_seq);
	}
}