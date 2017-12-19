package com.lmms.sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lmms.sure.dao.LmmsDao;
import com.lmms.sure.service.LmmsService;
import com.lmms.sure.vo.TopRank;
import com.lmms.sure.vo.Menu;

@Service
public class LmmsServiceImpl implements LmmsService{

	@Autowired
	private LmmsDao lmmsDao;
	
	
	//menu
	@Override
	public List<Menu> getMenu(){
		return lmmsDao.getMenu();
	}
	
	// Top100 chart 
	@Override
	public List<TopRank> getRealTimeChart() {
		return lmmsDao.getRealTimeChart();
	}

	@Override
	public List<TopRank> getRiseChart() {
		return lmmsDao.getRiseChart();
	}

	@Override
	public List<TopRank> getDailyChart() {
		return lmmsDao.getDailyChart();
	}

	@Override
	public List<TopRank> getWeeklyChart() {
		return lmmsDao.getWeeklyChart();
	}

	@Override
	public List<TopRank> getMonthlyChart() {
		return lmmsDao.getMonthlyChart();
	}
}
