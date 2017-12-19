package com.lmms.sure.service;

import java.util.List;

import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;


public interface LmmsService {

	List<Project> getProject();
	
	List<MileStone> getMileStone();
	
	int setProject(String projectName, String projectContent,String projectEndTime, 
			String projectMember, String projectReason, String projectManager,
			String projectRegisterDate, String projectStatus, String teamName,
			String centerName);
	
	int setMileStone(String mileStoneName, String mileStoneRegisterDate, String mileStoneMember,
			String mileStoneManager, String mileStoneReason, String mileStoneStatus);
	
	int removeProject(int projectId);
	
	int removeMileStone(int mileStoneId);
	
	int modifiedProject(String projectName, String projectContent,String projectEndTime, 
			String projectMember, String projectReason, String projectManager,
			String projectRegisterDate, String projectStatus, String teamName,
			String centerName);
	
	int modifiedMileStone(String mileStoneName, String mileStoneRegisterDate, String mileStoneMember,
			String mileStoneManager, String mileStoneReason, String mileStoneStatus);
	
}
