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
lbnestGroup=["cs","qs","engine","ep","engine_p1_mile","ep_p1_mile","engine_p2_mile","ep_p2_mile","cover","stats","cover_p1","stats_p1","cover_p1_mile","stats_p1_mile", 'engine_p1','engine_p2','ep_p1','ep_p2'];

csnestGroup=["engine","ep","engine_p1_mile","ep_p1_mile","engine_p2_mile","ep_p2_mile",'engine_p1','engine_p2','ep_p1','ep_p2'];
enginenestGroup=['engine_p1','engine_p2','engine_p1_mile','engine_p2_mile'];
epnestGroup=['ep_p1','ep_p2','ep_p1_mile','ep_p2_mile'];

qsnestGroup=["cover","stats",'cover_p1','stats_p1',"cover_p1_mile","stats_p1_mile"];
covernestGroup=['cover_p1',"cover_p1_mile"];
statsnestGroup=['stats_p1',"stats_p1_mile"];

carnestGroup=["controller","infor","bigdata","controller_mile","infor_mile","bigdata_mile"];
// timeline을 넣을 곳,
var container = document.getElementById('visualization');
// group 생성, 일부러 nested 그룹도 생성 	
var groups = new vis.DataSet([
	
	  {id: "lab", content: '연구실', nestedGroups:lbnestGroup },
	
	  {id: "cs", content: 'cs실', nestedGroups:csnestGroup ,style:'background-color:#FBF2EF;',value:1},
	  
	  {id: "ep", content: 'EP팀',nestedGroups:epnestGroup,style:'background-color:#FBF2EF;',value:1.1},
	  {id: "ep_p1", content: 'ep_p1 ',style:'background-color:#FBF2EF;',value:1.2},
	  {id: "ep_p1_mile", content: ' ',style:'background-color:#FBF2EF;',value:1.2},
	  {id: "ep_p2", content: 'ep_p2 ',style:'background-color:#FBF2EF;',value:1.2},
	  {id: "ep_p2_mile", content: ' ',style:'background-color:#FBF2EF;',value:1.2},
	  
	  {id: "engine", content: "엔진팀",nestedGroups:enginenestGroup,style:'background-color:#FBF2EF;',value:1.3},
	  {id: "engine_p1", content: 'engine_p1 ',style:'background-color:#FBF2EF;',value:1.4},
	  {id: "engine_p1_mile", content: ' ',style:'background-color:#FBF2EF;',value:1.4},
	  {id: "engine_p2", content: 'engine_p2 ',style:'background-color:#FBF2EF;',value:1.4},
	  {id: "engine_p2_mile", content: ' ',style:'background-color:#FBF2EF;',value:1.4},
	  
	  {id: "qs", content: 'qs실', nestedGroups:qsnestGroup ,style:'background-color:#F3F781;',value:2},
	 
	  {id: "cover", content: "cover팀",nestedGroups:covernestGroup, style:'background-color:#F3F781;',value:2.1},
	  {id: "cover_p1", content: "cover_p1",style:'background-color:#F3F781;',value:2.2},
	  {id: "cover_p1_mile", content: " ",style:'background-color:#F3F781;',value:2.2},
	  
	  {id: "stats", content: 'stats팀',nestedGroups:statsnestGroup,style:'background-color:#F3F781;',value:2.3},
	  {id: "stats_p1", content: 'stats_p1 ',style:'background-color:#F3F781;',value:2.4},
	  {id: "stats_p1_mile", content: ' ',style:'background-color:#F3F781;',value:2.4},
	  
	  {id: "carsol", content: '차량솔루션센터', nestedGroups:carnestGroup,style:'background-color:#81F781;',value:3 },
	  {id: "controller", content: '제어기솔루션팀',style:'background-color:#81F781;',value:3.1},
	  {id: "controller_mile", content: ' ',style:'background-color:#81F781;',value:3.2},
	  {id: "infor", content: '인포에이먼트',style:'background-color:#81F781;',value:3.3},
	  {id: "infor_mile", content: ' ',style:'background-color:#81F781;',value:3.4},
	  {id: "bigdata", content: '빅데이터',style:'background-color:#81F781;',value:3.5},
	  {id: "bigdata_mile", content: ' ',style:'background-color:#81F781;',value:3.6},
	
]);

