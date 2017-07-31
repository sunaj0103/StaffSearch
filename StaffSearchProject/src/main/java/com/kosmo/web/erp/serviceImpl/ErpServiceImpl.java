package com.kosmo.web.erp.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.web.erp.dao.ErpDao;
import com.kosmo.web.erp.dto.CodeReligionDto;
import com.kosmo.web.erp.dto.CodeSchoolDto;
import com.kosmo.web.erp.dto.CodeSkillDto;
import com.kosmo.web.erp.dto.PagingDto;
import com.kosmo.web.erp.dto.SearchDto;
import com.kosmo.web.erp.dto.StaffDto;
import com.kosmo.web.erp.service.ErpService;

@Service("erpService")
public class ErpServiceImpl implements ErpService {
	
	@Resource(name="erpDao")
    private ErpDao erpDao;

	@Override
	public int insertStaff(StaffDto dto) {
		return erpDao.insertStaff(dto);
	}

	@Override
	public void insertStaffSkill(List<Integer> list, int seq) {
		erpDao.insertStaffSkill(list, seq);
	}
	
	@Override
	public int recordCount() {
		return erpDao.recordCount();
	}

	@Override
	public List<StaffDto> selectSearchAll(PagingDto dto) {
		return erpDao.selectSearchAll(dto);
	}

	@Override
	public int recordSearchCount(SearchDto dto) {
		return erpDao.recordSearchCount(dto);
	}

	@Override
	public List<StaffDto> selectSearch(SearchDto dto, PagingDto pageDto) {
		return erpDao.selectSearch(dto, pageDto);
	}

	@Override
	public StaffDto selectOneStaff(int staffNo) {
		return erpDao.selectOneStaff(staffNo);
	}

	@Override
	public void updateStaff(StaffDto dto) {
		erpDao.updateStaff(dto);
	}
	
	@Override
	public void deleteStaff(int staffNo) {
		erpDao.deleteStaff(staffNo);
	}

	@Override
	public void deleteStaffSkill(int staffNo) {
		erpDao.deleteStaffSkill(staffNo);
	}

	@Override
	public List<CodeSchoolDto> selectSchoolList() {
		return erpDao.selectSchoolList();
	}

	@Override
	public List<CodeSkillDto> selectSkillList() {
		return erpDao.selectSkillList();
	}

	@Override
	public List<CodeReligionDto> selectReligionList() {
		return erpDao.selectReligionList();
	}

}
