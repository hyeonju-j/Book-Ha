package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOAdminBoard;
import com.bookha.main.dao.DAOShareBoard;
import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOAdminBoard;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareComment;
import com.bookha.main.dto.DTOShareTotal;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelMenuBar;
import com.bookha.model.ModelNavBar;
import com.bookha.model.ModelNoticeList;
import com.bookha.model.ModelProfileHtml;
import com.bookha.model.ModelShareCmt;
import com.bookha.model.ModelShareList;
import com.bookha.model.ModelSharePageNavigation;

@RestController
public class ControllerShare {
	
	private String title = "나눔과 공유하기";
	private String user_role = "user";
	
	@Autowired
	private DAOShareBoard dao;
	
	@Autowired
	private DAOAdminBoard daoAdmin;
	
	@Autowired
	private DAOUser daoUser;
																																																																																																																									
	@RequestMapping(value = "/share_list.do")									// 세션 -> 자바에서 부를떄만 적어주기
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		// html 타이틀
		mv.addObject("title", title);
		
		// 프로필
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		// 로고
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		// 해시태그 검색단어 전처리
		String hashTag = "";
		if(request.getParameter("hash_tag") != null) {
			hashTag = request.getParameter("hash_tag");
		}
		
		if( hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		// 제목 검색 전, 검색단어 전처리
		String searchSubject = "";
		if(request.getParameter("searchSubject") != null) {
			searchSubject = request.getParameter("searchSubject");
		}
		
		// 페이징
		DTOShareTotal dto = new DTOShareTotal();
		dto.setHash_tag(hashTag);
		dto.setSearchSubject(searchSubject);
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		// 현재 페이지
		cpage = dto.getCpage();
		if( request.getParameter("cpage") != null ) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
			dto.setCpage(cpage);
		}
		
		// 게시글 시작 번호
		skip = (cpage - 1) * dto.getRecordPerPage();
		dto.setSkip(skip);
		
		// 총 게시글 수
		dto.setTotalRecord(dao.countBoard(dto));
		totalRecord = dto.getTotalRecord();
		
		// 전체 페이지 수
		totalPage = ( (totalRecord - 1) / dto.getRecordPerPage() ) + 1;
		dto.setTotalPage(totalPage);
		
		// 보여질 블록 수 5개
		blockPerPage = dto.getBlockPerPage();
		
		// 블록 시작,끝
		startBlock = ( ( (cpage - 1) / blockPerPage ) * blockPerPage ) + 1;
		dto.setStartBlock(startBlock);
		endBlock = ( ( (cpage - 1) / blockPerPage ) * blockPerPage ) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		dto.setEndBlock(endBlock);
		
		ArrayList<DTOShareBoard> lists = new ArrayList<DTOShareBoard>();
		lists = dao.list(dto);		
		
		ModelShareList sh = new ModelShareList();
		String listTable = sh.ShareList(lists);
		mv.addObject("listTable", listTable);
		
		ModelSharePageNavigation pageModel = new ModelSharePageNavigation();
		String paging = pageModel.getPageNav(dto);
		mv.addObject("paging", paging);
		
		if(hashTag.equals("#")) {
			hashTag = "# 전체";
		}
		mv.addObject("hashTag", hashTag);
		
		// notice list
		DTOAdminBoard adto = new DTOAdminBoard();
		ArrayList<DTOAdminBoard> nolists = new ArrayList<DTOAdminBoard>();
		nolists = daoAdmin.nolist(adto);
		
		ModelNoticeList no = new ModelNoticeList();
		String NoticeList = no.NoticeList(nolists);
		mv.addObject("NoticeList", NoticeList );
		
		//상단 Navbar Model
		DTOUser userSetting = new DTOUser();
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBarSearch(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.menuBar("share");
		mv.addObject("menuBar", menuBar);
		
		mv.setViewName("share_board/board_list");
		return mv;
	}
	
