package com.bit.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.project.common.Search;
import com.bit.project.service.ReceiveService;

@Controller
public class MypageController {

	@Autowired
	ReceiveService receiveService;
	
//	������
	@RequestMapping(value="/main/message", method=RequestMethod.GET)
	public String receiveMsg(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="receive_content") String searchType,
 			@RequestParam(required=false) String keyword,
 			@ModelAttribute("search") Search search
 			) throws Exception {

 		model.addAttribute("search", search);
 		search.setSearchType(searchType);
 		search.setKeyword(keyword);
 		
 		// ��ü �Խñ� ����
 		int listCnt=0;
		try {
			listCnt = receiveService.getReceiveListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",receiveService.selectAll_receive(search));
		model.addAttribute("listCnt",listCnt);
		return "mypage/message";
	}
	
	// ���� �󼼺���
	@RequestMapping(value="/main/messageDe/{idx}", method=RequestMethod.GET)
	public String receiveMsg(@PathVariable("idx") int key, Model model) {
		receiveService.selectOne_receive(key, model);
		return "mypage/receiveMsg";
	}
	
//	���� �� ��
  	@RequestMapping(value="/main/myBoard", method=RequestMethod.GET)
  	public String myBoard() {
  		return "mypage/myBoard";
  	}
}
