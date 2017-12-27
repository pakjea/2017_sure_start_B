package com.lmms.sure.service;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;

import net.minidev.json.JSONArray;

public interface LmmsService {

	Project getOneProject(int id);
	
	List<Project> getProject();

	List<String> getProjectJSON();

	List<String> getMileStoneJSON();
	
	List<String> getProjectJSONForServer();

	List<String> getMileStoneJSONForServer();

	List<MileStone> getMileStone();
	
	List<String> getTeamName();
	
	List<String> getCenterName();

	int setProject(Project model);

	int setMileStone(MileStone mileStone);

	int removeProject(int projectId);

	int removeMileStone(int mileStoneId);
	
	int removeMileStoneInProject(int projectId);

	int modifiedProject(Project model);

	int modifiedMileStone(MileStone mileStone);

}
