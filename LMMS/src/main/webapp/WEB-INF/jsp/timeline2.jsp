<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
  <title>Timeline | Basic demo</title>

<link href="https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css" rel="stylesheet">  
<script src="http://visjs.org/dist/vis.js"></script>
<link href="http://visjs.org/dist/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />

</head>
<body>

<div id="visualization"></div>

<script type="text/javascript">
/* 긴 문자열은 보기 좋게 미리 선언 */
html5aroundImg='<img src="http://html5around.com/wordpress/wp-content/uploads/2016/12/html5around_155px.png" width=155px height=auto>';
html5aroundMsg='fucker';
csnestGroup=["engine","ep"];
qsnestGroup=["corver","stats"];
carnestGroup=["controller","infor","bigdata"];
// timeline을 넣을 곳,
var container = document.getElementById('visualization');
// group 생성, 일부러 nested 그룹도 생성 	
var groups = new vis.DataSet([
	  {id: "cs", content: 'cs실', nestedGroups:csnestGroup },
	  {id: "engine", content: "엔진팀"},
	  {id: "ep", content: 'EP팀'},
	  
	  {id: "carsol", content: '차량솔루션센터', nestedGroups:carnestGroup },
	  {id: "controller", content: '제어기솔루션팀'},
	  {id: "infor", content: '인포에이먼트'},
	  {id: "bigdata", content: '빅데이터'},
	  
	  {id: "qs", content: 'qs실', nestedGroups:qsnestGroup },
	  {id: "corver", content: "corver팀"},
	  {id: "stats", content: 'stats팀'},
]);

// 각 그룹에 표시할 데이타 생성 및 연결
var items = new vis.DataSet([
  {id: 1, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "cssdf", title:'아아앙'},
  {id: 2, content: 'start', start: '2017-03-01', end: '2017-03-30', group: "engine", title:'start: 2017-03-01  end: 2017-03-30'},
  {id: 3, content: 'second', start: '2017-03-15', end: '2017-03-28', group: "engine", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 4, content: 'start', start: '2017-08-15', end: '2017-10-28', group: "ep", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 5, content: 'second', start: '2017-11-15', end: '2017-12-28', group: "ep", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 6, content: 'third', start: '2017-01-15', end: '2017-02-28', group: "ep", title:'start: 2017-03-15  end: 2017-03-28'},
  
  {id: 7, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "carsolsdf", title:'아아앙'},
  {id: 8, content: 'start', start: '2017-03-15', end: '2017-05-28', group: "controller", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 9, content: 'start', start: '2017-03-15', end: '2017-05-28', group: "infor", title:'start: 2017-03-15  end: 2017-03-28'},
  
  {id: 10, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "qssdf", title:'아아앙'},
  {id: 11, content: 'start', start: '2017-05-01',end: '2017-05-28', group: "corver", title:'인원변동'},
  {id: 12, content: 'start', start: '2017-03-27', group: "stats", title:'인원변동', type : 'point'},
  
 
]);

// 타임라인 옵션
var options = {
	  orientation:{
		  axis:'top',
		  item:'top'
	  },
	  tooltip:{
		  followMouse:true,
	  },
	  verticalScroll: true,
	  min:'2016-12-01',  /*타임라인 시작 지정*/
	  max:'2017-12-31',  /*타임라인 끝 지정*/
	  maxHeight: 700    /*타임라인 높이 지정, 넘으면 세로 스크롤*/
};

// 타임라인 생성/ 화면에 보임
var timeline = new vis.Timeline(container, items, groups, options);

container.onclick = function () {
	var props = timeline.getEventProperties(event)
	console.log(props);
	
	if(props.item!=null&&props.group == "engine"){
		alert("엔진팀 팀프로젝트 입니다")
		
	}else if(props.item!=null&&props.group == "ep"){
		alert("EP 팀 프로젝트입니다");
	}else if(props.item!=null&&props.group == "controller"){
		alert("제어기솔루션 팀 프로젝트입니다");
	}
	
}


	


timeline.fit();
  
  //var timeline2 = new vis.Timeline(container, items, options);
</script>
</body>
</html>