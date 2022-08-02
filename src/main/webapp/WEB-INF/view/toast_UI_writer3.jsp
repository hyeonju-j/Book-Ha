<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    
    <!-- 디자인 수정용 CSS 추가 -->
    <style>
        #editor {
            /* border : 1px solid; */
            width: 70%;
            margin: 0 auto;
        }
        /* editor content 받을 div태그 스타일 추가. */
        #contents {
            width:50%;
            height: 100px;
            margin: 30px auto;
            border: 1px solid;
        }
        #accordion {
        	width: 70%;
        	margin: 0 auto;
        }
    </style>
 	<!-- jQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- jQuery UI CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	<!-- jQuery UI CSS CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
    <!-- codemirror CDN URL -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
	<!-- TOAST UI Editor CDN URL(CSS) -->
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<!-- TOAST UI Editor CDN URL(JS) -->
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    
    <script>
    	$(function() {
			$('#accordion').accordion({
				// jQuery UI accordion 본문 축소기능 활성화
				collapsible: true,
				active: false
			});
		});
    </script>
</head>
<body>
    <h1> TOAST UI Editor 만들기 </h1>
    
    <!-- Markdown을 설명할 accordion이 들어갈 div태그 -->
    <div id="accordion">
    	<h3>마크다운 편집기가 처음이신가요?</h3>
    	<div>
    		<p>다음 내용을 따라오세요.<br><br><strong>목차입니다.</strong></p>
    		<ol>
    			<li>문단 제목</li>
    			<li>굵은 글씨</li>
    			<li>기울이기</li>
    			<li>취소선</li>
    			<li>수평 가로선 생성</li>
    			<li>인용문</li>
    			<li>순서 없는 목차</li>
    			<li>순서 있는 목차</li>
    		</ol>
    	</div>
    </div>
    
    <!-- TOAST UI Editor가 들어갈 div태그 -->
    <div id="editor"></div>
    
    <!-- TOAST UI Editor 생성 JavaScript 코드 -->
    <script>
		const editor = new toastui.Editor({
		    el: document.querySelector('#editor'),
		    previewStyle: 'vertical',
		    previewHighlight: false,
		    height: '700px',
		    // 사전입력 항목
		    initialValue: '# 안녕하세요. 배윤석입니다.\n### 사전입력 테스트\n본문본문본문\n\n',
		    // 이미지가 Base64 형식으로 입력되는 것 가로채주는 옵션
		    hooks: {
		    	addImageBlobHook: (blob, callback) => {
		    		// blob : Java Script 파일 객체
		    		//console.log(blob);
		    		
		    		const formData = new FormData();
		        	formData.append('image', blob);
		        	
		        	let url = '/images/';
		   			$.ajax({
		           		type: 'POST',
		           		enctype: 'multipart/form-data',
		           		url: '/writeTest.do',
		           		data: formData,
		           		dataType: 'json',
		           		processData: false,
		           		contentType: false,
		           		cache: false,
		           		timeout: 600000,
		           		success: function(data) {
		           			//console.log('ajax 이미지 업로드 성공');
		           			url += data.filename;
		           			
		           			// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
		        			// 형식 : ![대체 텍스트](주소)
		           			callback(url, '사진 대체 텍스트 입력');
		           		},
		           		error: function(e) {
		           			//console.log('ajax 이미지 업로드 실패');
		           			//console.log(e.abort([statusText]));
		           			
		           			callback('image_load_fail', '사진 대체 텍스트 입력');
		           		}
		           	});
		    	}
		    }
		});

        // editor.getHtml()을 사용해서 에디터 내용 수신
        //document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
        // 콘솔창에 표시
        //console.log(editor.getHTML());
        
    </script>   
</body>
</html>