package com.bit.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.project.model.entity.*;
import com.bit.project.service.*;

@Controller
public class TravelController {
	
	@Autowired
	ClientService clientService;
	@Autowired
	BoardService boardService;
	@Autowired
	FaqService faqService;
	@Autowired
	GuideService guideService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	PaidService paidService;
	@Autowired
	ReceiveService receiveService;
	@Autowired
	ReplyService replyService;
	@Autowired
	SendService sendService;
	@Autowired
	StaffService staffService;
	@Autowired
	TourService tourservice;
	
	
	
// �α���
	//ȸ������â���� �̵�
	@RequestMapping(value = "/main/admin", method = RequestMethod.GET)
	public String admin() {
		return "login/admin";
	}
   
	//ȸ������ �Ϸ� , �α���â���� �̵�
	@RequestMapping(value = "/main/admin", method = RequestMethod.POST)
	public String admin(@ModelAttribute ClientVo bean) {
		  clientService.insertOne_client(bean);
		  return "redirect:login";
	}
	//�����α���â���� �̵�
	@RequestMapping(value = "/main/stafflogin", method = RequestMethod.GET)
	public String stafflogin() {
		return "login/stafflogin";
	}
	
	//���� �α���
	@RequestMapping(value= "/main/stafflogin", method=RequestMethod.POST)
	public ModelAndView stafflogin(StaffVo bean, HttpServletRequest req, ModelAndView mav) throws Exception{
		
		HttpSession session = req.getSession();
		StaffVo login= staffService.loginCheck(bean);
		 
		if(login==null) {
			//�α��� ���� ��
			session.setAttribute("staffcheck", null);
			mav.setViewName("redirect:/main/stafflogin");
			mav.addObject("msg", "fail");
			return mav;
		}else {
			//�α��� ���� ��
			session.setAttribute("staffcheck", login);
			mav.setViewName("home");
			return mav;
		}
	}
	
	//�α���â���� �̵�
	@RequestMapping(value = "/main/login", method = RequestMethod.GET)
	public String login() {
	   return "login/login";
	}
	
	//ȸ�� �α���
	@RequestMapping(value="/main/login", method=RequestMethod.POST)
	public ModelAndView login(ClientVo bean, HttpServletRequest req, ModelAndView mav) throws Exception{
		
		HttpSession session = req.getSession();
		ClientVo login= clientService.loginCheck(bean);
		if(login==null) {
			//�α��� ���� ��
			session.setAttribute("check", null);
			mav.setViewName("redirect:/main/login");
			mav.addObject("msg", "fail");
			return mav;
		}else {
			//�α��� ���� ��
			session.setAttribute("check", login);
			mav.setViewName("home");
			return mav;
		}
	}
    //�α׾ƿ�
	@RequestMapping(value="/main/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		return "redirect:/";
	}
	
// ȸ��
	//������(����)���� �̵�
	@RequestMapping(value = "/main/staffinfo", method = RequestMethod.GET)
	public String staffinfo() {
		return "mypage/staffinfo";
	}
	
	//������������ �̵�
	@RequestMapping(value = "/main/myinfo")
	public String myinfo(Model model,@PathVariable("idx") int client_no) {
		return "mypage/myinfo";
	}
	
	//������  �������� �̵�
	@RequestMapping(value = "/main/myinfo/changeinfo", method = RequestMethod.GET)
	public String changemyinfo() {
		return "mypage/changemyinfo";
	}
	//������ ���濡�� ��й�ȣ �������� �̵�
	@RequestMapping(value = "/main/myinfo/changeinfo/changepw", method = RequestMethod.GET)
	public String changepw() {
		return "mypage/changepw";
	}
	@RequestMapping(value = "/main/message", method = RequestMethod.GET)
	public String message() {
		return "mypage/message";
	}
	@RequestMapping(value = "/main/wish", method = RequestMethod.GET)
	public String wish() {
		return "mypage/wish";
	}
	
	
// ����   
	//�߱�/�Ϻ����� �̵�
	@RequestMapping(value = "/tour/eastasia", method = RequestMethod.GET)
	public String eastasia(Model model) {
		tourservice.selectAll_eastasia(model);
		return "tour/eastasia";
	}
	@RequestMapping(value = "/tour/eastasia/{idx}", method = RequestMethod.GET)
	public String detail(Model model, @PathVariable ("idx") int tour_no) {
		tourservice.selectOne_eastasia(model, tour_no);
		return "tour/detaileastasia";
	}

	@RequestMapping(value = "/tour/theme", method = RequestMethod.GET)
	public String theme() {
	return "tour/themetour";
	}
	@RequestMapping(value = "/tour/southeastasia", method = RequestMethod.GET)
	public String southasia() {
	return "tour/southeastasia";
	}
	@RequestMapping(value = "/tour/eastasia/{idx}/booking", method = RequestMethod.GET)
	public String bookingeastasia(Model model, @PathVariable ("idx") int tour_no) {
		tourservice.selectOne_eastasia(model, tour_no);
		return "tour/booking";
	}
	@RequestMapping(value = "/tour/eastasia/{idx}/booking", method = RequestMethod.POST)
	public String bookingeastasia(@ModelAttribute PaidVo bean) {
		tourservice.insertOne_eastasia(bean);
		return "home";
	}
	
// �ý��۰���
 	//���������������� �̵�
 	@RequestMapping(value = "/system/staff", method = RequestMethod.GET)
 	public String staff() {
 		return "system/staff";
 	}
 	
 	//���̵������������ �̵�
 	@RequestMapping(value = "/system/guide", method = RequestMethod.GET)
 	public String guide() {
 		return "system/guide";
 	}
 	
 	//ȸ�������������� �̵�
 	 @RequestMapping(value = "/system/client", method = RequestMethod.GET)
 	 public String client() {
 		return "system/client";
 	 }
 	 
 	 //���������������� �̵�
 	@RequestMapping(value = "/system/paid", method = RequestMethod.GET)
	 public String paid() {
		return "system/paid";
	 }
 	
 	
}