// 각 그룹에 표시할 데이타 생성 및 연결
var items = new vis.DataSet([
 

  
  {id: 1, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "cssdf", title:'아아앙'},
  {id: 2, content: 'start', start: '2017-03-01', end: '2017-03-30', group: "engine_p1", title:'start: 2017-03-01  end: 2017-03-30' ,style:'background-color:red;'},
  {id: 3, content: 'second', start: '2017-03-15', end: '2017-08-28', group: "engine_p2", title:'start: 2017-03-15  end: 2017-03-28',style:';'},
  {id: 4, content: 'start', start: '2017-08-15', end: '2017-10-28', group: "ep_p1", title:'start: 2017-03-15  end: 2017-03-28',style:';'},
  {id: 5, content: 'second', start: '2017-11-15', end: '2017-12-28', group: "ep_p2", title:'start: 2017-03-15  end: 2017-03-28',style:';'},
  {id: 6, content: 'third', start: '2017-01-15', end: '2017-02-28', group: "ep_p2", title:'start: 2017-03-15  end: 2017-03-28',style:';'},
  
  {id: 8, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "carsolsdf", title:'아아앙'},
  {id: 7, content: 'start', start: '2017-03-15', end: '2017-05-28', group: "controller", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 9, content: 'start', start: '2017-03-15', end: '2017-05-28', group: "infor", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 10, content: 'second', start: '2017-04-15', end: '2017-8-28', group: "infor", title:'start: 2017-03-15  end: 2017-03-28'},
  
  {id: 11, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: "qssdf", title:'아아앙'},
  {id: 12, content: 'start', start: '2017-05-01',end: '2017-05-28', group: "cover_p1", title:'인원변동'},
  {id: 13, content: 'start', start: '2017-03-27', end:'2017-05-13',group: "stats_p1", title:'인원변동'},
  {id: 14, content: 'second', start: '2017-05-15', end: '2017-6-28', group: "stats_p1", title:'start: 2017-03-15  end: 2017-03-28'},
  {id: 15, content: 'third', start: '2017-09-15', end: '2017-12-28', group: "stats_p1", title:'start: 2017-03-15  end: 2017-03-28'},
  

]);

var items2 = [
	  {'id': 16, 'content': '', 'start': '2017-11-15', 'group': "ep_p1_mile", 'title':'ep_mile','style':"border-color: black; color: black; background-color:black;",'type':""},
	  {'id': 17, 'content': '', 'start': '2017-1-15', 'group': "ep_p2_mile", 'title':'ep_mile','style':"border-color: black; color: black; background-color:black;"},
	  {'id': 18, 'content': '', 'start': '2017-4-15', 'group': "infor_mile", 'title':'infor_mile','style':"border-color: black; color: black; background-color:black;"},
	  {'id': 19, 'content': '', 'start': '2017-11-15', 'group': "stats_mile", 'title':'stats_mile','style':"border-color: black; color: black; background-color:black;"},
	  {'id': 20, 'content': '', 'start': '2017-3-15', 'group': "ep_mile", 'title':'ep_mile','style':"border-color: black; color: black; background-color:black;"},
	  {'id': 21, 'content': '', 'start': '2017-5-15', 'group': "stats_p1_mile", 'title':'stats_mile','style':"border-color: black; color: black; background-color:black;"},
	  {'id': 22, 'content': '', 'start': '2017-3-15', 'group': "engine_p1_mile", 'title':'engine_mile','style':"border-color: black; color: black; background-color:black;"},
	  {'id': 23, 'content': '', 'start': '2017-5-15', 'group': "engine_p2_mile", 'title':'engine_mile','style':"border-color: black; color: black; background-color:black;"},
];

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
	  
	  groupOrder: function(a,b){
		  return a.value-b.value;
	  },
	
	//아이템 edit
	 // editable:true,
	  
	  
	  zoomable:false,
	  verticalScroll: true,
	  min:'2016-12-01',  /*타임라인 시작 지정*/
	  max:'2017-12-31',  /*타임라인 끝 지정*/
	  maxHeight: 1000    /*타임라인 높이 지정, 넘으면 세로 스크롤*/
	  
	
};


