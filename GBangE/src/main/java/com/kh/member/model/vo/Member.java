package com.kh.member.model.vo;

import java.util.Date;

public class Member {

	private int memberNo;
	private String memberName;
	private String memberId;
	private String memberPwd;
	private String gender;
	private String address;
	private String birthDate;
	private double milage;
	private String shoes;
	private double weight;
	private Date enrollDate;
	private String status;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int memberNo, String memberName, String memberId, String memberPwd, String gender, String address,
			String birthDate, double milage, String shoes, double weight, Date enrollDate, String status) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.gender = gender;
		this.address = address;
		this.birthDate = birthDate;
		this.milage = milage;
		this.shoes = shoes;
		this.weight = weight;
		this.enrollDate = enrollDate;
		this.status = status;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public double getMilage() {
		return milage;
	}

	public void setMilage(double milage) {
		this.milage = milage;
	}

	public String getShoes() {
		return shoes;
	}

	public void setShoes(String shoes) {
		this.shoes = shoes;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberName=" + memberName + ", memberId=" + memberId + ", memberPwd="
				+ memberPwd + ", gender=" + gender + ", address=" + address + ", birthDate=" + birthDate + ", milage="
				+ milage + ", shoes=" + shoes + ", weight=" + weight + ", enrollDate=" + enrollDate + ", status="
				+ status + "]";
	} 
	
	
}
