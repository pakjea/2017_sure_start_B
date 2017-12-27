package com.lmms.sure;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmms.sure.service.LmmsService;
import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;



@Controller
public class LmmsController {
	
	private static final Logger logger = LoggerFactory
			.getLogger(LmmsController.class);
	
	@Autowired
	private LmmsService lmmsService;
	
	@RequestMapping(value="/")
	public String index(HttpServletRequest request,
			HttpServletResponse response,
			ModelMap mm) throws ParseException {
		
		logger.debug("index");
		logger.info("index");


		mm.addAttribute("allProject", lmmsService.getProject());		

		mm.addAttribute("allProjectJson",lmmsService.getProjectJSON());
	
		mm.addAttribute("allMileStoneJson", lmmsService.getMileStoneJSON());

		mm.addAttribute("allMileStone", lmmsService.getMileStone());

		mm.addAttribute("allTeam", lmmsService.getTeamName());
		
		mm.addAttribute("allCenter", lmmsService.getCenterName());
		
		mm.addAttribute("all", getAllJSON());
		
		return "index";
	}
	
	@RequestMapping(value="/insertProject")
	public String insertProject(HttpServletRequest request,
			HttpServletResponse response,
			ModelMap mm,
			Project model) {
		
		logger.debug("insertProject");
		logger.info("insertProject");
		
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
		
		logger.debug("insertMileStone");
		logger.info("insertMileStone");
		
		if(model.getName() != null) {
			lmmsService.setMileStone(model);
		}
		
		return "redirect:index";
	}
	
	@RequestMapping(value="/updateProject")
	public String updateProject(HttpServletRequest request,
			HttpServletResponse response,
			Project model) {
		
		logger.debug("updateProject");
		logger.info("updateProject");
		
		if(model.getName() != null)
			lmmsService.setProject(model);
		
		return "index";
	}
	
	@RequestMapping(value="/deleteProject")
	public String deleteProject(HttpServletRequest request,
			HttpServletResponse response, String projectId) {
		
		logger.debug("deleteProject");
		logger.info("deleteProject");
		
		lmmsService.removeProject(Integer.parseInt(projectId));
		
		return "index";
	}
	
	@RequestMapping(value="/updateMileStone")
	public String updateMilestone(HttpServletRequest request,
			HttpServletResponse response,
			MileStone model) {
		
		logger.debug("updateMileStone");
		logger.info("updateMileStone");
		
		if(model.getName() != null)
			lmmsService.setMileStone(model);
		
		return "index";
	}

	@RequestMapping(value="/deleteMileStone")
	public String deleteMilestone(HttpServletRequest request,
			HttpServletResponse response, String mileStoneId) {
		
		logger.debug("deleteMileStone");
		logger.info("deleteMileStone");
		
		//마일스톤을 구분할 수 있도록 id 앞에 붙여놓은 m 문자 제거
		lmmsService.removeProject(Integer.parseInt(mileStoneId.substring(1)));
		
		return "index";
	}
	
	//모든 프로젝트와 마일스톤을 시간순으로 정렬한 JSONObject를  ArrayList형태로 받아오기
	public List<JSONObject> getAllJSON() throws ParseException{
		List<String> pro = lmmsService.getProjectJSONForServer();
		List<String> mile = lmmsService.getMileStoneJSONForServer();
		
		for(String ms : mile) {
			pro.add(ms);
		}
		
		pro.sort(new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {

				String valA = o1.split(",\"registerDate\":\"")[1].split("\",")[0];
				String valB = o2.split(",\"registerDate\":\"")[1].split("\",")[0];

	            return valA.compareTo(valB);
			}
			
		});
	
		List<String> a = new ArrayList<>();
		a = pro;
		List<JSONObject> temp = new ArrayList<>();
		JSONParser parser = new JSONParser();
		
		for(int i=0; i<a.size(); i++) {
			Object temp1 = parser.parse(a.get(i));
			temp.add((JSONObject) temp1);
		}
		return temp;
	}
}