// 타임라인 생성/ 화면에 보임
var timeline = new vis.Timeline(container, items,groups, options);

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
	items.add(items2);
	timeline.fit();
  
  //var timeline2 = new vis.Timeline(container, items, options);
</script>
</body>
</html>

<title>RoadMap Management System</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="https://unpkg.com/vue@2.4.2"></script>



</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
			
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>
			
			
			<div class="row">
			<div class="col-6"></div>
			<button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#createProjectModal">프로젝트 생성</button>
			<button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modifiedProjectModal">프로젝트 수정</button>
			<button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#createMileStoneModal">마일스톤 생성</button>
			</div>
			
			
				<ul data-role="listview" data-split-icon="gear" data-split-theme="a" data-inset="true" data-filter="true" data-filter-placeholder="Search title">
					<c:forEach var="item" items="${allProjectJson}" varStatus="status">
					    <li id="li-"><div data-toggle="modal" data-target="#viewProjectModal" data-whatever="${item}">
					    <h2>${item}</h2>
					    <p>${item}</p></div>
					    </li>
				    </c:forEach>
				  
				</ul>
				


<!-- 프로젝트 생성 버튼 구현 내용 -->
<div class="modal fade" id="createProjectModal" tabindex="-1" role="dialog" aria-labelledby="createProjectModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createProjectModalLabel">프로젝트 생성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/insertProject" method="post">
          <div class="form-group">
            <label for="projectName" class="col-form-label">프로젝트 이름</label>
            <input type="text" class="form-control" id="projectName" name="name">
            <label for="projectStartTime" class="col-form-label">시작 날짜</label>
            <input type="text" class="form-control" id="projectStartTime" name= "startTime">
            <label for="projectEndTime" class="col-form-label">종료 날짜</label>
            <input type="text" class="form-control" id="projectEndTime" name ="endTime">
            <label for="projectMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="projectMember" name ="member">
            <label for="projectManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="projectManager" name ="manager">
            <label for="teamName" class="col-form-label">팀 이름</label>
            <input type="text" class="form-control" id="teamName" name="teamName">
            <label for="centerName" class="col-form-label">센터(실) 이름</label>
            <input type="text" class="form-control" id="centerName" name ="centerName">
            <input type="hidden" id="projectStatus" name="status" value="N">
          </div>
          <div class="form-group">
            <label for="projectContent" class="col-form-label">프로젝트 내용</label>
            <textarea class="form-control" id="projectContent" name="content"></textarea>
          </div>
          
          <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary" onclick="location.reload()">확인</button>
         </div>
          
        </form>
      </div>
      
    </div>
  </div>
</div>
			
			
<!-- 프로젝트 변경 버튼 구현 내용 -->	
<div class="modal fade" id="modifiedProjectModal" tabindex="-1" role="dialog" aria-labelledby="modifiedProjectModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modifiedProjectModalLabel">프로젝트 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="projectName" class="col-form-label">프로젝트 이름</label>
            <input type="text" class="form-control" id="projectName">
            <label for="projectStartTime" class="col-form-label">시작 날짜</label>
            <input type="text" class="form-control" id="projectStartTime">
            <label for="projectEndTime" class="col-form-label">종료 날짜</label>
            <input type="text" class="form-control" id="projectEndTime">
            <label for="projectMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="projectMember">
            <label for="projectReason" class="col-form-label">변경 이유</label>
            <input type="text" class="form-control" id="projectReason">
            <label for="projectManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="projectManager">
            <label for="projectStatus" class="col-form-label">프로젝트 상태</label>
            <input type="text" class="form-control" id="projectStatus">
            <label for="teamName" class="col-form-label">팀 이름</label>
            <input type="text" class="form-control" id="teamName">
            <label for="centerName" class="col-form-label">센터(실) 이름</label>
            <input type="text" class="form-control" id="centerName">
            <input type="hidden" class="form-control" id="projectStatus" value="N">
            
          </div>
          <div class="form-group">
            <label for="projectContent" class="col-form-label">프로젝트 내용</label>
            <textarea class="form-control" id="projectContent"></textarea>
          </div>
          
          <div class="modal-footer">
       		 <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        		 <button type="button" class="btn btn-primary">확인</button>
     	  </div>
          
        </form>
      </div>
      
    </div>
  </div>
