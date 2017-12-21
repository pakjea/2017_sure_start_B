package com.lmms.sure.serviceImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
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
	public List<JSONObject> getProjectJSON() throws JSONException {
		// TODO Auto-generated method stub
		List<Project> project = new ArrayList<>();
		List<JSONObject> jsonProject = new ArrayList<>();
		
		Gson gson = new Gson();
		project = lmmsDao.selectProject();
		String json;
		Iterator it = project.iterator();
		int i=0;
		while(it.hasNext()) {
			json = gson.toJson(it.next());
			jsonProject.add(new JSONObject(json));
		}
		
		return jsonProject;
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

	
	
	
	
}
