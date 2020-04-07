package com.bit.project.model.entity;

public class GuideVo {

private int guide_no;
private String guide_name;
private String guide_phone;
private String guide_city;
private String guide_email;


public GuideVo() {
}


public int getGuide_no() {
	return guide_no;
}


public void setGuide_no(int guide_no) {
	this.guide_no = guide_no;
}


public String getGuide_name() {
	return guide_name;
}


public void setGuide_name(String guide_name) {
	this.guide_name = guide_name;
}


public String getGuide_phone() {
	return guide_phone;
}


public void setGuide_phone(String guide_phone) {
	this.guide_phone = guide_phone;
}


public String getGuide_city() {
	return guide_city;
}


public void setGuide_city(String guide_city) {
	this.guide_city = guide_city;
}


public String getGuide_email() {
	return guide_email;
}


public void setGuide_email(String guide_email) {
	this.guide_email = guide_email;
}


public GuideVo(int guide_no, String guide_name, String guide_phone, String guide_city, String guide_email) {
	super();
	this.guide_no = guide_no;
	this.guide_name = guide_name;
	this.guide_phone = guide_phone;
	this.guide_city = guide_city;
	this.guide_email = guide_email;
}


@Override
public String toString() {
	return "GuideVo [guide_no=" + guide_no + ", guide_name=" + guide_name + ", guide_phone=" + guide_phone
			+ ", guide_city=" + guide_city + ", guide_email=" + guide_email + "]";
}

}
