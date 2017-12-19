package com.lmms.sure.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.lmms.sure.vo.Menu;
import com.lmms.sure.vo.TopRank;



@Repository
@Mapper
public interface LmmsDao {
	//menu
	@Select("SELECT * FROM admin.menu")
	List<Menu> getMenu();
	
	//Top100 chart
	@Select("SELECT * FROM admin.realTimeTopRank")
	List<TopRank> getRealTimeChart();
	
	@Select("SELECT * FROM admin.riseTopRank")
	List<TopRank> getRiseChart();
	
	@Select("SELECT * FROM admin.dailyTopRank")
	List<TopRank> getDailyChart();
	
	@Select("SELECT * FROM admin.weeklyTopRank")
	List<TopRank> getWeeklyChart();
	
	@Select("SELECT * FROM admin.monthlyTopRank")
	List<TopRank> getMonthlyChart();

}
