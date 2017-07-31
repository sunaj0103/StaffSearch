package com.kosmo.web.erp.dto;

import java.util.List;

public class SearchDto {
	private int staff_no;
	private String staff_name;
	private List<Integer> jumin_no;
	private List<Integer> school_code;
	private List<Integer> skill_code;
	private int religion_code;
	private String religion_name;
    
    private String graduateStartYear;
	private String graduateStartMonth;
	private String graduateStartDay;
	private String graduateStart;
	
	private String graduateEndYear;
	private String graduateEndMonth;
	private String graduateEndDay;
	private String graduateEnd;
	
	private int currentPage = 0;
	
	private String sortColumn;
	private String sort;
	
	public int getStaff_no() {
		return staff_no;
	}
	public void setStaff_no(int staff_no) {
		this.staff_no = staff_no;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public List<Integer> getJumin_no() {
		return jumin_no;
	}
	public void setJumin_no(List<Integer> jumin_no) {
		this.jumin_no = jumin_no;
	}
	public List<Integer> getSchool_code() {
		return school_code;
	}
	public void setSchool_code(List<Integer> school_code) {
		this.school_code = school_code;
	}
	public List<Integer> getSkill_code() {
		return skill_code;
	}
	public void setSkill_code(List<Integer> skill_code) {
		this.skill_code = skill_code;
	}
	public int getReligion_code() {
		return religion_code;
	}
	public void setReligion_code(int religion_code) {
		this.religion_code = religion_code;
	}
	public void setReligion_name(String religion_name) {
		this.religion_name = religion_name;
	}
	public String getReligion_name() {
		return religion_name;
	}
	public String getGraduateStartYear() {
		return graduateStartYear;
	}
	public void setGraduateStartYear(String graduateStartYear) {
		this.graduateStartYear = graduateStartYear;
	}
	public String getGraduateStartMonth() {
		return graduateStartMonth;
	}
	public void setGraduateStartMonth(String graduateStartMonth) {
		this.graduateStartMonth = graduateStartMonth;
	}
	public String getGraduateStartDay() {
		return graduateStartDay;
	}
	public void setGraduateStartDay(String graduateStartDay) {
		this.graduateStartDay = graduateStartDay;
	}
	public String getGraduateStart() {
		return graduateStart;
	}
	public void setGraduateStart(String graduateStart) {
		this.graduateStart = graduateStart;
	}
	//
	public void setGraduateStart() {
		if(graduateStartYear == null){
			graduateStartYear = "";
		}
		if(graduateStartMonth == null){
			graduateStartMonth = "";
		}
		if(graduateStartDay == null){
			graduateStartDay = "";
		}
		
		String day = graduateStartYear+"-"+graduateStartMonth+"-"+graduateStartDay;
		this.graduateStart = day;
	}
	public String getGraduateEndYear() {
		return graduateEndYear;
	}
	public void setGraduateEndYear(String graduateEndYear) {
		this.graduateEndYear = graduateEndYear;
	}
	public String getGraduateEndMonth() {
		return graduateEndMonth;
	}
	public void setGraduateEndMonth(String graduateEndMonth) {
		this.graduateEndMonth = graduateEndMonth;
	}
	public String getGraduateEndDay() {
		return graduateEndDay;
	}
	public void setGraduateEndDay(String graduateEndDay) {
		this.graduateEndDay = graduateEndDay;
	}
	public String getGraduateEnd() {
		return graduateEnd;
	}
	public void setGraduateEnd(String graduateEnd) {
		this.graduateEnd = graduateEnd;
	}
	//
	public void setGraduateEnd() {
		if(graduateEndYear == null){
			graduateEndYear = "";
		}
		if(graduateEndMonth == null){
			graduateEndMonth = "";
		}
		if(graduateEndDay == null){
			graduateEndDay = "";
		}
		
		String day = graduateEndYear+"-"+graduateEndMonth+"-"+graduateEndDay;
		this.graduateEnd = day;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getSortColumn() {
		return sortColumn;
	}
	public void setSortColumn(String sortColumn) {
		this.sortColumn = sortColumn;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
