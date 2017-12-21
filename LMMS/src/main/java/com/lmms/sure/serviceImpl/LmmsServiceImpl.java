package com.lmms.sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lmms.sure.dao.LmmsDao;
import com.lmms.sure.service.LmmsService;
import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;

@Service
public class LmmsServiceImpl implements LmmsService{

	@Autowired
	private LmmsDao lmmsDao;

	@Override
	public List<Project> getProject() {
		// TODO Auto-generated method stub
		return lmmsDao.selectProject();
	}

	@Override
	public List<MileStone> getMileStone() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setProject(Project project) {
		// TODO Auto-generated method stub
		return lmmsDao.insertProject(project);
	}

	@Override
	public int setMileStone(MileStone mileStone) {
		// TODO Auto-generated method stub
		return lmmsDao.insertMileStone(mileStone);
	}

	@Override
	public int removeProject(int projectId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeMileStone(int mileStoneId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifiedProject(Project project) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifiedMileStone(MileStone mileStone) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
