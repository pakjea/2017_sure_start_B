package com.lmms.sure;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	/*	
		realTime = lmmsService.getRealTimeChart();
		mm.addAttribute("menu", lmmsService.getMenu());
		mm.addAttribute("realTimeChart", realTime);
		mm.addAttribute("playList", getPlayList(realTime));*/
		
		return "index";
	}
	
}
