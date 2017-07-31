package com.kosmo.web.erp.dao;

import java.util.List;
import java.util.Map;

import com.kosmo.web.erp.dto.CodeReligionDto;
import com.kosmo.web.erp.dto.CodeSchoolDto;
import com.kosmo.web.erp.dto.CodeSkillDto;
import com.kosmo.web.erp.dto.PagingDto;
import com.kosmo.web.erp.dto.SearchDto;
import com.kosmo.web.erp.dto.StaffDto;

public interface ErpDao {

	public int insertStaff(StaffDto dto);

	public void insertStaffSkill(List<Integer> list, int seq);
	
	public int recordCount();

	public List<StaffDto> selectSearchAll(PagingDto dto);

	public int recordSearchCount(SearchDto dto);

	public List<StaffDto> selectSearch(SearchDto dto, PagingDto pageDto);

	public StaffDto selectOneStaff(int staffNo);

	public void updateStaff(StaffDto dto);
	
	public void deleteStaff(int staffNo);

	public void deleteStaffSkill(int staffNo);

	public List<CodeSchoolDto> selectSchoolList();

	public List<CodeSkillDto> selectSkillList();

	public List<CodeReligionDto> selectReligionList();

}
