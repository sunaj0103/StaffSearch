package com.kosmo.web.erp.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.web.erp.dto.CodeReligionDto;
import com.kosmo.web.erp.dto.CodeSchoolDto;
import com.kosmo.web.erp.dto.CodeSkillDto;
import com.kosmo.web.erp.dto.PagingDto;
import com.kosmo.web.erp.dto.SearchDto;
import com.kosmo.web.erp.dto.StaffDto;
import com.kosmo.web.erp.service.ErpService;

@Controller
public class ErpController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ErpService erpService;
	
	@RequestMapping("/")
	public String home(HttpServletRequest request, Model model) {
		try {
			model = SearchCode(model);
			
			int cPage = 1;
			
			if(request.getParameter("currentPage")!=null && !request.getParameter("currentPage").equals("")){
				cPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int count = erpService.recordCount();
			PagingDto dto = new PagingDto();
			dto.makePaging(cPage, count);
			
			//마지막페이지 일때
			if(dto.getCurrentPage()==dto.getTotalPageCount()){
				//마지막페이지의 남은 레코드 수
				int modRecord = dto.getTotalRecord() % dto.getOnePageRecord();
				if(modRecord!=0){
					dto.setLastPageRecord(modRecord);
				}
			}
			
			List<StaffDto> list = erpService.selectSearchAll(dto);
			
			model.addAttribute("count", count);
			model.addAttribute("page", dto);
			model.addAttribute("list", list);
			model.addAttribute("searchAll", "ok");
			return "staff_search_form";
			
		} catch (Exception e) {
			logger.error("Error at home", e);
			model.addAttribute("msg", "사원 정보 검색 화면이 실행되지 않았습니다.");
			return "error";
		}
	}
	
	public Model SearchCode(Model model){
		List<CodeSchoolDto> schoolList = erpService.selectSchoolList();
		List<CodeSkillDto> skillList = erpService.selectSkillList();
		List<CodeReligionDto> religionList = erpService.selectReligionList();
		
		model.addAttribute("schoolList", schoolList);
		model.addAttribute("skillList", skillList);
		model.addAttribute("religionList", religionList);
		return model;
	}
	
	@RequestMapping("/staffSearch")
	public String staffSearch(Model model){
		try {
			model = SearchCode(model);
			return "staff_search_form";
			
		} catch (Exception e) {
			logger.error("Error at staffSearch", e);
			model.addAttribute("msg", "사원 정보 검색 화면이 실행되지 않았습니다.");
			return "error";
		}
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, SearchDto dto, Model model) {
		try {
			model = SearchCode(model);
			
			dto.setGraduateStart();
			dto.setGraduateEnd();
			//logger.info("Staff_name: " + dto.getStaff_name());
			//logger.info("Jumin_no: " + dto.getJumin_no());
			//logger.info("Religion_code: " + dto.getReligion_code());
			//logger.info("School_code: " + dto.getSchool_code());
			//logger.info("Skill_code: " + dto.getSkill_code());
			//logger.info("GraduateStart: " + dto.getGraduateStart());
			//logger.info("GraduateEnd: " + dto.getGraduateEnd());
			
			logger.info("SortColumn: " +dto.getSortColumn());
			logger.info("Sort: " +dto.getSort());
			
			int cPage = 1;
			
			if(dto.getCurrentPage() != 0){
				cPage = dto.getCurrentPage();
			}
			
			int count = erpService.recordSearchCount(dto);
			
			PagingDto pageDto = new PagingDto();
			pageDto.makePaging(cPage, count);
			
			//마지막페이지 일때
			if(pageDto.getCurrentPage()==pageDto.getTotalPageCount()){
				//마지막페이지의 남은 레코드 수
				int modRecord = pageDto.getTotalRecord() % pageDto.getOnePageRecord();
				if(modRecord!=0){
					pageDto.setLastPageRecord(modRecord);
				}
			}
			
			List<StaffDto> list = erpService.selectSearch(dto, pageDto);
			
			model.addAttribute("count", count);
			model.addAttribute("dto", dto);
			model.addAttribute("page", pageDto);
			model.addAttribute("list", list);
			model.addAttribute("search", "ok");
			model.addAttribute("sortColumn", dto.getSortColumn());
			model.addAttribute("sort", dto.getSort());
			return "staff_search_form";
			
		} catch (Exception e) {
			logger.error("Error at search", e);
			model.addAttribute("msg", "검색이 실행되지 않았습니다.");
			return "error";
		}
	}
	
	@RequestMapping("/searchAll")
	public String searchAll(HttpServletRequest request, Model model) {
		try {
			model = SearchCode(model);
			
			int cPage = 1;
			
			if(request.getParameter("currentPage")!=null && !request.getParameter("currentPage").equals("")){
				cPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int count = erpService.recordCount();
			PagingDto dto = new PagingDto();
			dto.makePaging(cPage, count);
			
			//마지막페이지 일때
			if(dto.getCurrentPage()==dto.getTotalPageCount()){
				//마지막페이지의 남은 레코드 수
				int modRecord = dto.getTotalRecord() % dto.getOnePageRecord();
				if(modRecord!=0){
					dto.setLastPageRecord(modRecord);
				}
			}
			
			List<StaffDto> list = erpService.selectSearchAll(dto);
			
			model.addAttribute("count", count);
			model.addAttribute("page", dto);
			model.addAttribute("list", list);
			model.addAttribute("searchAll", "ok");
			return "staff_search_form";
			
		} catch (Exception e) {
			logger.error("Error at searchAll", e);
			model.addAttribute("msg", "전부 검색이 실행되지 않았습니다.");
			return "error";
		}
		
	}

	@RequestMapping("/staffInput")
	public String staffInput(Model model){
		try {
			model = SearchCode(model);
			
			return "staff_input_form";
			
		} catch (Exception e) {
			logger.error("Error: staffInput", e);
			model.addAttribute("msg", "등록창이 열리지 않습니다.");
			return "error";
		}
	}
	
	@RequestMapping("/staffInputOk")
	public String staffInputOk(StaffDto dto, Model model){
		try {
			model = SearchCode(model);
			
			dto.setGraduate_day();
			dto.setJumin_no();
			//logger.info(dto.getStaff_skill_no().toString());
			erpService.insertStaff(dto);
			
			int seq = dto.getStaff_no();
			//logger.info("seq: "+seq);
			erpService.insertStaffSkill(dto.getStaff_skill_no(), seq);
			model.addAttribute("ok", "input");
			return "staff_input_form";
			
		} catch (Exception e) {
			logger.error("Error: staffInputOk", e);
			model.addAttribute("msg", "사원 정보가 등록되지 않았습니다.");
			return "error";
		}
	}
	
	@RequestMapping("/staffUpdel")
	public String staffUpdel(HttpServletRequest request, Model model) {
		StaffDto dto = new StaffDto();
		try {
			model = SearchCode(model);
			
			int staffNo = Integer.parseInt(request.getParameter("num"));
			
			dto = erpService.selectOneStaff(staffNo);	
			model.addAttribute("dto", dto);
			return "staff_updel_form";
			
		} catch (Exception e) {
			logger.error("Error at staffUpdel", e);
			model.addAttribute("msg", "사원 정보가 조회되지 않았습니다.");
			return "error";
		}
	}
	
	@RequestMapping("/staffUpOk")
	public String staffUpOk(StaffDto dto, Model model){
		try {
			model = SearchCode(model);
			
			dto.setGraduate_day();
			dto.setJumin_no();
			erpService.updateStaff(dto);
			
			int StaffNo = dto.getStaff_no();
			erpService.deleteStaffSkill(StaffNo);
			erpService.insertStaffSkill(dto.getStaff_skill_no(), StaffNo);
			
			dto.setSkill_code();			
			model.addAttribute("dto", dto);
			model.addAttribute("ok", "update");
			return "staff_updel_form";
			
		} catch (Exception e) {
			logger.error("Error: staffUpOk", e);
			model.addAttribute("msg", "사원 정보가 수정되지 않았습니다.");
			return "error";
		}
	}
	
	@RequestMapping("/staffDel")
	public String staffDel(HttpServletRequest request, Model model){
		try {
			model = SearchCode(model);
			
			int StaffNo = Integer.parseInt(request.getParameter("num"));
			erpService.deleteStaffSkill(StaffNo);
			erpService.deleteStaff(StaffNo);
			
			model.addAttribute("ok", "del");
			return "staff_updel_form";
			
		} catch (Exception e) {
			logger.error("Error: staffUpOk", e);
			model.addAttribute("msg", "사원 정보가 삭제되지 않았습니다.");
			return "error";
		}
	}
}
