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
	
	@Select("SELECT * FROM lmms.Project WHERE id=#{id}")
	Project selectOneProject(int projectId);
	
	@Select("SELECT * FROME lmms.Team")
	List<Team> selectTeam();
	
	@Insert("INSERT into lmms.Project(name, content, startTime, endTime, member, reason,"
			+ "manager, registerDate, status, teamName, centerName) VALUES(#{name}, #{content},"
			+ "#{startTime}, #{endTime}, #{member}, #{reason},"
			+ "#{manager}, NOW(), #{status}, #{teamName}, #{centerName})")
	int insertProject(Project project);
	
	@Insert("INSERT into lmms.MileStone(name, registerDate, content, member, manager, reason, "
			+ "status, projectId) VALUES(#{name}, NOW(), #{content}, "
			+ "#{member}, #{manager}, #{reason}, "
			+ "#{status}, #{projectId}) ON DUPLICATE KEY UPDATE "
			+ "name = #{name}, registerDate = NOW(), content = #{content}, member = #{member}, "
			+ "manager = #{manager}, reason = #{reason}, status = #{status}, projectId = #{projectId}")
	int insertMileStone(MileStone mileStone);
	
	@Delete("DELETE FROM lmms.Project WHERE Id = #{id}")
	int deleteProject(int projectId);
	
	@Delete("DELETE FROM lmms.MileStone WHERE Id = #{id}")
	int deleteMileStone(int mileStoneId);
	

}
