package com.bookha.main.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOAdminBoard;
import com.bookha.main.dto.DTOAdminTotal;
import com.bookha.main.dto.DTOAttendance;
import com.bookha.main.mapper.MapperAdmin;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAOAdminBoard implements MapperAdmin {

	@Autowired
	private MapperAdmin mapper;
	
	@Override
	public ArrayList<DTOAdminBoard> list(DTOAdminTotal dto) {
		// TODO Auto-generated method stub
		return mapper.list(dto);
	}
	
	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return mapper.countBoard();
	}

	@Override
	public DTOAdminBoard view(int seq) {
		// TODO Auto-generated method stub
		return mapper.view(seq);
	}
	
	@Override
	public DTOAdminBoard viewBefore(int rowno) {
		// TODO Auto-generated method stub
		
		DTOAdminBoard to = new DTOAdminBoard(); 
		if(mapper.viewBefore(rowno) != null) {
			to = mapper.viewBefore(rowno);
		} else {
			to.setSeq(0);
			to.setSubject("이전 게시글이 없습니다.");
		}
		
		return to;
	}

	@Override
	public DTOAdminBoard viewAfter(int rowno) {
		// TODO Auto-generated method stub
		
		DTOAdminBoard to = new DTOAdminBoard(); 
		if(mapper.viewAfter(rowno) != null) {
			to = mapper.viewAfter(rowno);
		} else {
			to.setSeq(0);
			to.setSubject("다음 게시글이 없습니다.");
		}
		
		return to;
	}

	@Override
	public int writeOk(DTOAdminBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.writeOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public DTOAdminBoard modify(int seq) {
		// TODO Auto-generated method stub
		return mapper.modify(seq);
	}

	@Override
	public int modifyOk(DTOAdminBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.modifyOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public int deleteOk(DTOAdminBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.deleteOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public ArrayList<DTOAdminBoard> nolist(DTOAdminBoard to) {
		// TODO Auto-generated method stub
		return mapper.nolist(to);
	}
	

	@Override
	public ArrayList<DTOAdminBoard> memberList(DTOAdminTotal dto) {
		// TODO Auto-generated method stub
		return mapper.memberList(dto);
	}

	@Override
	public int countMember(DTOAdminTotal dto) {
		// TODO Auto-generated method stub
		return mapper.countMember(dto);
	}

	@Override
	public int memberDelete(int uesr_num) {
		// TODO Auto-generated method stub
		return mapper.memberDelete(uesr_num); 
	}

	
	// chart	
	@Override
	public ArrayList<DTOAttendance> countDaily(DTOAttendance cto) {
		// TODO Auto-generated method stub
		return mapper.countDaily(cto);
	}

	@Override
	public ArrayList<DTOAttendance> countWeekly(DTOAttendance cto) {
		// TODO Auto-generated method stub
		return mapper.countWeekly(cto);
	}

	@Override
	public ArrayList<DTOAttendance> countMonthly(DTOAttendance cto) {
		// TODO Auto-generated method stub
		return mapper.countMonthly(cto);
	}

}
