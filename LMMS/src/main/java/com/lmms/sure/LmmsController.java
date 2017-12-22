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
		
		mm.addAttribute("allProjectJsonArray", lmmsService.getProjectJSONArray());
		
		mm.addAttribute("allMileStone", lmmsService.getMileStone());
		
		
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
