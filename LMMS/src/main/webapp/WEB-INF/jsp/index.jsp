<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Kang Site</title>


  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['timeline']});
      google.charts.setOnLoadCallback(drawChart);
  	function over(){
		alert("mouse over");
		
		
	}
	function out(){
		alert("mouse out");
	}
	
      function drawChart() {
    	  var container = document.getElementById('timeline-tooltip');
        var chart = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();

        dataTable.addColumn({ type: 'string', id: 'Project' });
		dataTable.addColumn({ type: 'string', id: 'Name' });
		dataTable.addColumn({ type: 'date', id: 'Start' });
		dataTable.addColumn({ type: 'date', id: 'End' });
		
		var project = 'Project1';  
		
		//사용자 정의 툴팁 위한 col
		dataTable.addcolumn({type:'string',role:'tooltip'});
		
	
		dataTable.addRows([
     	['MONTH' ,'1월', new Date(2016, 11, 01), new Date(2017, 00, 01), 'ㄴㅇㄹ'],
     	]);
		
		
		
     	var options = {
  		timeline: { groupByRowLabel: true, colorByRowLabel:false},
     	colors:['#00BFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF','#FFFFFF'
     		, '#00BFFF','#F08080','#FF0000']
		};
     	
     	var chart 
     	
        chart.draw(dataTable, options);
        
     
      }
    </script>

 
  </head>
  <body>


  
    <div id="timeline-tooltip" style="height: 500px;"></div>
    
  
    
  </body>
</html>
       
	
