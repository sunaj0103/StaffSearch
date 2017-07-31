package com.kosmo.web.erp.service;

import java.util.List;
import java.util.Map;

import com.kosmo.web.erp.dto.CodeReligionDto;
import com.kosmo.web.erp.dto.CodeSchoolDto;
import com.kosmo.web.erp.dto.CodeSkillDto;
import com.kosmo.web.erp.dto.PagingDto;
import com.kosmo.web.erp.dto.SearchDto;
import com.kosmo.web.erp.dto.StaffDto;

public interface ErpService {

	//입력
	public abstract int insertStaff(StaffDto dto);

	public abstract void insertStaffSkill(List<Integer> list, int seq);
	
	//검색
	public abstract int recordCount();
		
	public abstract List<StaffDto> selectSearchAll(PagingDto dto);

	public abstract int recordSearchCount(SearchDto dto);

	public abstract List<StaffDto> selectSearch(SearchDto dto, PagingDto pageDto);

	public abstract StaffDto selectOneStaff(int staffNo);

	//수정
	public abstract void updateStaff(StaffDto dto);

	//삭제
	public abstract void deleteStaff(int staffNo);
	
	public abstract void deleteStaffSkill(int staffNo);

	//code list
	public abstract List<CodeSchoolDto> selectSchoolList();

	public abstract List<CodeSkillDto> selectSkillList();

	public abstract List<CodeReligionDto> selectReligionList();

}
