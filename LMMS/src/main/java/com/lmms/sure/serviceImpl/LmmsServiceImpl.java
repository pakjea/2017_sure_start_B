package com.lmms.sure.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lmms.sure.dao.LmmsDao;
import com.lmms.sure.service.LmmsService;
import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;

import net.minidev.json.JSONArray;

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
	public List<String> getProjectJSON() throws JSONException {
		// TODO Auto-generated method stub
		List<Project> project = new ArrayList<>();
		List<String> jsonProject = new ArrayList<>();
		
		project = lmmsDao.selectProject();
		String json;
		for(Project pro : project) {
			json = "{\"id\":" + pro.getId() + 
					", \"content\": \""+ pro.getContent() +
					"\", \"start\": \"" + pro.getStartTime() +
					"\", \"end\": \"" + pro.getEndTime() +
					"\", \"group\": \"" + pro.getTeamName() +
					"\", \"title\": \"" + pro.getContent() + " : " + pro.getReason() +
					"\"}";

			jsonProject.add(json);
			json ="";
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
	public JSONArray getProjectJSONArray() {
		// TODO Auto-generated method stub
		return null;
	}

}
