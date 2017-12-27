<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>RoadMap Management System</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="https://unpkg.com/vue@2.4.2"></script>
<link href="https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css" rel="stylesheet">  
<script src="http://visjs.org/dist/vis.js"></script>
<link href="http://visjs.org/dist/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style>
  .vis-item {
    border-color:#00ff0000;
   
  }
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
			<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#createProjectModal" data-whatever="">프로젝트 생성</button>

			<div id="visualization"></div>

			<div class="row">
			<div class="col-6"></div>

			</div>
			
				<ul data-role="listview" data-split-icon="gear" data-split-theme="a" data-inset="true" data-filter="true" data-filter-placeholder="Search title">
					<c:forEach var="item" items="${all}" varStatus="status">
				    	<c:if test="${!fn:contains(item.id, 'm')}">
				    	<li id="li-"><img src="../../static/images/Project.bmp">
				    	<div data-toggle="modal" data-target="#viewProjectModal" data-whatever='{"id":"${item.id}","name":"${item.name}","content":"${item.content}","startTime":"${item.startTime}","endTime":"${item.endTime}","member":"${item.member}","reason":"${item.reason}","manager":"${item.manager}","registerDate":"${item.registerDate}","status":"${item.status}","teamName":"${item.teamName}","centerName":"${item.centerName}"},'>
					  	<h2> ${item.centerName}  ${item.teamName} - ${item.name} : ${item.content} </h2>
					    <p> 담당자: ${item.manager},  &emsp; 공수(MM) : ${item.member}</p>
					    <p> ${item.startTime} ~ ${item.endTime} </p>
					    </div>
					    </li>
					    </c:if>
					    <c:if test="${fn:contains(item.id, 'm')}">
				    	<li id="li-"><img src="../../static/images/MileStone.bmp">
				    	<div data-toggle="modal" data-target="#viewMileStoneModal" data-whatever='{"id":"${item.id}","name":"${item.name}","registerDate":"${item.registerDate}","content":"${item.content}","member":"${item.member}","manager":"${item.manager}"},'>
					    <h2> ${item.name} : ${item.content}</h2>
					    <p>담당자: ${item.manager}, &emsp; 공수(MM) : ${item.member}</p>
					    <p>생성일 : ${item.registerDate}</p></div>
					    </li>
					    </c:if>
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
            <label for="mileStoneName" class="col-form-label">프로젝트 이름</label>
            <input type="text" class="form-control" id="projectName" name="name" placeholder="프로젝트 이름을 입력하세요.">
            <label for="projectStartTime" class="col-form-label">시작 날짜</label>
            <input type="date" class="form-control" id="projectStartTime" name= "startTime" placeholder="YYYY-MM-DD">
            <label for="projectEndTime" class="col-form-label">종료 날짜</label>
            <input type="date" class="form-control" id="projectEndTime" name ="endTime" placeholder="YYYY-MM-DD">
            <label for="projectMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="projectMember" name ="member" placeholder="공수(MM) 입력">
            <label for="projectManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="projectManager" name ="manager" placeholder="담당자를 입력하세요.">
            <label for="teamName" class="col-form-label">팀 이름</label>
            <input type="text" class="form-control" id="teamName" name="teamName" placeholder="team이름을 입력하세요. 예)Cover ">
            <label for="centerName" class="col-form-label">센터(실) 이름</label>
            <input type="text" class="form-control" id="centerName" name ="centerName" placeholder="센터(실) 이름을 입력하세요.">
            <input type="hidden" id="projectStatus" name="status" value="N">
          </div>
          <div class="form-group">
            <label for="projectContent" class="col-form-label">프로젝트 내용</label>
            <textarea class="form-control" id="projectContent" name="content" placeholder="프로젝트 내용을 입력하세요."></textarea>
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
        <form action="/updateProject" method="post">
          <div class="form-group">
            <label for="projectName" class="col-form-label">프로젝트 이름</label>
            <input type="text" class="form-control" id="projectName" name="name">
            <label for="projectStartTime" class="col-form-label">시작 날짜</label>
            <input type="date" class="form-control" id="projectStartTime" name="startTime">
            <label for="projectEndTime" class="col-form-label">종료 날짜</label>
            <input type="date" class="form-control" id="projectEndTime" name="endTime">
            <label for="projectMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="projectMember" name="member">
            <label for="projectReason" class="col-form-label">변경 이유</label>
            <input type="text" class="form-control" id="projectReason" name="reason">
            <label for="projectManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="projectManager" name="manager">
            <label for="projectStatus" class="col-form-label">프로젝트 상태</label>
            <input type="text" class="form-control" id="projectStatus" name="status">
            <label for="teamName" class="col-form-label">팀 이름</label>
            <input type="text" class="form-control" id="teamName" name="teamName">
            <label for="centerName" class="col-form-label">센터(실) 이름</label>
            <input type="text" class="form-control" id="centerName" name="centerName">
            <input type="hidden" class="form-control" id="projectStatus" name="status" value="N">
            
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
            <input type="text" class="form-control" id="projectName" name="name" disabled>
            <label for="projectStartTime" class="col-form-label">시작 날짜</label>
            <input type="date" class="form-control" id="projectStartTime" name= "startTime" disabled>
            <label for="projectEndTime" class="col-form-label">종료 날짜</label>
            <input type="date" class="form-control" id="projectEndTime" name ="endTime" disabled>
            <label for="projectMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="projectMember" name ="member" disabled>
            <label for="projectManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="projectManager" name ="manager" disabled>
            <label for="teamName" class="col-form-label">팀 이름</label>
            <input type="text" class="form-control" id="teamName" name="teamName" disabled>
            <label for="centerName" class="col-form-label">센터(실) 이름</label>
            <input type="text" class="form-control" id="centerName" name ="centerName" disabled>
            <input type="hidden" id="projectStatus" name="status" value="N">
            <input type="hidden" id="projectId" name="id">
          </div>
          <div class="form-group">
            <label for="projectContent" class="col-form-label">프로젝트 내용</label>
            <textarea class="form-control" id="projectContent" name="content" disabled></textarea>
          </div>
          
        <div class="modal-footer">
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modifiedProjectModal" data-dismiss="modal">프로젝트 수정</button>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createMileStoneModal" data-dismiss="modal">마일스톤 등록</button>
       
       	<form action="/deleteProject" method="post">
       	<input type="hidden" name="projectId" id="deleteProjectId">
       	<button type="submit" class="btn btn-danger" onclick="location.reload()">프로젝트 삭제</button>
       	</form>
        
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
      
      <label for="projectId" class="col-form-label">프로젝트 이름</label>
      <input type="text" class="form-control" name="projectName" id="projectName" disabled>
      
        <form action="/insertMileStone" method="post">
          <div class="form-group">
          	
            <input type="hidden" class="form-control" name="projectId" id="projectId">
            
            <label for="mileStoneName" class="col-form-label">마일스톤 이름</label>
            <input type="text" class="form-control" name="name">
            <label for="mileStoneMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" name ="member">
            <label for="mileStoneContent" class="col-form-label">마일스톤 내용</label>
            <input type="text" class="form-control" name ="content">
            <label for="mileStoneManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" name ="manager">
            <label for="mileStoneStatus" class="col-form-label">상태</label>
            <input type="text" class="form-control" name ="status">
            <label for="mileStoneReason" class="col-form-label">이유</label>
            <textarea class="form-control" name="reason" id="mileStoneReason"></textarea>
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


