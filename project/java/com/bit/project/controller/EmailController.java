package com.bit.project.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.project.model.entity.ClientVo;
import com.bit.project.service.ClientService;

@Controller
public class EmailController {

		@Autowired
		ClientService clientService;
	
		@Inject    //���񽺸� ȣ���ϱ� ���ؼ� �������� ����
	    JavaMailSender mailSender;     //���� ���񽺸� ����ϱ� ���� �������� ������.
	    
	    //���̵� ã�� â���� �̵�
	    	@RequestMapping(value = "/main/login/findid", method = RequestMethod.GET)
	    		public String findid() {
	    			return "login/findid";
	    		}
	    //��й�ȣ ã�� â���� �̵�
	    	@RequestMapping(value = "/main/login/findpw", method = RequestMethod.GET)
	    		public String findpw() {
	    			return "login/findpw";
	    	}
	    	
	    	
	    // �����ڵ� �̸��� �߼�
	        @RequestMapping( value = "/main/login/findid" , method=RequestMethod.POST )
	        public ModelAndView mailSending(HttpServletRequest request, ClientVo bean,HttpServletResponse response_email) throws Exception {
	        	ClientVo findid = clientService.findId(bean);
	            Random r = new Random();
	            int dice = r.nextInt(4589362) + 49311; //�̸��Ϸ� �޴� �����ڵ� �κ� (����)
	            
	            String setfrom = "wjdwlans9303@gmail.com";
	            String tomail = request.getParameter("client_email"); // �޴� ��� �̸���
	            String title = "���̵� ã�� ���� �̸��� �Դϴ�."; // ����
	            String content =
	            
	            System.getProperty("line.separator")+ //���پ� �ٰ����� �α����� �ۼ�
	            
	            System.getProperty("line.separator")+
	                    
	            "�ȳ��ϼ��� ȸ���� ���� Ȩ�������� ã���ּż� �����մϴ�"
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	    
	            " ������ȣ�� " +dice+ " �Դϴ�. "
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            "������ ������ȣ�� Ȩ�������� �Է��� �ֽø� �������� �Ѿ�ϴ�."; // ����
	            
	            
	            try {
	                MimeMessage message = mailSender.createMimeMessage();
	                MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                        true, "UTF-8");
	 
	                messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵��� ����
	                messageHelper.setTo(tomail); // �޴»�� �̸���
	                messageHelper.setSubject(title); // ���������� ������ �����ϴ�
	                messageHelper.setText(content); // ���� ����
	                
	                mailSender.send(message);
	            } catch (Exception e) {
	                System.out.println(e);
	            }
	            
