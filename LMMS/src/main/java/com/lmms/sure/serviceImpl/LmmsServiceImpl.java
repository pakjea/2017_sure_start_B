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
		return null;
	}

	@Override
	public List<MileStone> getMileStone() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setProject(String projectName, String projectContent, String projectStartTime, 
			String projectEndTime, String projectMember, String projectReason, 
			String projectManager, String projectRegisterDate, String projectStatus, 
			String teamName, String centerName) {
		// TODO Auto-generated method stub
		
		Project param = new Project();
		param.setProjectName(projectName);
		param.setProjectContent(projectContent);
		param.setProjectStartTime(projectStartTime);
		param.setProjectEndTime(projectEndTime);
		param.setProjectMember(projectMember);
		param.setProjectReason(projectReason);
		param.setProjectManager(projectManager);
		param.setProjectRegisterDate(projectRegisterDate);
		param.setProjectStatus(projectStatus);
		param.setTeamName(teamName);
		param.setCenterName(centerName);
		
		return lmmsDao.insertProject(param);
	}

	@Override
	public int setMileStone(String mileStoneName, String mileStoneRegisterDate, String mileStoneMember,
			String mileStoneManager, String mileStoneReason, String mileStoneStatus) {
		// TODO Auto-generated method stub
		return 0;
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
	public int modifiedProject(String projectName, String projectContent, String projectStartTime, 
			String projectEndTime, String projectMember, String projectReason, 
			String projectManager, String projectRegisterDate, String projectStatus, 
			String teamName, String centerName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifiedMileStone(String mileStoneName, String mileStoneRegisterDate, String mileStoneMember,
			String mileStoneManager, String mileStoneReason, String mileStoneStatus) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