	@RequestMapping(value = "/share_list_search.do", method = RequestMethod.POST)
	public String listSearch(@RequestBody DTOShareTotal to, HttpServletRequest request) {
		ArrayList<DTOShareBoard> lists = new ArrayList<DTOShareBoard>();
		
		String hashTag = to.getHash_tag();
		
		if( hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		String searchSubject = to.getSearchSubject();
		
		// 페이징
		DTOShareTotal dto = new DTOShareTotal();
		dto.setHash_tag(hashTag);
		dto.setSearchSubject(searchSubject);
		int skip, cpage;
		
		cpage = dto.getCpage();
		skip = (cpage - 1) * dto.getRecordPerPage();
		dto.setSkip(skip);
		
		lists = dao.list(dto);
		
		ModelShareList sh = new ModelShareList();
		String listTable = sh.ShareList(lists);
		
		return listTable;
	}
	
	@RequestMapping(value= "share_list_pageNav.do", method = RequestMethod.POST)
	public String listpageNav(@RequestBody DTOShareTotal to, HttpServletRequest request) {
		
		String hashTag = to.getHash_tag();
		
		if(hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		String searchSubject = to.getSearchSubject();
		
		DTOShareTotal dto = new DTOShareTotal();
		dto.setHash_tag(hashTag);
		dto.setSearchSubject(searchSubject);
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		cpage = dto.getCpage();
		skip = (cpage - 1) * dto.getRecordPerPage();
		dto.setSkip(skip);
		
		dto.setTotalRecord(dao.countBoard(dto));
		totalRecord = dto.getTotalRecord();
		
		totalPage = ( (totalRecord - 1) / dto.getRecordPerPage() ) + 1;
		dto.setTotalPage(totalPage);
		
		blockPerPage = dto.getBlockPerPage();
		
		startBlock = (( (cpage - 1) / blockPerPage ) * blockPerPage) + 1;
		dto.setStartBlock(startBlock);
		endBlock = (( (cpage - 1) / blockPerPage ) * blockPerPage) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		dto.setEndBlock(endBlock);
		
		ModelSharePageNavigation pageModel = new ModelSharePageNavigation();
		String paging = pageModel.getPageNav(dto);
		
		return paging;
	}
	
	@RequestMapping(value = "/share_write.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		//상단 Navbar Model
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.menuBar("share");
		mv.addObject("menuBar", menuBar);
		
		mv.setViewName("share_board/board_write");
		return mv;
	}
	
	@RequestMapping(value = "/share_write_ok.do")
	public ModelAndView writeOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		String subject = request.getParameter("subject");
		// user_num : jsp에서 필요할 때
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		String content = request.getParameter("content");
		String hash_tag = request.getParameter("hash_tag");
				
		DTOShareBoard to = new DTOShareBoard();
		
		to.setSeq(0);
		to.setSubject(subject);
		to.setUser_num(user_num);
		to.setContent(content);
		to.setHash_tag(hash_tag);

		int flag = dao.writeOk(to);
		mv.addObject("flag", flag);
		
		mv.setViewName("share_board/board_update_ok");
		return mv;
	}
	
	@RequestMapping(value = "/share_view.do")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		// user_num : controller에서 필요할 때 (세션에서 가져오기)
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		dao.viewHit(seq);
		DTOShareBoard to = dao.view(seq);
		mv.addObject("to", to);
		
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(to.getUser_num());
		mv.addObject("user", userSetting);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.menuBar("share");
		mv.addObject("menuBar", menuBar);
		
		//상단 Navbar Model
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		this.user_role = daoUser.userSetting(session_user_num).getUser_role();
		mv.addObject("user_role", this.user_role);
		
		// 댓글
		ArrayList<DTOShareComment> comment_lists = dao.commentList(seq);
		ModelShareCmt comment = new ModelShareCmt();
		String cmtTable = comment.cmtList(comment_lists, session_user_num, this.user_role);
		mv.addObject("cmtTable", cmtTable);

		mv.setViewName("share_board/board_view");
		return mv;
	}
	
	@RequestMapping(value = "/share_modify.do")
	public ModelAndView modify(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		this.user_role = daoUser.userSetting(session_user_num).getUser_role().toLowerCase();
		
		//상단 Navbar Model
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.menuBar("share");
		mv.addObject("menuBar", menuBar);
		
		DTOShareBoard to = dao.modify(seq);
		to.setUser_num(session_user_num);
		mv.addObject("to", to);
		
		mv.setViewName("share_board/board_modify");
		return mv;
	}
	
	@RequestMapping(value = "/share_modify_ok.do")
	public ModelAndView modifyOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		String subject = request.getParameter("subject");
		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num"))); 
		String content = request.getParameter("content");
		String hash_tag = request.getParameter("hash_tag");
				
		DTOShareBoard to = new DTOShareBoard();
		
		to.setSeq(seq);
		to.setSubject(subject);
		to.setUser_num(session_user_num);
		to.setContent(content);
		to.setHash_tag(hash_tag);

		int flag = dao.modifyOk(to);
		
		mv.addObject("flag", flag);
		mv.addObject("seq", seq);
		
		mv.setViewName("share_board/board_update_ok");
		return mv;
	}
	
	@RequestMapping(value = "/share_delete_ok.do")
	public ModelAndView deleteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		String url = "success";
		
		DTOShareBoard to = new DTOShareBoard();
		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		to.setSeq(seq);
		to.setUser_num(session_user_num);

		int flag = dao.deleteOk(to);
		mv.addObject("flag", flag);
		
		mv.setViewName("share_board/board_update_ok");
		return mv;
	}
	
	@RequestMapping(value = "/share_cmt_list.do", method = RequestMethod.POST )
	public String commentList(@RequestBody DTOShareComment to, HttpSession session) {
		
		ArrayList<DTOShareComment> cmt_lists = dao.commentList(to.getBoard_seq());
		ModelShareCmt comment = new ModelShareCmt();
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		
		this.user_role = daoUser.userSetting(session_user_num).getUser_role();

		String cmtTable = comment.cmtList(cmt_lists, session_user_num, this.user_role);
		return cmtTable;
	}
	
	@RequestMapping(value = "/share_cmt_write.do", method = RequestMethod.POST )
	public String commentWrite(@RequestBody DTOShareComment to) {
		
		int flag = dao.commentWrite(to);
		return "success " + flag;
	}
	
	@RequestMapping(value = "/share_cmt_delete.do", method = RequestMethod.POST )
	public String commentDelete(@RequestBody DTOShareComment to) {
		
		dao.commentDelete(to.getSeq());
		return "success";
	}
}