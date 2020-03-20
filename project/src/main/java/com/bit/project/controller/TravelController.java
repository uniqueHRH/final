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
	
	
	//��й�ȣã��â���� �̵�
	@RequestMapping(value = "/main/login/findpw", method = RequestMethod.GET)
	public String findpw() {
		return "login/findpw";
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
	public String detail(Model model, @PathVariable ("idx") int tour_no ) {
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
	public String booking(Model model, @PathVariable ("idx") int tour_no) {
		tourservice.selectOne_eastasia(model, tour_no);
		return "tour/booking";
	}
	@RequestMapping(value = "/tour/eastasia/{idx}/booking", method = RequestMethod.POST)
	public String booking(@ModelAttribute TourVo bean) {
		tourservice.insert(bean);
		return "home";
	}
	
	
	/*
	 * // �Խ��� // �ı⸮��Ʈ �̵� (�ۼ��� ����)
	 * 
	 * @RequestMapping(value = "/board/review", method = RequestMethod.GET) public
	 * String review(Model model) { boardService.selectAll_review(model); return
	 * "board/review"; }
	 * 
	 * // �ı⸮��Ʈ �̵� (������ ����)
	 * 
	 * @RequestMapping(value="/board/reviewLocal", method=RequestMethod.GET) public
	 * String reviewLocal(Model model) { boardService.selectAll_reviewCity(model);
	 * return "board/review"; }
	 * 
	 * // �ı⸮��Ʈ �̵� (�׸��� ����)
	 * 
	 * @RequestMapping(value="/board/reviewTheme", method=RequestMethod.GET) public
	 * String reviewTheme(Model model) { boardService.selectAll_reviewTheme(model);
	 * return "board/review"; }
	 * 
	 * // ���ฮ��Ʈ �̵�
	 * 
	 * @RequestMapping(value = "/board/partner", method = RequestMethod.GET) public
	 * String partner(Model model) { boardService.selectAll_partner(model); return
	 * "board/partner"; }
	 * 
	 * //�����Խ��Ǹ���Ʈ�� �̵�
	 * 
	 * @RequestMapping(value = "/board/free", method = RequestMethod.GET) public
	 * String free(Model model) { boardService.selectAll_free(model); return
	 * "board/free"; }
	 * 
	 * //�̺�Ʈ����Ʈ�� �̵�
	 * 
	 * @RequestMapping(value = "/board/event", method = RequestMethod.GET) public
	 * String event(Model model) { boardService.selectAll_event(model); return
	 * "board/event"; }
	 * 
	 * // �۾���� �̵�
	 * 
	 * @RequestMapping(value = "/board/write", method = RequestMethod.GET) public
	 * String write() { return "board/write"; }
	 * 
	 * // �۾��� �Ϸ�, list �� �̵�
	 * 
	 * @RequestMapping(value = "/board/write", method = RequestMethod.POST) public
	 * String write(@ModelAttribute BoardVo bean) {
	 * boardService.insertOne_review(bean); return "redirect:review"; }
	 * 
	 * // �������� �̵�
	 * 
	 * @RequestMapping(value="/board/detail/{idx}",method=RequestMethod.GET) public
	 * String detail(@PathVariable("idx") int key, Model model) {
	 * boardService.selectOne_review(key, model); return "board/detail"; }
	 * 
	 * // ������������ �̵�
	 * 
	 * @RequestMapping(value = "/board/update/{idx}", method = RequestMethod.GET)
	 * public String update(@PathVariable("idx") int key, Model model) {
	 * boardService.selectOne_review(key, model); return "board/update"; }
	 * 
	 * // ���������� ���� ��ȸ
	 * 
	 * @RequestMapping(value="/board/updateLand", method=RequestMethod.POST) public
	 * String updateLand(int key, Model model) { boardService.select_land(key,
	 * model); return "board/update"; }
	 * 
	 * // ���� �� ���������� �̵�
	 * 
	 * @RequestMapping(value="/board/update/{idx}", method=RequestMethod.POST)
	 * public String update(@ModelAttribute BoardVo bean) {
	 * boardService.updateOne_review(bean); return
	 * "redirect:../detail/"+bean.getBoard_no(); }
	 * 
	 * // ����
	 * 
	 * @RequestMapping(value="/board/delete", method=RequestMethod.POST) public
	 * String delete(int key) { boardService.deleteOne_review(key); return
	 * "redirect:review"; }
	 */
 	
 	
 		
 	
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