<!-- 마일스톤 뷰 구현 내용 -->
<div class="modal fade" id="viewMileStoneModal" tabindex="-1" role="dialog" aria-labelledby="viewMileStoneModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="viewMileStoneModalLabel">마일스톤 상세내용</h5>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="mileStoneName" class="col-form-label">마일스톤 이름</label>
            <input type="text" class="form-control" id="mileStoneName" name="name" disabled>
            <label for="mileStoneRegisterDate" class="col-form-label">생성일</label>
            <input type="text" class="form-control" id="mileStoneRegisterDate" name= "registerDate" disabled>
            <label for="mileStoneContent" class="col-form-label">마일스톤 내용</label>
            <input type="text" class="form-control" id="mileStoneContent" name ="content" disabled>
            <label for="mileStoneMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="mileStoneMember" name ="member" disabled>
            <label for="mileStoneManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="mileStoneManager" name ="manager" disabled>
            <input type="hidden" id="projectId" name="id">
          </div>
          
        <div class="modal-footer">
       
       	<form action="/deleteMileStone" method="post">
       	<input type="hidden" name="mileStoneId" id="deleteMileStoneId">
       	<button type="submit" class="btn btn-danger" onclick="location.reload()">마일스톤 삭제</button>
       	</form>
        
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         </div>
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
<script src="https://unpkg.com/vue@2.4.2"></script>
<script src="http://visjs.org/dist/vis.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 모달 스크립트 -->
<script type="text/javascript">

	$('#createProjectModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  
	})
	

	$('#createMileStoneModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	})
	
	$('#modifiedProjectModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var viewItem = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  
	})
	
	$('#viewProjectModal').on('shown.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var viewItem = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this);
	  var json = viewItem.substr(0,viewItem.length-1);
	  var jsonItem = JSON.parse(json);
	  
	  modal.find('.modal-body #deleteProjectId').val(jsonItem.id);
	  modal.find('.modal-title').text('프로젝트 : ' + jsonItem.name + jsonItem.id);
	  modal.find('.modal-body #projectName').val(jsonItem.name);
	  modal.find('.modal-body #projectStartTime').val(jsonItem.startTime);
	  modal.find('.modal-body #projectEndTime').val(jsonItem.endTime);
	  modal.find('.modal-body #projectMember').val(jsonItem.member);
	  modal.find('.modal-body #projectManager').val(jsonItem.manager);
	  modal.find('.modal-body #teamName').val(jsonItem.teamName);
	  modal.find('.modal-body #centerName').val(jsonItem.centerName);
	  modal.find('.modal-body #projectContent').val(jsonItem.content);
	  modal.find('.modal-body #projectId').val(jsonItem.id);
	  $('#modifiedProjectModal').find('.modal-title').text('프로젝트 : ' + jsonItem.name);
	  $('#modifiedProjectModal').find('.modal-body #projectName').val(jsonItem.name);
	  $('#modifiedProjectModal').find('.modal-body #projectStartTime').val(jsonItem.startTime);
	  $('#modifiedProjectModal').find('.modal-body #projectEndTime').val(jsonItem.endTime);
	  $('#modifiedProjectModal').find('.modal-body #projectMember').val(jsonItem.member);
	  $('#modifiedProjectModal').find('.modal-body #projectReasonr').val(jsonItem.reason);
	  $('#modifiedProjectModal').find('.modal-body #projectManager').val(jsonItem.manager);
	  $('#modifiedProjectModal').find('.modal-body #projectStatus').val(jsonItem.status);
	  $('#modifiedProjectModal').find('.modal-body #teamName').val(jsonItem.teamName);
	  $('#modifiedProjectModal').find('.modal-body #centerName').val(jsonItem.centerName);
	  $('#modifiedProjectModal').find('.modal-body #projectContent').val(jsonItem.content);
	  
	  $('#createMileStoneModal').find('.modal-body #projectId').val(jsonItem.id);
	  $('#createMileStoneModal').find('.modal-body #projectName').val(jsonItem.name);
	  $('#createMileStoneModal').find('.modal-body #mileStoneReason').val("프로젝트 : "+jsonItem.name);
	  
	})
	
	$('#viewMileStoneModal').on('shown.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var viewItem = button.data('whatever') // Extract info from data-* attributes
    var modal = $(this);
    var json = viewItem.substr(0, viewItem.length - 1);
    var jsonItem = JSON.parse(json);

    modal.find('.modal-body #mileStoneName').val(jsonItem.name);
    modal.find('.modal-body #mileStoneRegisterDate').val(jsonItem.registerDate);
    modal.find('.modal-body #mileStoneContent').val(jsonItem.content);
    modal.find('.modal-body #mileStoneMember').val(jsonItem.member);
    modal.find('.modal-body #mileStoneManager').val(jsonItem.manager);
    modal.find('.modal-body #projectId').val(jsonItem.id);
    modal.find('.modal-body #deleteMileStoneId').val(jsonItem.id);
  })
  
