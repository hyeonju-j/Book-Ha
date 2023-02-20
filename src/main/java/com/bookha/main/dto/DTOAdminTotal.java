package com.bookha.main.dto;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DTOAdminTotal {
	private int cpage;
	private int recordPerPage;
	private int blockPerPage;
	private int totalPage;
	private int totalRecord;
	private int startBlock;
	private int endBlock;
	
	private int skip;
	
	private String searchName;
	
	private ArrayList<DTOAdminBoard> board;
	
	public DTOAdminTotal() {
		// TODO Auto-generated constructor stub
		this.cpage = 1;
		this.recordPerPage = 10;
		this.blockPerPage = 5;
		this.totalPage = 1;
		this.totalRecord = 0;
		
		this.searchName = "";
	}
}