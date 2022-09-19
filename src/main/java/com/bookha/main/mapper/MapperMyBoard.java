package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.dto.DTOAlbumTotal;
import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOReviewTotal;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareTotal;

@Mapper
@Repository
public interface MapperMyBoard {

	ArrayList<DTOShareBoard> myshareList(DTOShareTotal sto);
	
	int countMyshare(DTOShareTotal sto);
	
	ArrayList<DTOReviewBoard> myreviewList(DTOReviewTotal rto);
	
	int countMyreview(DTOReviewTotal rto);
	
	ArrayList<DTOAlbumBoard> myalbumList(DTOAlbumTotal ato);
	
	int countMyalbum(DTOAlbumTotal ato);
	
}