</script>
<!-- 그래프 데이터 직접 넣는 스크립트-->
<script type="text/javascript">

  /* 긴 문자열은 보기 좋게 미리 선언 */
  html5aroundImg = '<img src="http://html5around.com/wordpress/wp-content/uploads/2016/12/html5around_155px.png" width=155px height=auto>';
  html5aroundMsg = 'RMMS';

  var group = (${allProjectJson});

  var projectnestGroup = new Array()

  var epnestGroup = new Array()
  var enginenestGroup = new Array()

  var qsnestGroup = new Array()
  var covernestGroup = new Array()
  var statsnestGroup = new Array()

  var carnestGroup = new Array()
  var controllernestGroup = new Array()
  var infornestGroup = new Array()
  var bigdatanestGroup = new Array()
  
  var temp = new String();
  var jsonArray = new Array()
  var array = new Array();
  
  /* 그룹별 프로젝트 배열 */
  for (var i in group) {
    if(group[i].group != "" && !projectnestGroup.includes(group[i].group)) {
    		projectnestGroup.push(group[i].group);
    }
    switch (group[i].name) {
      case "ep":
    	  	if(!epnestGroup.includes(group[i].content)) {
    	  		epnestGroup.push(group[i].content)
    	  		//epnestGroup.push(group[i].content+"_mile")
    	  		//console.log(epnestGroup)
    	  		jsonArray.push(JSON.parse('{\"id\" : \"'+ group[i].group + '\", \"content\" : \"' + group[i].content + '\"}'))
    	  	}
        break;
      case "qs":
        if(!qsnestGroup.includes(group[i].content)) {
        		qsnestGroup.push(group[i].content)
        			jsonArray.push(JSON.parse('{\"id\" : \"'+ group[i].group + '\", \"content\" : \"' + group[i].content + '\"}'))
    	  	}
        break;
      case "cover":
        if(!covernestGroup.includes(group[i].content)) {
        		covernestGroup.push(group[i].content)
        			jsonArray.push(JSON.parse('{\"id\" : \"'+ group[i].group + '\", \"content\" : \"' + group[i].content + '\"}'))
    	  	}
        break;
      case "stats":
        if(!statsnestGroup.includes(group[i].content)) {
        		statsnestGroup.push(group[i].content)
        			jsonArray.push(JSON.parse('{\"id\" : \"'+ group[i].group + '\", \"content\" : \"' + group[i].content + '\"}'))
    	  	}
        break;
      case "controller":
        if(!controllernestGroup.includes(group[i].content)) {
        		controllernestGroup.push(group[i].content)
        		jsonArray.push(JSON.parse('{\"id\" : \"'+ group[i].group + '\", \"content\" : \"' + group[i].content + '\"}'))
        }
        break;
      case "infor":
        if(!infornestGroup.includes(group[i].content)) {
        		infornestGroup.push(group[i].content)
        		jsonArray.push(JSON.parse('{\"id\" : \"'+ group[i].group + '\", \"content\" : \"' + group[i].content + '\"}'))
    	  	}
        break;
      case "bigdata":
        if(!bigdatanestGroup.includes(group[i].content)) {
        		bigdatanestGroup.push(group[i].content)
        		jsonArray.push(JSON.parse('{\"id\" : \"'+ group[i].group + '\", \"content\" : \"' + group[i].content + '\"}'))
    	  	}
        break;
      case "engine":
        if(!enginenestGroup.includes(group[i].content)) {
        		enginenestGroup.push(group[i].content)
        		jsonArray.push(JSON.parse('{\"id\" : \"'+ group[i].group + '\", \"content\" : \"' + group[i].content + '\"}'))
    	  	}
        break;
      default:
        break;
    }
  }
  
  /* json 오브젝트 배열 생성 */
  for (var i in group) {
	  if(!array.includes(group[i].group)) {
		  array.push(group[i].group)
		  switch (group[i].name) {
		      case "ep":
		    	  	var str = "[";
		    	 	for(var i in epnestGroup) {
		    	 		var strTmp = "\"" + epnestGroup[i] +"\"";
		    	 		str += strTmp
		    	 		str += ","
		    	 		strTmo = "";
		    	 	}
		    	 	str = str.substring(0, str.length-1)
		    	 	str += "]"
		        var jsob = '{\"id\" :' + '\"ep팀\"' + ', \"content\" : "ep팀" ,' + '\"nestedGroups\" : ' + str + ', \"style\" : \"background-color:#FBF2EF;\", ' + ' \"value\":1}';
		        jsonArray.push(JSON.parse(jsob))
		        jsob = ""
		        break;
		      case "cover":
		    	  	var str = "[";
		    	 	for(var i in covernestGroup) {
		    	 		var strTmp = "\"" + covernestGroup[i] +"\"";
		    	 		str += strTmp
		    	 		str += ","
		    	 		strTmo = "";
		    	 	}
		    	 	str = str.substring(0, str.length-1)
		    	 	str += "]"
		        var jsob = '{\"id\" :' + '\"cover팀\"' + ', \"content\" : "cover팀" ,' + '\"nestedGroups\" : ' + str + ', \"style\" : \"background-color:#FBF2EF;\", ' + ' \"value\":1}';
		        jsonArray.push(JSON.parse(jsob))
		        jsob = ""
		        break;
		      case "stats":
		    	  	var str = "[";
		    	 	for(var i in statsnestGroup) {
		    	 		var strTmp = "\"" + statsnestGroup[i] +"\"";
		    	 		str += strTmp
		    	 		str += ","
		    	 		strTmo = "";
		    	 	}
		    	 	str = str.substring(0, str.length-1)
		    	 	str += "]"
		        var jsob = '{\"id\" :' + '\"stats팀\"' + ', \"content\" : "stats팀" ,' + '\"nestedGroups\" : ' + str + ', \"style\" : \"background-color:#FBF2EF;\", ' + ' \"value\":1}';
		        jsonArray.push(JSON.parse(jsob))
		        jsob = ""
		        break;
		      case "controller":
		    	  	var str = "[";
		    	 	for(var i in controllernestGroup) {
		    	 		var strTmp = "\"" + controllernestGroup[i] +"\"";
		    	 		str += strTmp
		    	 		str += ","
		    	 		strTmo = "";
		    	 	}
		    	 	str = str.substring(0, str.length-1)
		    	 	str += "]"
		        var jsob = '{\"id\" :' + '\"controller팀\"' + ', \"content\" : "controller팀" ,' + '\"nestedGroups\" : ' + str + ', \"style\" : \"background-color:#FBF2EF;\", ' + ' \"value\":1}';
		        jsonArray.push(JSON.parse(jsob))
		        jsob = ""
		        break;
		      case "infor":
		    	  	var str = "[";
		    	 	for(var i in infornestGroup) {
		    	 		var strTmp = "\"" + infornestGroup[i] +"\"";
		    	 		str += strTmp
		    	 		str += ","
		    	 		strTmo = "";
		    	 	}
		    	 	str = str.substring(0, str.length-1)
		    	 	str += "]"
		        var jsob = '{\"id\" :' + '\"infor팀\"' + ', \"content\" : "infor팀" ,' + '\"nestedGroups\" : ' + str + ', \"style\" : \"background-color:#FBF2EF;\", ' + ' \"value\":1}';
		        jsonArray.push(JSON.parse(jsob))
		        jsob = ""
		        break;
		      case "bigdata":
		    	  	var str = "[";
		    	 	for(var i in bigdatanestGroup) {
		    	 		var strTmp = "\"" + bigdatanestGroup[i] +"\"";
		    	 		str += strTmp
		    	 		str += ","
		    	 		strTmo = "";
		    	 	}
		    	 	str = str.substring(0, str.length-1)
		    	 	str += "]"
		        var jsob = '{\"id\" :' + '\"bigdata팀\"' + ', \"content\" : "bigdata팀" ,' + '\"nestedGroups\" : ' + str + ', \"style\" : \"background-color:#FBF2EF;\", ' + ' \"value\":1}';
		        jsonArray.push(JSON.parse(jsob))
		        jsob = ""
		        break;
		      case "engine":
		    	  	var str = "[";
		    	 	for(var i in enginenestGroup) {
		    	 		var strTmp = "\"" + enginenestGroup[i] +"\"";
		    	 		str += strTmp
		    	 		str += ","
		    	 		strTmo = "";
		    	 	}
		    	 	str = str.substring(0, str.length-1)
		    	 	str += "]"
		        var jsob = '{\"id\" :' + '\"engine팀\"' + ', \"content\" : "engine팀" ,' + '\"nestedGroups\" : ' + str + ', \"style\" : \"background-color:#FBF2EF;\", ' + ' \"value\":1}';
		        var flag = true;
		        for(var i in jsonArray) {
		        		if(jsonArray[i].id === JSON.parse(jsob).id) {
		        			console.log("@@@@");
		        			flag = false;
		        		}
		        }
		        if(flag){
		        		jsonArray.push(JSON.parse(jsob))	
		        }
		        jsob = ""
		        break;
		      default:
		        break;
		    }  
	  }
  }
  
  console.log(jsonArray)
  var container = document.getElementById('visualization');
  var groups = new vis.DataSet(jsonArray);
  
  // 각 그룹에 표시할 데이타 생성 및 연결
  var items = new vis.DataSet(${allProjectJson});
  var items2 = ${allMileStoneJson};
  items.add(items2)
  console.log(jsonArray)
  console.log(groups)
  console.log(items)
  console.log(items2)
  //item change log
  items.on('*', function (event, properties) {
    console.log(event, properties.items);
  });

  // 타임라인 옵션
  var options = {
    orientation: {
      axis: 'top',
      item: 'top',

    },
    tooltip: {
      followMouse: true,
    },

    groupOrder: function (a, b) {
      return a.value - b.value;
    },

    //아이템 edit
    //editable:true,
    zoomable: false,
    verticalScroll: true,
    min: '2017-01-01', /*타임라인 시작 지정*/
    max: '2018-12-31', /*타임라인 끝 지정*/
    maxHeight: 1000    /*타임라인 높이 지정, 넘으면 세로 스크롤*/
  }
  
  var timeline = new vis.Timeline(container, items, groups, options);
  
