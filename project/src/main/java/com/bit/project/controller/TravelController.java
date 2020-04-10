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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.project.common.Search;
import com.bit.project.model.entity.*;
import com.bit.project.service.*;

@Controller
public class TravelController {
	
	@Autowired
	ClientService clientService;
	@Autowired
	TourService tourservice;
	@Autowired
	StaffService staffService;
	@Autowired
	MapService mapservice;
	@Autowired
	PaidService paidservice;
	@Autowired
	WishService wishservice;
	
	
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
	public ModelAndView stafflogin(StaffVo bean, HttpServletRequest req) throws Exception{
		
		HttpSession session = req.getSession();
		StaffVo login= staffService.loginCheck(bean);
		System.out.println(login);
		ModelAndView mav=new ModelAndView();
		if(login!=null) {
			//�α��� ���� ��
			session.setAttribute("staffcheck", login);
			mav.setViewName("redirect:/");
		}else {
			//�α��� ���� ��
			session.setAttribute("staffcheck", null);
			mav.addObject("msg", "fail");
			mav.setViewName("login/stafflogin");
		}
		return mav;
	}
	
	//�α���â���� �̵�
	@RequestMapping(value = "/main/login", method = RequestMethod.GET)
	public String login() {
	   return "login/login";
	}
	
	//ȸ�� �α���
	@RequestMapping(value="/main/login", method=RequestMethod.POST)
	public ModelAndView login(ClientVo bean, HttpServletRequest req) throws Exception{
		
		HttpSession session = req.getSession();
		ClientVo login= clientService.loginCheck(bean);
		ModelAndView mav=new ModelAndView();
		if(login!=null) {
			//�α��� ���� ��
			session.setAttribute("check", login);
			mav.setViewName("redirect:/");
			
		}else {
			//�α��� ���� ��
			session.setAttribute("check", null);
			mav.addObject("msg", "fail");
			mav.setViewName("login/login");
		}
		return mav;
	}
    //�α׾ƿ�
	@RequestMapping(value="/main/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		return "redirect:/";
	}
	
