package com.lmms.sure.service;

import java.util.List;

import org.json.JSONException;

import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;

import net.minidev.json.JSONArray;

public interface LmmsService {

	List<Project> getProject();

	List<String> getProjectJSON() throws JSONException;

	List<String> getMileStoneJSON();

	JSONArray getProjectJSONArray();

	List<MileStone> getMileStone();

	int setProject(Project modal);

	int setMileStone(MileStone mileStone);

	int removeProject(int projectId);

	int removeMileStone(int mileStoneId);

	int modifiedProject(Project modal);

	int modifiedMileStone(MileStone mileStone);

}
