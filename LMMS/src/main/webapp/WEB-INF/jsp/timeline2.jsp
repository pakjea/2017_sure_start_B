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

 
<style>
  .vis-item {
    border-color:#00ff0000;
   
  }
</style>


</head>
<body>

<div id="visualization"></div>

<script type="text/javascript">
/* 긴 문자열은 보기 좋게 미리 선언 */
html5aroundImg='<img src="http://html5around.com/wordpress/wp-content/uploads/2016/12/html5around_155px.png" width=155px height=auto>';
html5aroundMsg='fucker';
lbnestGroup=["cs","qs","engine","ep","engine_mile","ep_mile","corver","stats","corver_mile","stats_mile"];
csnestGroup=["engine","ep","engine_mile","ep_mile"];
qsnestGroup=["corver","stats","corver_mile","stats_mile"];
carnestGroup=["controller","infor","bigdata","controller_mile","infor_mile","bigdata_mile"];
// timeline을 넣을 곳,
var container = document.getElementById('visualization');
// group 생성, 일부러 nested 그룹도 생성 	
var groups = new vis.DataSet([
	
	  {id: "lab", content: '연구실', nestedGroups:lbnestGroup },
	
	  {id: "cs", content: 'cs실', nestedGroups:csnestGroup ,style:'background-color:#FBF2EF;'},
	  {id: "ep", content: 'EP팀',style:'background-color:#FBF2EF;'},
	  {id: "ep_mile", content: ' ',style:'background-color:#FBF2EF;'},
	  {id: "engine", content: "엔진팀",style:'background-color:#FBF2EF;'},
	  {id: "engine_mile", content: " ",style:'background-color:#FBF2EF;'},
	  
	  {id: "qs", content: 'qs실', nestedGroups:qsnestGroup ,style:'background-color:#F3F781;'},
	  {id: "corver", content: "corver팀",style:'background-color:#F3F781;'},
	  {id: "corver_mile", content: " ",style:'background-color:#F3F781;'},
	  {id: "stats", content: 'stats팀',style:'background-color:#F3F781;'},
	  {id: "stats_mile", content: ' ',style:'background-color:#F3F781;'},
	  
	  {id: "carsol", content: '차량솔루션센터', nestedGroups:carnestGroup,style:'background-color:#81F781;' },
	  {id: "controller", content: '제어기솔루션팀',style:'background-color:#81F781;'},
	  {id: "controller_mile", content: ' ',style:'background-color:#81F781;'},
	  {id: "infor", content: '인포에이먼트',style:'background-color:#81F781;'},
	  {id: "infor_mile", content: ' ',style:'background-color:#81F781;'},
	  {id: "bigdata", content: '빅데이터',style:'background-color:#81F781;'},
	  {id: "bigdata_mile", content: ' ',style:'background-color:#81F781;'},
]);

// 각 그룹에 표시할 데이타 생성 및 연결
var items = new vis.DataSet(${allProjectJson});

//item change log
items.on('*', function (event, properties) {
    console.log(event, properties.items);
  });

// 타임라인 옵션
var options = {
	  orientation:{
		  axis:'top',
		  item:'top',
	
	  },
	  tooltip:{
		  followMouse:true,
	  },
	  
	//아이템 edit
	  editable:true,
	  
	  
	  zoomable:false,
	  verticalScroll: true,
	  min:'2016-12-01',  /*타임라인 시작 지정*/
	  max:'2017-12-31',  /*타임라인 끝 지정*/
	  maxHeight: 700    /*타임라인 높이 지정, 넘으면 세로 스크롤*/
	
};

// 타임라인 생성/ 화면에 보임
var timeline = new vis.Timeline(container, items, groups, options);

container.onclick = function () {
	var props = timeline.getEventProperties(event)
	//console.log(props);
	
	if(props.item!=null&&props.group == "engine"){
		alert("엔진팀 팀프로젝트 입니다")
	}else if(props.item!=null&&props.group == "ep"){
		alert("EP 팀 프로젝트입니다");
	}else if(props.item!=null&&props.group == "controller"){
		alert("제어기솔루션 팀 프로젝트입니다");
	}
	
}
/*
timeline.on('select', function (properties) {
	  alert('selected items: ' + properties.items);
	});
	*/


	


timeline.fit();
  
  //var timeline2 = new vis.Timeline(container, items, options);
</script>



</body>
</html>