	//�г��� �ߺ��˻�
	@RequestMapping(value="/main/nickdupli", method=RequestMethod.POST)
	public ModelAndView NickDupli(ClientVo bean) throws Exception{
		ClientVo nickdupli = clientService.nickDupli(bean);
		ModelAndView mav = new ModelAndView();
		mav.addObject("Nickdupli", nickdupli);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//���̵� �ߺ��˻�
	@RequestMapping(value="/main/iddupli", method=RequestMethod.POST)
	public ModelAndView IdDupli(ClientVo bean) throws Exception{
		ClientVo iddupli = clientService.idDupli(bean);
		ModelAndView mav = new ModelAndView();
		mav.addObject("Iddupli", iddupli);
		mav.setViewName("jsonView");
		return mav;
	}
	
// ����   
	//�߱�/�Ϻ����� �̵�
	@RequestMapping(value = "/tour/eastasia", method = RequestMethod.GET)
	public String eastasia(Model model) {
		tourservice.selectAll_eastasia(model);
		return "tour/maintour";
	}
	//�����ƽþƷ� �̵�
	@RequestMapping(value = "/tour/southeastasia", method = RequestMethod.GET)
	public String southeastasia(Model model) {
		tourservice.selectAll_southeastasia(model);
		return "tour/maintour";
	}
	//�Ƹ޸�ī�� �̵�
	@RequestMapping(value = "/tour/america", method = RequestMethod.GET)
	public String america(Model model) {
		tourservice.selectAll_america(model);
		return "tour/maintour";
	}
	//������ �̵�	
	@RequestMapping(value = "/tour/europe", method = RequestMethod.GET)
	public String europe(Model model) {
		tourservice.selectAll_europe(model);
		return "tour/maintour";
	}
	//����������� �̵�	
	@RequestMapping(value = "/tour/pacific", method = RequestMethod.GET)
	public String pacific(Model model) {
		tourservice.selectAll_pacific(model);
		return "tour/maintour";
	}
	//������ī���� �̵�	
	@RequestMapping(value = "/tour/africa", method = RequestMethod.GET)
	public String africa(Model model) {
		tourservice.selectAll_africa(model);
		return "tour/maintour";
		}
	//���ϱ�
	@RequestMapping(value="/tour/wishon",method = RequestMethod.POST)
	public String wishon(@ModelAttribute WishVo bean) {
		wishservice.insert_wish(bean);
		return "home";
	}
		
	
	//������PAGE
	@RequestMapping(value = "/tour/detail/{idx}", method = RequestMethod.GET)
	public String detail(Model model, @PathVariable ("idx") int tour_no) {
		tourservice.selectOne_tour(model, tour_no);
		mapservice.selectAll_map(model,tour_no);
		return "tour/detailtour";
	}
	//������������ �̵�
	@RequestMapping(value = "/tour/{idx}/booking", method = RequestMethod.GET)
	public String bookingeastasia(Model model, @PathVariable ("idx") int tour_no) {
		tourservice.selectOne_tour(model, tour_no);
		return "tour/booking";
	}
	//�����ϱ�(INSERT)
	@RequestMapping(value = "/tour/{idx}/booking", method = RequestMethod.POST)
	public String bookingtour(@ModelAttribute PaidVo bean) {
		tourservice.insertOne_tour(bean);
		return "home";
	}
	//��������
	//�׸� ����,����������
	@RequestMapping(value = "/tour/theme", method = RequestMethod.GET)
	public String theme(Model model) {
		tourservice.selectAll_themetour(model);
		return "tour/themetour";
	}
	//����������
	@RequestMapping(value = "/tour/themesnap", method = RequestMethod.GET)
	public String themesnap(Model model) {
		tourservice.selectAll_themesnap(model);
		return "tour/themetour";
	}
	@RequestMapping(value = "/tour/themeactivity", method = RequestMethod.GET)
	public String themeactivity(Model model) {
		tourservice.selectAll_themeactivity(model);
		return "tour/themetour";
	}
	@RequestMapping(value = "/tour/themefood", method = RequestMethod.GET)
	public String themefood(Model model) {
		tourservice.selectAll_themefood(model);
		return "tour/themetour";
	}
	@RequestMapping(value = "/tour/thememovie", method = RequestMethod.GET)
	public String thememovie(Model model) {
		tourservice.selectAll_thememovie(model);
		return "tour/themetour";
	}
	@RequestMapping(value = "/tour/themesports", method = RequestMethod.GET)
	public String themesports(Model model) {
		tourservice.selectAll_themesports(model);
		return "tour/themetour";
	}

	//���������� ���� ������ ��ǰ
	@RequestMapping(value="/main/mybooking", method=RequestMethod.GET)
	public String mybooking(String id, Model model,
				@RequestParam(required = false, defaultValue = "1") int page,
	 			@RequestParam(required=false, defaultValue="1") int range,
	 			@ModelAttribute("search") Search search
	 			) throws Exception {
			
			model.addAttribute("search", search);
	 		search.setClient_name(id);
	 		
	 		// ��ü �Խñ� ����
	 		int listCnt=0;
			try {
				listCnt=paidservice.getallPaidListCnt(search);
				search.pageInfo(page, range, listCnt);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("pagination", search);
			model.addAttribute("list",paidservice.selectAll_paid(search));
			model.addAttribute("listCnt",listCnt);
			return "mypage/mybooking";
	}
	//���������� ���� ������ ��ǰ ������
	@RequestMapping(value = "/mypage/paid/{idx}", method = RequestMethod.GET)
	public String detailpaid(Model model, @PathVariable ("idx") int paid_no) {
		paidservice.selectOne_paid(model, paid_no);
		return "mypage/detailmybooking";
	}
	//���� �� �����Ϸ� insert
	@RequestMapping(value="/mypage/paidconfirm",method = RequestMethod.POST)
	public String paid_confirm(@ModelAttribute PaidVo bean) {
		paidservice.paid_confirm(bean);
		return "home";
	}
	//�ý��ۿ��� �� ����� ������ǰ ����������
	@RequestMapping(value = "/system/paid", method = RequestMethod.GET)
	public String allpaid(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="paid_name") String searchType,
 			@RequestParam(required=false) String keyword,
 			@ModelAttribute("search") Search search
 			) throws Exception {
		
		model.addAttribute("search", search);
 		search.setSearchType(searchType);
 		search.setKeyword(keyword);
 		
 		// ��ü �Խñ� ����
 		int listCnt=0;
		try {
			listCnt=paidservice.getallPaidListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pagination", search);
		model.addAttribute("list",paidservice.selectAll_allpaid(search));
		model.addAttribute("listCnt",listCnt);
		return "system/allpaid";
	}
	//�ý��ۿ��� �� ����� ������ǰ ���������� ������
	@RequestMapping(value = "/system/paid/{idx}", method = RequestMethod.GET)
	public String detailallpaid(Model model, @PathVariable ("idx") int paid_no) {
		paidservice.selectOne_paid(model, paid_no);
		return "system/detailallpaid";
	}
	//�ý��ۿ��� �� ����� ������ǰ ���������� �����Ͽ��� Ȯ��
	@RequestMapping(value = "/system/paid/confirm", method = RequestMethod.POST)
	public String confirmallpaid(@ModelAttribute PaidVo bean) {
		paidservice.allpaid_confirm(bean);
		return "system/detailallpaid";
	}
}