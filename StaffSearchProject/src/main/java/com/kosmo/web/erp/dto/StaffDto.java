package com.kosmo.web.erp.dto;

import java.util.List;

public class StaffDto {
	private int staff_no;
	private String staff_name;
	
	private String jumin_no;
	private String jumin_no1;
	private String jumin_no2;
	
	private int school_code;
	private int religion_code;
	private String religion_name;
	private String skill_code;
	
    private String graduate_day;
    private String graduateYear;
	private String graduateMonth;
	private String graduateDay;
	
	private List<Integer> staff_skill_no;
	
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
	public String getJumin_no() {
		return jumin_no;
	}
	public void setJumin_no(String jumin_no) {
		this.jumin_no = jumin_no;
	}
	//DB 저장
	public void setJumin_no() {
		String jumin = jumin_no1+"-"+jumin_no2;
		this.jumin_no = jumin;
	}
	public String getJumin_no1() {
		return jumin_no1;
	}
	public void setJumin_no1(String jumin_no1) {
		this.jumin_no1 = jumin_no1;
	}
	public String getJumin_no2() {
		return jumin_no2;
	}
	public void setJumin_no2(String jumin_no2) {
		this.jumin_no2 = jumin_no2;
	}
	public int getSchool_code() {
		return school_code;
	}
	public void setSchool_code(int school_code) {
		this.school_code = school_code;
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
	public String getSkill_code() {
		return skill_code;
	}
	public void setSkill_code(String skill_code) {
		this.skill_code = skill_code;
	}
	public String getGraduate_day() {
		return graduate_day;
	}
	public void setGraduate_day(String graduate_day) {
		this.graduate_day = graduate_day;
	}
	//DB 저장
	public void setGraduate_day() {
		String day = graduateYear+"-"+graduateMonth+"-"+graduateDay;
		this.graduate_day = day;
	}
	public String getGraduateYear() {
		return graduateYear;
	}
	public void setGraduateYear(String graduateYear) {
		this.graduateYear = graduateYear;
	}
	public String getGraduateMonth() {
		return graduateMonth;
	}
	public void setGraduateMonth(String graduateMonth) {
		this.graduateMonth = graduateMonth;
	}
	public String getGraduateDay() {
		return graduateDay;
	}
	public void setGraduateDay(String graduateDay) {
		this.graduateDay = graduateDay;
	}
	public List<Integer> getStaff_skill_no() {
		return staff_skill_no;
	}
	public void setStaff_skill_no(List<Integer> staff_skill_no) {
		this.staff_skill_no = staff_skill_no;
	}
	//화면에 출력하기 위해 String으로 변환
	public void setSkill_code() {
		String skillCode = staff_skill_no.toString();
		skillCode = skillCode.substring(1, skillCode.length()-1); //[]제거
		this.skill_code = skillCode;
	}
	
}
