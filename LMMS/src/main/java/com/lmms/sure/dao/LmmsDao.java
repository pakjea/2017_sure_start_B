package com.lmms.sure.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;
import com.lmms.sure.vo.Team;



@Repository
@Mapper
public interface LmmsDao {
	
	@Select("SELECT * FROM lmms.Project")
	List<Project> selectProject();
	
	@Select("SELECT * FROM lmms.MileStone")
	List<MileStone> selectMileStone();
	
	@Select("SELECT * FROME lmms.Team")
	List<Team> selectTeam();
	
	@Insert("INSERT into lmms.Project(pName, pContent, pStartTime, pEndTime, pMember, pReason,"
			+ "pManager, pRegisterDate, pStatus, tName, cName) VALUES(#{projectName}, #{projectContent},"
			+ "#{projectStartTime}, #{prjectEndTime}, #{projectMember}, #{projectReason},"
			+ "#{projectManager}, #{projectRegisterDate}, #{projectStatus}, #{teamName}, #{centerName})")
	int insertProject(Project project);
	
	//없으면 인서트 있으면 업데이트 쿼리로 변경
	@Insert("INSERT into lmms.MileStone(mName, mRegisterDate, mMember, mManager, mReason,"
			+ "mStatus, pId) VALUES(#{mileStoneName}, #{mileStoneRegisterDate},"
			+ "#{mileStoneMember}, #{mileStoneManager}, #{mileStoneReason},"
			+ " #{mileStoneStatus}, #{projectId})")
	int insertMileStone(MileStone mileStone);
	
	@Delete("DELETE FROM lmms.Project WHERE pId = #{projectId}")
	int deleteProject(int projectId);
	
	@Delete("DELETE FROM lmms.MileStone WHERE mId = #{mileStoneId}")
	int deleteMileStone(int mileStoneId);
	

}
