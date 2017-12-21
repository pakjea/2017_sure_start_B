package com.lmms.sure;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmms.sure.service.LmmsService;
import com.lmms.sure.vo.Project;


@Controller
public class LmmsController {
	
	@Autowired
	private LmmsService lmmsService;
	
	@RequestMapping(value="/")
	public String index(HttpServletRequest request,
			HttpServletResponse response,
			ModelMap mm){
		
		mm.addAttribute("allProject", lmmsService.getProject());
		
		return "index";
	}
	
	@RequestMapping(value="/insertProject")
	public String insertProject(HttpServletRequest request,
			HttpServletResponse response,
			ModelMap mm,
			Project model) {
		
		if(model.getName() != null)
			lmmsService.setProject(model);
		
		return "index";
	}
	
	
	
}
