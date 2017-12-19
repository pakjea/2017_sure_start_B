package com.lmms.sure.service;

import java.util.List;

import com.lmms.sure.vo.Menu;
import com.lmms.sure.vo.TopRank;


public interface LmmsService {

	//menu
		List<Menu> getMenu();
		
		//Top100 chart
		List<TopRank> getRealTimeChart();
		
		List<TopRank> getRiseChart();
		
		List<TopRank> getDailyChart();
		
		List<TopRank> getWeeklyChart();
		
		List<TopRank> getMonthlyChart();
}
