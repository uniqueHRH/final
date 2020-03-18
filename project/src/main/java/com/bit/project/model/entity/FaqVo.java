package com.bit.project.model.entity;

public class FaqVo {

	private int faq_no;
	private String faq_question;
	private String faq_answer;
	
	
	public FaqVo() {
	}
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_question() {
		return faq_question;
	}
	public void setFaq_question(String faq_question) {
		this.faq_question = faq_question;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
	
	
	
	@Override
	public String toString() {
		return "faqVo [faq_no=" + faq_no + ", faq_question=" + faq_question + ", faq_answer=" + faq_answer + "]";
	}
	
	
	
	public FaqVo(int faq_no, String faq_question, String faq_answer) {
		super();
		this.faq_no = faq_no;
		this.faq_question = faq_question;
		this.faq_answer = faq_answer;
	}
	
}
