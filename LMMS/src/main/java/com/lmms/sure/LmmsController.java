package com.lmms.sure;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmms.sure.service.LmmsService;
import com.lmms.sure.vo.TopRank;


@Controller
public class LmmsController {
	
	@Autowired
	private LmmsService lmmsService;
	
	List<TopRank> realTime;
	
	@RequestMapping(value="/")
	public String index(HttpServletRequest request,
			HttpServletResponse response,
			ModelMap mm){
		
		realTime = lmmsService.getRealTimeChart();
		mm.addAttribute("menu", lmmsService.getMenu());
		mm.addAttribute("realTimeChart", realTime);
		mm.addAttribute("playList", getPlayList(realTime));
		
		return "index";
	}
	
	//make top 100 chart playlist
	public String getPlayList(List<TopRank> chart){
		String allChart = "https://www.youtube.com/embed/";
		boolean checkFirst = true;
		for(Iterator<TopRank> itr = realTime.iterator(); itr.hasNext();){
			if(checkFirst == true){
				allChart += itr.next().getUrl().split("/embed/")[1] + "?rel=0&autoplay=1;playlist=";
				checkFirst = false;
			}
			allChart += itr.next().getUrl().split("/embed/")[1] + ",";
		}		
		allChart = allChart.substring(0, allChart.length() - 1);
		
		return allChart;
	}
	
}