	            ModelAndView mav= new ModelAndView();
	            mav.addObject("Dice", dice);
	            mav.addObject("FindId", findid);
	            mav.setViewName("jsonView");
	            return mav;
	        }
	    
	    
	    //�̸��Ϸ� ���� ������ȣ�� �Է��ϰ� Ȯ�� ��ư�� ������ ���εǴ� �޼ҵ�.
	    //���� �Է��� ������ȣ�� ���Ϸ� �Է��� ������ȣ�� �´��� Ȯ���ؼ� ������ ���̵� ã�� ��� �������� �Ѿ��,
	    //Ʋ���� �״�� ����
	    @RequestMapping(value = "/main/code_check", method = RequestMethod.POST)
	    public ModelAndView code_check( ClientVo bean,String client_name, String client_email , String code, String dice) throws Exception {
	        
	        ClientVo IdResult = clientService.findId(bean);
	        
	        System.out.println("dice = "+dice);
	        System.out.println("code = "+code);
	        
	        System.out.println(code.equals(dice));
	        
	        //�������̵��� �ڷḦ ���ÿ� �ϱ����� ModelAndView�� ����ؼ� �̵��� �������� �ڷḦ ����
	        
	        ModelAndView mav = new ModelAndView();
	        
	        
	        if (code.equals(dice)) {
	            
	            //������ȣ�� ��ġ�� ��� ������ȣ�� �´ٴ� â�� ����ϰ� ȸ������â���� �̵���
	            mav.setViewName("/login/findidResult");
	            mav.addObject("ID", IdResult.getClient_id());
	            
	            //���� ������ȣ�� ���ٸ� �̸����� ȸ������ �������� ���� �Ѱܼ� �̸�����
	            //�ѹ��� �Է��� �ʿ䰡 ���� �Ѵ�.
	            
	    
	            return mav;
	            
	            
	        }
	        return mav;
	
	    }
	    
	    
	    //��й�ȣ ã�� �����ڵ� �̸��� �߼�
	    @RequestMapping( value = "/main/login/findpw" , method=RequestMethod.POST )
	    public ModelAndView mailSending2(HttpServletRequest request, ClientVo bean,HttpServletResponse response_email) throws Exception {
	    	ClientVo findid = clientService.findId(bean);
	    	Random r = new Random();
	    	int dice = r.nextInt(4589362) + 49311; //�̸��Ϸ� �޴� �����ڵ� �κ� (����)
	    	
	    	String setfrom = "wjdwlans9303@gmail.com";
	    	String tomail = request.getParameter("client_email"); // �޴� ��� �̸���
	    	String title = "���̵� ã�� ���� �̸��� �Դϴ�."; // ����
	    	String content =
	    			
	    			System.getProperty("line.separator")+ //���پ� �ٰ����� �α����� �ۼ�
	    			
	    			System.getProperty("line.separator")+
	    			
	    			"�ȳ��ϼ��� ȸ���� ���� Ȩ�������� ã���ּż� �����մϴ�"
	    			
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            " ������ȣ�� " +dice+ " �Դϴ�. "
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            "������ ������ȣ�� Ȩ�������� �Է��� �ֽø� �������� �Ѿ�ϴ�."; // ����
	    	
	    	
	    	try {
	    		MimeMessage message = mailSender.createMimeMessage();
	    		MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	    				true, "UTF-8");
	    		
	    		messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵��� ����
	    		messageHelper.setTo(tomail); // �޴»�� �̸���
	    		messageHelper.setSubject(title); // ���������� ������ �����ϴ�
	    		messageHelper.setText(content); // ���� ����
	    		
	    		mailSender.send(message);
	    	} catch (Exception e) {
	    		System.out.println(e);
	    	}
	    	
	    	ModelAndView mav= new ModelAndView();
	    	mav.addObject("Dice", dice);
	    	mav.setViewName("jsonView");
	    	return mav;
	    }
	    
	    
	    //�̸��Ϸ� ���� ������ȣ�� �Է��ϰ� ���� ��ư�� ������ ���εǴ� �޼ҵ�.
	    //���� �Է��� ������ȣ�� ���Ϸ� �Է��� ������ȣ�� �´��� Ȯ���ؼ� ������ ��й�ȣ ã�� ��� �������� �Ѿ��,
	    //Ʋ���� �״�� ����.
	    @RequestMapping(value = "/main/code_check2", method = RequestMethod.POST)
	    public ModelAndView code_check2( ClientVo bean,String client_name, String client_email , String code, String dice) throws Exception {
	    	
	    	ClientVo IdResult = clientService.findId(bean);
	    	
	    	System.out.println("dice = "+dice);
	    	System.out.println("code = "+code);
	    	
	    	System.out.println(code.equals(dice));
	    	
	    	//�������̵��� �ڷḦ ���ÿ� �ϱ����� ModelAndView�� ����ؼ� �̵��� �������� �ڷḦ ����
	    	
	    	ModelAndView mav = new ModelAndView();
	    	
	    	
	    	if (code.equals(dice)) {
	    		
	    		//������ȣ�� ��ġ�� ��� ������ȣ�� �´ٴ� â�� ����ϰ� ȸ������â���� �̵���
	    		mav.setViewName("/login/findidResult");
	    		mav.addObject("ID", IdResult.getClient_id());
	    		
	    		//���� ������ȣ�� ���ٸ� �̸����� ȸ������ �������� ���� �Ѱܼ� �̸�����
	    		//�ѹ��� �Է��� �ʿ䰡 ���� �Ѵ�.
	    		
	    		
	    		return mav;
	    		
	    		
	    	}
	    	return mav;
	    	
	    }
}
