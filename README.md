# Book-Ha
<br />

- 웹 프로젝트(책 리뷰 & 공유 홈페이지)에 대한 소개
- 각 화면별 기능
- 개발 환경
- 팀원 및 역할 소개

<hr />

### Description
다양한 장르의 도서에 대해 리뷰와 실물도서를 공유함으로써 
독서 경험 확장과 독서 장려를 위한 홈페이지(웹 프로젝트)
<br /><br />

### 화면
	main
		로그인 했을 경우에만 각 게시판으로 이동 가능
        
	Login / Join
		메일, 이름, 비밀번호, 전화번호, 닉네임(중복 불허)를 활용해 가입
		가입된 메일과 비밀번호를 통해 로그인 가능
		관리자는 관리자 페이지, 회원은 마이페이지 기능 활성화
		- 관리자 페이지 : 방문자 수 그래프 확인 / 회원 목록- 회원정보열람 및 삭제 기능 / 
				회원이 작성한 글&댓글 관리 기능 / 공지게시글 CURD
		- 마이페이지 : 출석체크,개인정보관리, 작성한 글 확인*수정*삭제, 탈퇴 기능
	
	board
		ranking
			출석 또는 각 게시판에서 글을 많이 작성한 회원의 랭킹
		review board
			도서를 검색, 선택하여 리뷰 작성 및 수정,삭제 & 댓글 CRD
			도서 장르를 해시태그로 분류
			게시글 검색 기능
		achivement board
			매일 읽은 책 사진 찍어 올리기 챌린지
		share board
			실물 도서 교환 또는 나눔 등의 목적으로 한 게시판
			목적에 따라 해스태그로 분류
			게시글 CURD & 댓글 CRD
			게시글 검색 기능
<br />

### Environment
- OS : Windows 10
- Server : Apache Tomcat v.9.0
- DBMS : MariaDB
- Language : Java, HTML5, CSS3, Javascript, JSP ..

<br />

### Team
- hyeonju-j : admin page, mypage, share board
- jiaezzang : main, mypage, ranking, achievement
- YoonSeok-Bae : Login/Join, review board
- ~~91410 9149 : Login/Join~~