container.onclick = function () {
	var props = timeline.getEventProperties(event)
	//console.log(props);
	console.log(props.item)
	$.ajax({
		   type: "post",
		   url: "/index.do",
		   dataType: 'json',
		   data : {
			   id : props.item
		   },
		   success: function(result) {
		      console.log(result)
	  var modal = $('#viewProjectModal');
	  var jsonItem = result;
	  
	  modal.find('.modal-body #deleteProjectId').val(jsonItem.id);
	  modal.find('.modal-title').text('프로젝트 : ' + jsonItem.name);
	  modal.find('.modal-body #projectName').val(jsonItem.name);
	  modal.find('.modal-body #projectStartTime').val(jsonItem.startTime);
	  modal.find('.modal-body #projectEndTime').val(jsonItem.endTime);
	  modal.find('.modal-body #projectMember').val(jsonItem.member);
	  modal.find('.modal-body #projectManager').val(jsonItem.manager);
	  modal.find('.modal-body #teamName').val(jsonItem.teamName);
	  modal.find('.modal-body #centerName').val(jsonItem.centerName);
	  modal.find('.modal-body #projectContent').val(jsonItem.content);
	  modal.find('.modal-body #projectId').val(jsonItem.id);
	  $('#modifiedProjectModal').find('.modal-title').text('프로젝트 : ' + jsonItem.name + jsonItem.id);
	  $('#modifiedProjectModal').find('.modal-body #projectName').val(jsonItem.name);
	  $('#modifiedProjectModal').find('.modal-body #projectStartTime').val(jsonItem.startTime);
	  $('#modifiedProjectModal').find('.modal-body #projectEndTime').val(jsonItem.endTime);
	  $('#modifiedProjectModal').find('.modal-body #projectMember').val(jsonItem.member);
	  $('#modifiedProjectModal').find('.modal-body #projectReasonr').val(jsonItem.reason);
	  $('#modifiedProjectModal').find('.modal-body #projectManager').val(jsonItem.manager);
	  $('#modifiedProjectModal').find('.modal-body #projectStatus').val(jsonItem.status);
	  $('#modifiedProjectModal').find('.modal-body #teamName').val(jsonItem.teamName);
	  $('#modifiedProjectModal').find('.modal-body #centerName').val(jsonItem.centerName);
	  $('#modifiedProjectModal').find('.modal-body #projectContent').val(jsonItem.content);
	  
	  $('#createMileStoneModal').find('.modal-body #projectId').val(jsonItem.id);
	  $('#createMileStoneModal').find('.modal-body #projectName').val(jsonItem.name);
	  $('#createMileStoneModal').find('.modal-body #mileStoneReason').val("프로젝트 : "+jsonItem.name);
	  
	  $('#viewProjectModal').modal('show')
	  
		   },
		   error: function(error) {
		      console.log(error);
		   }
		});
	
}

</script>

</html>
