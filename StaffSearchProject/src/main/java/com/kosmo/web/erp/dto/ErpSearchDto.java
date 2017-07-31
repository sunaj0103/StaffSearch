package com.kosmo.web.erp.dto;

public class ErpSearchDto {
	private int staff_no;
	private String staff_name;
	private String jumin_no;
	private int school_code;
	private int religion_code;
    private String graduate_day;
    private String skill_code;
    
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
	public String getGraduate_day() {
		return graduate_day;
	}
	public void setGraduate_day(String graduate_day) {
		this.graduate_day = graduate_day;
	}
	public String getSkill_code() {
		return skill_code;
	}
	public void setSkill_code(String skill_code) {
		this.skill_code = skill_code;
	}

}
