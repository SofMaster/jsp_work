<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
<h1>비동기 테스트</h1>
<script>
	//주어진 어떤 작업을 하는 함수 (첫번째 인자로는 작업내용, 두번째 인자로는 그 작업이 끝났을때 호출해야할 함수)
	function work(job, callback){
		//작업을 끝마치는데 걸리는 시간이 불확실 하다고 가정하자
		let time=Math.random()*5000; //0~5000 사이
		//작업을 하는데 약간의 시간이 필요하다고 가정하자
		setTimeout(function(){
			console.log(job+" 을(를) 수행 완료 했습니다.");
			//콜백함수 호출해 주기
			callback();
		}, time);
	}
	
	work("냉장고 문을 열기", function(){
		work("상규를 가두기", function(){
			work("냉장고 문을 닫기", function(){
				work("트럭에 냉장고를 싣는다",function(){
					work("냉장고를 배에 실어서 보낸다",function(){
						
					});
				});
			});
		});
	});
	
	
</script>
</body>
</html>