</div>

<!-- 프로젝트 뷰 구현 내용 -->
<div class="modal fade" id="viewProjectModal" tabindex="-1" role="dialog" aria-labelledby="viewProjectModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="viewProjectModalLabel">프로젝트 내용</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="projectName" class="col-form-label">프로젝트 이름</label>
            <input type="text" class="form-control" id="projectName" name="name" value="${allProject[0].name}">
            <label for="projectStartTime" class="col-form-label">시작 날짜</label>
            <input type="text" class="form-control" id="projectStartTime" name= "startTime" value="${allProject[0].startTime}">
            <label for="projectEndTime" class="col-form-label">종료 날짜</label>
            <input type="text" class="form-control" id="projectEndTime" name ="endTime" value="${allProject[0].endTime}">
            <label for="projectMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="projectMember" name ="member" value="${allProject[0].member}">
            <label for="projectManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="projectManager" name ="manager" value="${allProject[0].manager}">
            <label for="teamName" class="col-form-label">팀 이름</label>
            <input type="text" class="form-control" id="teamName" name="teamName" value="${allProject[0].teamName}">
            <label for="centerName" class="col-form-label">센터(실) 이름</label>
            <input type="text" class="form-control" id="centerName" name ="centerName" value="${allProject[0].centerName}">
            <input type="hidden" id="projectStatus" name="status" value="N">
          </div>
          <div class="form-group">
            <label for="projectContent" class="col-form-label">프로젝트 내용</label>
            <textarea class="form-control" id="projectContent" name="content"></textarea>
          </div>
          
          <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         </div>
      </div>
      
    </div>
  </div>
</div>


<!-- 마일스톤 생성 버튼 구현 내용 -->
<div class="modal fade" id="createMileStoneModal" tabindex="-1" role="dialog" aria-labelledby="createMileStoneModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createMileStoneModalLabel">마일스톤 생성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/insertMileStone" method="post">
          <div class="form-group">
          	<label for="projectId" class="col-form-label">프로젝트 ID</label>
            <input type="text" class="form-control" id="projectId" name="projectId">
            <label for="mileStoneName" class="col-form-label">마일스톤 이름</label>
            <input type="text" class="form-control" id="mileStoneName" name="name">
            <label for="mileStoneMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="mileStoneMember" name ="member">
            <label for="mileStoneContent" class="col-form-label">마일스톤 내용</label>
            <input type="text" class="form-control" id="mileStoneContent" name ="content">
            <label for="mileStoneManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="mileStoneManager" name ="manager">
            <label for="mileStoneStatus" class="col-form-label">상태</label>
            <input type="text" class="form-control" id="mileStoneStatus" name ="status">
            <label for="mileStoneReason" class="col-form-label">이유</label>
            <textarea class="form-control" id="mileStoneReason" name="reason"></textarea>
          </div>
          <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">확인</button>
         </div>
          
        </form>
      </div>
      
    </div>
  </div>
</div>
				
				

			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$('#createProjectModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
	
$('#modifiedProjectModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
	
	$('#createMileStoneModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
	
	$('#viewProjectModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
	
	$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
	
</script>

</html>