package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTO_Review_Board;
import com.bookha.main.dto.DTO_Review_Total;

public class Model_ReviewList {
	public Model_ReviewList() {
		// TODO Auto-generated constructor stub
	}
	
	public String getReviewList(ArrayList<DTO_Review_Board> lists) {
		
		String model= "";
		for(DTO_Review_Board list : lists) {
			//System.out.println(list.getBook_img_url());
			//System.out.println(list.getBook_title());
			model+= "<tr>";
			model+= "<td><i class='fab fa-angular fa-lg text-danger me-2'></i>";
			model+= "<a href='./review_view.do?seq=" + list.getSeq() + "' style='color: gray'> <strong>[책 리뷰]&nbsp;&nbsp;</strong>" + list.getSubject() + "</a> &nbsp;&nbsp;";
			model+= "<span class='badge rounded-pill badge-center h-px-20 w-px-20 bg-danger'>3</span>";
			if(list.getWgap().equals("0")) {
				model+= "&nbsp;&nbsp;<span class='badge bg-info rounded-pill'>New</span>";
			}
			model+= "</td>";
			model+= "<td>";
			model+= "<ul class='list-unstyled users-list m-0 d-flex align-items-center'>";
			model+= "<div data-bs-toggle='tooltip' data-bs-placement='top' style='margin: auto; text-align: center;' data-bs-html='true' title='<img src=\"" + list.getBook_img_url() + "\" />'>";
			model+= list.getBook_title() + "</div>";
			model+= "</ul>";
			model+= "</td>";
			model+= "<td style='margin: auto; text-align: center;'>";
			model+= "<button type='button' class='btn rounded-pill btn-outline-primary'>" + list.getHash_tag() + "</button>";
			model+= "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getHit() + "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getUser_name() + "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getWdate() + "</td>";
			model+= "</tr>";
		}
		
		return model;
	}
}