<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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



</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
			
			<jsp:include page="./timeline2.jsp"></jsp:include>
			
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

			<button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#createProjectModal" data-whatever="hello world">프로젝트 생성</button>

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
        <form action="/updateProject" method="post">
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
            <input type="text" class="form-control" id="projectName" name="name" value="${allProject[0].name}" disabled>
            <label for="projectStartTime" class="col-form-label">시작 날짜</label>
            <input type="text" class="form-control" id="projectStartTime" name= "startTime" value="${allProject[0].startTime}" disabled>
            <label for="projectEndTime" class="col-form-label">종료 날짜</label>
            <input type="text" class="form-control" id="projectEndTime" name ="endTime" value="${allProject[0].endTime}" disabled>
            <label for="projectMember" class="col-form-label">프로젝트 인원</label>
            <input type="text" class="form-control" id="projectMember" name ="member" value="${allProject[0].member}" disabled>
            <label for="projectManager" class="col-form-label">담당자</label>
            <input type="text" class="form-control" id="projectManager" name ="manager" value="${allProject[0].manager}" disabled>
            <label for="teamName" class="col-form-label">팀 이름</label>
            <input type="text" class="form-control" id="teamName" name="teamName" value="${allProject[0].teamName}" disabled>
            <label for="centerName" class="col-form-label">센터(실) 이름</label>
            <input type="text" class="form-control" id="centerName" name ="centerName" value="${allProject[0].centerName}" disabled>
            <input type="hidden" id="projectStatus" name="status" value="N">
          </div>
          <div class="form-group">
            <label for="projectContent" class="col-form-label">프로젝트 내용</label>
            <textarea class="form-control" id="projectContent" name="content" disabled></textarea>
          </div>
          
          <div class="modal-footer">
        <button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modifiedProjectModal" data-whatever="${allProject[0]}" data-dismiss="modal">프로젝트 수정</button>
        <button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#createMileStoneModal" data-dismiss="modal">마일스톤 등록</button>
        
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
            <input type="text" class="form-control" name="projectId">
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
            <textarea class="form-control" name="reason"></textarea>
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
				
				

			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
	

	$('#createMileStoneModal').on('show.bs.modal', function (event) {
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
	  var viewItem = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('프로젝트 : ' + viewItem)
	  modal.find('.modal-body #projectName').val(viewItem)
	  modal.find('.modal-body #projectStartTime').val(viewItem)
	  modal.find('.modal-body #projectEndTime').val(viewItem)
	  modal.find('.modal-body #projectMember').val(viewItem)
	  modal.find('.modal-body #projectManager').val(viewItem)
	  modal.find('.modal-body #teamName').val(viewItem)
	  modal.find('.modal-body #centerName').val(viewItem)
	  modal.find('.modal-body #projectContent').val(viewItem)
	})
	
	$('#viewProjectModal').on('shown.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this);
	  modal.find('.modal-title').text('프로젝트 : ' + viewItem);
	  modal.find('.modal-body #projectName').val(viewItem);
	  modal.find('.modal-body #projectStartTime').val(viewItem);
	  modal.find('.modal-body #projectEndTime').val(viewItem);
	  modal.find('.modal-body #projectMember').val(viewItem);
	  modal.find('.modal-body #projectManager').val(viewItem);
	  modal.find('.modal-body #teamName').val(viewItem);
	  modal.find('.modal-body #centerName').val(viewItem);
	  modal.find('.modal-body #projectContent').val(viewItem);

	})
	
</script>
	
