<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

<head>


<meta charset="utf-8">
<<<<<<< HEAD
<title>RoadMap Management System</title>
<!-- <link href="../../static/css/manager/body.css" rel="stylesheet"> -->

<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/vue@2.4.2"></script>

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
	
</script>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
			
			<div id="timeline" style="height: 500px;"></div>
   			<div id="chart_div" style="width: 900px; height: 500px;"></div>
			
			<div class="row">
			<div class="col-6"></div>
			<button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#createProjectModal" data-whatever="hello world">프로젝트 생성</button>
			<button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modifiedProjectModal" data-whatever="hello world">프로젝트 수정</button>
			<button class="col-2" type="button" class="btn btn-primary" data-toggle="modal" data-target="#createMileStoneModal" data-whatever="hello world">마일스톤 생성</button>
			</div>
			
			
				<ul data-role="listview" data-split-icon="gear" data-split-theme="a" data-inset="true" data-filter="true" data-filter-placeholder="Search title">
					<c:forEach var="item" items="${allProject}" varStatus="status">
					    <li id="li-"><div data-toggle="modal" data-target="#viewProjectModal" data-whatever="${item.id}"><a v-on:click="change('')">
					    <h2>${item.content}</h2>
					    <p>${item.name}</p></a></div>
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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['timeline']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var container = document.getElementById('timeline');
        var chart = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();

        dataTable.addColumn({ type: 'string', id: 'Project' });
		dataTable.addColumn({ type: 'string', id: 'Name' });
		dataTable.addColumn({ type: 'date', id: 'Start' });
		dataTable.addColumn({ type: 'date', id: 'End' });
		
		var project = 'Project1';    
		dataTable.addRows([
     	['MONTH', '1월', new Date(2016, 11, 01), new Date(2017, 00, 01) ],
     	['MONTH', '2월', new Date(2017, 00, 01), new Date(2017, 01, 01) ],
     	['MONTH', '3월', new Date(2017, 01, 01), new Date(2017, 02, 01) ],
     	['MONTH', '4월', new Date(2017, 02, 01), new Date(2017, 03, 01) ],
     	['MONTH', '5월', new Date(2017, 03, 01), new Date(2017, 04, 01) ],
     	['MONTH', '6월', new Date(2017, 04, 01), new Date(2017, 05, 01) ],
     	['MONTH', '7월', new Date(2017, 05, 01), new Date(2017, 06, 01) ],
     	['MONTH', '8월', new Date(2017, 06, 01), new Date(2017, 07, 01) ],
     	['MONTH', '9월', new Date(2017, 07, 01), new Date(2017, 08, 01) ],
     	['MONTH', '10월', new Date(2017, 08, 01), new Date(2017, 09, 01) ],
     	['MONTH', '11월', new Date(2017, 09, 01), new Date(2017, 10, 01) ],
     	['MONTH', '12월', new Date(2017, 10, 01), new Date(2017, 11, 01) ],
    
    	['Project1', 'first', new Date(2017, 3, 30), new Date(2017, 5, 15) ],
    	['Project1', 'second', new Date(2017, 5, 1), new Date(2017, 7, 4) ],
    	['Project2', 'first', new Date(2017, 3, 30), new Date(2017, 5, 15) ],
    	['Project2', 'second', new Date(2017, 3, 30), new Date(2017, 5, 15) ],
    	['Project3', 'first', new Date(2017, 3, 30), new Date(2017, 5, 15) ],
    	['Project3', 'second', new Date(2017, 3, 10), new Date(2017, 7,1 ) ],
    	['Project4', 'first', new Date(2017, 3, 10), new Date(2017, 7,1 ) ],
    	['Project4', 'second', new Date(2017, 4, 10), new Date(2017, 7,1 ) ],
    	['Project4', 'third', new Date(2017, 5, 10), new Date(2017, 9,1 ) ],
    	
     	]);
     	var options = {
  		timeline: { groupByRowLabel: true, colorByRowLabel:false},
     	colors:['#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF'
     		, '#00BFFF','#F08080','#FF0000']
		};
     	
     	
        chart.draw(dataTable, options);
     
      }
    </script>
    
 
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable
          ([['X', '1', '2', '3', '4', '5', '6'],
            [1, 2, null, null, null, null, null],
            [2, null, 3, null, null, null, null],
            [3, null, null, 4, null, null, null],
            [4, null, null, null, 5, null, null],
            [5, null, null, null, null, 6, null],
            [6, null, null, null, null, null, 7]
      ]);

      var options = {
        legend: 'none',
        pointSize: 30,
        series: {
              0: { pointShape: 'circle' },
              1: { pointShape: 'triangle' },
              2: { pointShape: 'square' },
              3: { pointShape: 'diamond' },
              4: { pointShape: 'star' },
              5: { pointShape: 'polygon' }
          }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);;
  }
    
    </script>

</body>



</html>