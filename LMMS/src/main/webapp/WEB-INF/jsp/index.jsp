<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Kang Site</title>

<html>
  <head>
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
 
  </head>
  <body>
    <div id="timeline" style="height: 500px;"></div>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
  
    
  </body>
</html>
       
	
