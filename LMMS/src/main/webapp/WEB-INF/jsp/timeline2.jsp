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
lbnestGroup=["cs","qs"];
csnestGroup=["engine","ep","engine_mile","ep_mile"];
qsnestGroup=["corver","stats","corver_mile","stats_mile"];
carnestGroup=["controller","infor","bigdata","controller_mile","infor_mile","bigdata_mile"];
// timeline을 넣을 곳,
var container = document.getElementById('visualization');
// group 생성, 일부러 nested 그룹도 생성 	
var groups = new vis.DataSet([
	
	{id: "lab", content: '연구실', nestedGroups:lbnestGroup },
	
	  {id: "cs", content: 'cs실', nestedGroups:csnestGroup },
	  {id: "engine", content: "엔진팀"},
	  {id: "engine_mile", content: " "},
	  {id: "ep", content: 'EP팀'},
	  {id: "ep_mile", content: ' '},
	  
	  {id: "carsol", content: '차량솔루션센터', nestedGroups:carnestGroup },
	  {id: "controller", content: '제어기솔루션팀'},
	  {id: "controller_mile", content: ' '},
	  {id: "infor", content: '인포에이먼트'},
	  {id: "infor_mile", content: ' '},
	  {id: "bigdata", content: '빅데이터'},
	  {id: "bigdata_mile", content: ' '},
	  
	  {id: "qs", content: 'qs실', nestedGroups:qsnestGroup },
	  {id: "corver", content: "corver팀"},
	  {id: "corver_mile", content: " "},
	  {id: "stats", content: 'stats팀'},
	  {id: "stats_mile", content: ' '},
]);

// 각 그룹에 표시할 데이타 생성 및 연결
var items = new vis.DataSet([
 

  
  {id: 1, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "cssdf", title:'아아앙'},
  {id: 2, content: 'start', start: '2017-03-01', end: '2017-03-30', group: "engine", title:'start: 2017-03-01  end: 2017-03-30' ,style:'background-color:red;'},
  {id: 3, content: 'second', start: '2017-03-15', end: '2017-08-28', group: "engine", title:'start: 2017-03-15  end: 2017-03-28',style:';'},
  {id: 4, content: 'start', start: '2017-08-15', end: '2017-10-28', group: "ep", title:'start: 2017-03-15  end: 2017-03-28',style:';'},
  {id: 5, content: 'second', start: '2017-11-15', end: '2017-12-28', group: "ep", title:'start: 2017-03-15  end: 2017-03-28',style:';'},
  {id: 6, content: 'third', start: '2017-01-15', end: '2017-02-28', group: "ep", title:'start: 2017-03-15  end: 2017-03-28',style:';'},
  
  {id: 8, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "carsolsdf", title:'아아앙'},
  {id: 7, content: 'start', start: '2017-03-15', end: '2017-05-28', group: "controller", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 9, content: 'start', start: '2017-03-15', end: '2017-05-28', group: "infor", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 10, content: 'second', start: '2017-04-15', end: '2017-8-28', group: "infor", title:'start: 2017-03-15  end: 2017-03-28'},
  
  {id: 11, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "qssdf", title:'아아앙'},
  {id: 12, content: 'start', start: '2017-05-01',end: '2017-05-28', group: "corver", title:'인원변동'},
  {id: 13, content: 'start', start: '2017-03-27', end:'2017-05-13',group: "stats", title:'인원변동'},
  {id: 14, content: 'second', start: '2017-05-15', end: '2017-6-28', group: "stats", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 15, content: 'third', start: '2017-09-15', end: '2017-12-28', group: "stats", title:'start: 2017-03-15  end: 2017-03-28'},
  
  {id: 16, content: '', start: '2017-11-15', group: "ep_mile", title:'start: 2017-03-15',style:"border-color: black; color: black; background-color:black;",type:""},
  {id: 17, content: '', start: '2017-1-15', group: "ep_mile", title:'start: 2017-03-15',style:"border-color: black; color: black; background-color:black;"},
  {id: 18, content: '', start: '2017-4-15', group: "infor_mile", title:'start: 2017-03-15',style:"border-color: black; color: black; background-color:black;"},
  {id: 19, content: '', start: '2017-11-15', group: "stats_mile", title:'start: 2017-9-15',style:"border-color: black; color: black; background-color:black;"},
  {id: 20, content: '', start: '2017-3-15', group: "ep_mile", title:'start: 2017-3-15',style:"border-color: black; color: black; background-color:black;"},
  {id: 21, content: '', start: '2017-5-15', group: "stats_mile", title:'start: 2017-3-15',style:"border-color: black; color: black; background-color:black;"},
  {id: 22, content: '', start: '2017-3-15', group: "engine_mile", title:'start: 2017-3-15',style:"border-color: black; color: black; background-color:black;"},
  {id: 23, content: '', start: '2017-5-15', group: "engine_mile", title:'start: 2017-3-15',style:"border-color: black; color: black; background-color:black;"},
]);


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