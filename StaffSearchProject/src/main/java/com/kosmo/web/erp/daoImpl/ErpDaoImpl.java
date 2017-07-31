package com.kosmo.web.erp.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.web.erp.dao.ErpDao;
import com.kosmo.web.erp.dto.CodeReligionDto;
import com.kosmo.web.erp.dto.CodeSchoolDto;
import com.kosmo.web.erp.dto.CodeSkillDto;
import com.kosmo.web.erp.dto.PagingDto;
import com.kosmo.web.erp.dto.SearchDto;
import com.kosmo.web.erp.dto.StaffDto;

@Repository("erpDao")
public class ErpDaoImpl implements ErpDao {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertStaff(StaffDto dto) {
		return sqlSession.insert("erp.insertStaff", dto);
	}

	@Override
	public void insertStaffSkill(List<Integer> list, int seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("seq", seq);
		sqlSession.insert("erp.insertStaffSkill", map);
	}
	
	@Override
	public int recordCount() {
		return (Integer)sqlSession.selectOne("erp.recordCount");
	}

	@Override
	public List<StaffDto> selectSearchAll(PagingDto dto) {
		return sqlSession.selectList("erp.selectSearchAll", dto);
	}

	@Override
	public int recordSearchCount(SearchDto dto) {
		return (Integer)sqlSession.selectOne("erp.recordSearchCount", dto);
	}

	@Override
	public List<StaffDto> selectSearch(SearchDto dto, PagingDto pageDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		map.put("pageDto", pageDto);
		return sqlSession.selectList("erp.selectSearch", map);
	}

	@Override
	public StaffDto selectOneStaff(int staffNo) {
		return sqlSession.selectOne("erp.selectOneStaff", staffNo);
	}

	@Override
	public void updateStaff(StaffDto dto) {
		sqlSession.update("erp.updateStaff", dto);
	}


	@Override
	public void deleteStaff(int staffNo) {
		sqlSession.delete("erp.deleteStaff", staffNo);
	}
	
	@Override
	public void deleteStaffSkill(int staffNo) {
		sqlSession.delete("erp.deleteStaffSkill", staffNo);
	}

	@Override
	public List<CodeSchoolDto> selectSchoolList() {
		return sqlSession.selectList("erp.selectSchoolList");
	}

	@Override
	public List<CodeSkillDto> selectSkillList() {
		return sqlSession.selectList("erp.selectSkillList");
	}

	@Override
	public List<CodeReligionDto> selectReligionList() {
		return sqlSession.selectList("erp.selectReligionList");
	}

}
