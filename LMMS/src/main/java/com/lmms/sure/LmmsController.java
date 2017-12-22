package com.lmms.sure;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmms.sure.service.LmmsService;
import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;


@Controller
public class LmmsController {
	
	@Autowired
	private LmmsService lmmsService;
	
	@RequestMapping(value="/")
	public String index(HttpServletRequest request,
			HttpServletResponse response,
			ModelMap mm) throws JSONException{
		
		mm.addAttribute("allProject", lmmsService.getProject());
		
		mm.addAttribute("allProjectJson",lmmsService.getProjectJSON());
		
		String a = "[" + 
				"  {id: 1, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: \"cssdf\", title:'아아앙'},\r\n" + 
				"  {id: 2, content: 'start', start: '2017-03-01', end: '2017-03-30', group: \"engine\", title:'start: 2017-03-01  end: 2017-03-30'},\r\n" + 
				"  {id: 3, content: 'second', start: '2017-03-15', end: '2017-03-28', group: \"engine\", title:'start: 2017-03-15  end: 2017-03-28'},\r\n" + 
				"  {id: 4, content: 'start', start: '2017-08-15', end: '2017-10-28', group: \"ep\", title:'start: 2017-03-15  end: 2017-03-28'},\r\n" + 
				"  {id: 5, content: 'second', start: '2017-11-15', end: '2017-12-28', group: \"ep\", title:'start: 2017-03-15  end: 2017-03-28'},\r\n" + 
				"  {id: 6, content: 'third', start: '2017-01-15', end: '2017-02-28', group: \"ep\", title:'start: 2017-03-15  end: 2017-03-28'},\r\n" + 
				"  {id: 7, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: \"carsolsdf\", title:'아아앙'},\r\n" + 
				"  {id: 8, content: 'start', start: '2017-03-15', end: '2017-05-28', group: \"controller\", title:'start: 2017-03-15  end: 2017-03-28'},\r\n" + 
				"  {id: 9, content: 'start', start: '2017-03-15', end: '2017-05-28', group: \"infor\", title:'start: 2017-03-15  end: 2017-03-28'},\r\n" + 
				"  {id: 10, content: html5aroundMsg, editable: true, start: '2017-03-01', end:'2022-12-31', group: \"qssdf\", title:'아아앙'},\r\n" + 
				"  {id: 11, content: 'start', start: '2017-05-01',end: '2017-05-28', group: \"corver\", title:'인원변동'},\r\n" + 
				"  {id: 12, content: 'start', start: '2017-03-27', group: \"stats\", title:'인원변동', type : 'point'},\r\n" + 
				"]";
		
		mm.addAttribute("a", a);
		
		return "index";
	}
	
	@RequestMapping(value="/insertProject")
	public String insertProject(HttpServletRequest request,
			HttpServletResponse response,
			ModelMap mm,
			Project model) {
		
		if(model.getName() != null) {
			lmmsService.setProject(model);
		}
		
		return "redirect:index";
	}
	
	@RequestMapping(value="/insertMileStone")
	public String insertMileStone(HttpServletRequest request,
			HttpServletResponse response,
			ModelMap mm,
			MileStone model) {
		
		if(model.getName() != null) {
			lmmsService.setMileStone(model);
		}
		
		return "redirect:index";
	}
	
	@RequestMapping(value="/updateProject")
	public String updateProject(HttpServletRequest request,
			HttpServletResponse response,
			Project model) {
		
		if(model.getName() != null)
			lmmsService.setProject(model);
		
		return "index";
	}
	
	@RequestMapping(value="/deleteProject")
	public String deleteProject(HttpServletRequest request,
			HttpServletResponse response, String projectId) {
		
		lmmsService.removeProject(Integer.parseInt(projectId));
		
		return "index";
	}
	
	@RequestMapping(value="/updateMileStone")
	public String updateMilestone(HttpServletRequest request,
			HttpServletResponse response,
			MileStone model) {
		
		if(model.getName() != null)
			lmmsService.setMileStone(model);
		
		return "index";
	}


	@RequestMapping(value="/deleteMileStone")
	public String deleteMilestone(HttpServletRequest request,
			HttpServletResponse response, String mileStoneId) {
		
		lmmsService.removeProject(Integer.parseInt(mileStoneId));
		
		return "index";
	}
}
