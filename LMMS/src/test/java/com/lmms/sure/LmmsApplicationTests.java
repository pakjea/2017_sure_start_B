package com.lmms.sure;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.lmms.sure.service.LmmsService;
import com.lmms.sure.vo.MileStone;
import com.lmms.sure.vo.Project;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LmmsApplicationTests {
	@Autowired
	LmmsService lmmsService;
	
	public boolean testCreateProject() {
		Project cs = new Project();
		cs.setName("Code Test");
		cs.setContent("설명");
		cs.setStartTime("2017-01-01");
		cs.setEndTime("2017-05-05");
		cs.setMember("5");
		cs.setReason("비고");
		cs.setManager("최선호");
		cs.setRegisterDate("2017-12-12");
		cs.setStatus("N");
		cs.setTeamName("CS");
		cs.setCenterName(null);
		
		lmmsService.setProject(cs);
		for(Project tmpProject : lmmsService.getProject()) {
			if(tmpProject.getName().equals(cs.getName())) {
				return true;
			}
		}
		return false;
	}
	
	public boolean testDeleteProject() {
		int projectId = -1;
		for(Project tmpProject : lmmsService.getProject()) {
			if(tmpProject.getName().equals("Code Test")) {
				projectId = tmpProject.getId();
			}
		}
		
		lmmsService.removeProject(projectId);
		
		for(Project tmpProject : lmmsService.getProject()) {
			if(tmpProject.getName().equals("Code Test")) {
				return true;
			}
		}
		return false;
	}
	
	public boolean testCreateMileStone() {
		MileStone ms = new MileStone();
		ms.setName("1월 마일스톤");
		ms.setRegisterDate("2017-01-01");
		ms.setMember("5");
		ms.setManager("최선호");
		ms.setReason(null);
		ms.setStatus("N");
		ms.setProjectId(1);
		
		lmmsService.setMileStone(ms);
		
		for(MileStone tmpMileStone : lmmsService.getMileStone()) {
			if(tmpMileStone.getName().equals(ms.getName())) {
				return true;
			}
		}
		return false;
	}
	
	public boolean testDeleteMileStone() {
		int mileStoneId = -1;
		for(MileStone tmpMileStone : lmmsService.getMileStone()) {
			if(tmpMileStone.getName().equals("1월 마일스톤")) {
				mileStoneId = tmpMileStone.getId();
			}
		}
		
		lmmsService.removeProject(mileStoneId);
		
		for(MileStone tmpMileStone : lmmsService.getMileStone()) {
			if(tmpMileStone.getName().equals("1월 마일스톤")) {
				return true;
			}
		}
		return false;
	}
	
	@Test
	public void contextLoads() {
		assertEquals(true, testCreateProject());
	}
	
	@Test
	public void contextLoads2() {
		assertEquals(true, testDeleteProject());
	}
	
	@Test
	public void contextLoads3() {
		assertEquals(true, testCreateMileStone());
	}
	
	@Test
	public void contextLoads4() {
		assertEquals(true, testDeleteMileStone());
	}
	
	

}
