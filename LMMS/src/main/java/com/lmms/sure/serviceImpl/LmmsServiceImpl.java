package com.lmms.sure.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
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
	public List<String> getProjectJSON(){
		// TODO Auto-generated method stub
		List<Project> project = new ArrayList<>();
		List<String> jsonProject = new ArrayList<>();
		
		project = lmmsDao.selectProject();
		String json;
		for(Project pro : project) {
			json = "{\"id\":" + pro.getId() + 
					", \"content\": \""+ pro.getName() +
					"\", \"start\": \"" + pro.getStartTime() +
					"\", \"end\": \"" + pro.getEndTime() +
					"\", \"group\": \"" + pro.getTeamName() +
					"\", \"title\": \"" + pro.getContent() + " : " + pro.getReason() +
					"\"}";

			jsonProject.add(json);
			json = "";
		}
		return jsonProject;
	}

	@Override
	public List<String> getMileStoneJSON() {
		// TODO Auto-generated method stub
		List<MileStone> mileStone = new ArrayList<>();
		List<String> mileStoneJson = new ArrayList<>();
	
		mileStone = lmmsDao.selectMileStone();
		String json;
		
		for(MileStone ms : mileStone) {
			json = "{\"id\": \"" + "m" + ms.getId() +
					"\", \"start\": \"" + ms.getRegisterDate() +
					"\", \"group\": \"" + lmmsDao.selectOneProject(ms.getProjectId()) + "_p1_mile" +
					"\", \"title\": \"" + ms.getContent() + " : " + ms.getReason() +
					"\", \"style\":\"border-color: black; color: black; background-color:black; " +
					"\", \"type\":\"\"}";
			mileStoneJson.add(json);
			json ="";
		}
		return mileStoneJson;
	}	

	
	@Override
	public List<MileStone> getMileStone() {
		// TODO Auto-generated method stub
		return lmmsDao.selectMileStone();
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
		return lmmsDao.deleteProject(projectId);
	}

	@Override
	public int removeMileStone(int mileStoneId) {
		return lmmsDao.deleteMileStone(mileStoneId);
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

	@Override
	public List<String> getTeamName() {
		// TODO Auto-generated method stub
		return lmmsDao.selectTeam();
	}

	@Override
	public List<String> getCenterName() {
		// TODO Auto-generated method stub
		return lmmsDao.selectCenter();
	}

	@Override
	public List<String> getProjectJSONForServer() {
		// TODO Auto-generated method stub
		List<Project> project = new ArrayList<>();
		List<String> projectJson = new ArrayList<>();
		Gson gson = new Gson();
		
		project = lmmsDao.selectProject();
		String json;
		for(Project pro : project) {
			json = gson.toJson(pro);
			projectJson.add(json);
			json ="";
		}
		return projectJson;
	}

	@Override
	public List<String> getMileStoneJSONForServer() {
		// TODO Auto-generated method stub
		List<MileStone> mileStone = new ArrayList<>();
		List<String> mileStoneJson = new ArrayList<>();
		Gson gson = new Gson();
		
		mileStone = lmmsDao.selectMileStone();
		String json;

		for(MileStone ms : mileStone) {
			json = "{\"id\":\"" + "m" + ms.getId() +
					"\",\"name\":\"" + ms.getName() +
					"\",\"registerDate\":\"" + ms.getRegisterDate() +
					"\",\"content\":\"" + ms.getContent() + 
					"\",\"member\":\"" + ms.getMember() + 
					"\",\"manager\":\"" + ms.getManager() + 
					"\",\"reason\":\"" + ms.getReason() + 
					"\",\"status\":\"" + ms.getStatus() + 
					"\",\"projectId\":\"" + ms.getProjectId() + 
					"\"}";
			mileStoneJson.add(json);
			json ="";
		}
		return mileStoneJson;
	}

	@Override
	public int removeMileStoneInProject(int projectId) {
		// TODO Auto-generated method stub
		return lmmsDao.deleteMileStoneInProject(projectId);
	}

	

}
