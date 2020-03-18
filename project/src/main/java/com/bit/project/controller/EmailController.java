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
import org.springframework.web.servlet.ModelAndView;

import com.bit.project.model.entity.ClientVo;
import com.bit.project.service.ClientService;

@Controller
public class EmailController {

		@Autowired
		ClientService clientService;
	
		@Inject    //���񽺸� ȣ���ϱ� ���ؼ� �������� ����
	    JavaMailSender mailSender;     //���� ���񽺸� ����ϱ� ���� �������� ������.
	    
	    //���̵�ã��â���� �̵�
	    	@RequestMapping(value = "/main/login/findid", method = RequestMethod.GET)
	    		public String findid() {
	    		return "login/findid";
	    		}
	    	
	    	
	    // mailSending �ڵ�
	        @RequestMapping( value = "/main/login/findid" , method=RequestMethod.POST )
	        public ModelAndView mailSending(HttpServletRequest request, String client_email, String client_name, ClientVo bean,HttpServletResponse response_email) throws Exception {
	  
	        	ClientVo findid = clientService.findId(bean);
	        	
	        	if(findid != null) {
	        		
	            Random r = new Random();
	            int dice = r.nextInt(4589362) + 49311; //�̸��Ϸ� �޴� �����ڵ� �κ� (����)
	            
	            String setfrom = "wjdwlans9303@gmail.com";
	            String tomail = request.getParameter("client_email"); // �޴� ��� �̸���
	            String title = "ȸ������ ���� �̸��� �Դϴ�."; // ����
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
	            
	            	ModelAndView mv = new ModelAndView();    //ModelAndView�� ���� �������� �����ϰ�, ���� ���� �����Ѵ�.
	            	mv.setViewName("/login/findid");     //�����̸�
	            	mv.addObject("name", client_name);
	            	mv.addObject("email", client_email);
	            
	            	System.out.println("mv : "+mv);
	 
	            	response_email.setContentType("text/html; charset=UTF-8");
	            	PrintWriter out_email = response_email.getWriter();
	            	out_email.println("<script>alert('�̸����� �߼۵Ǿ����ϴ�. ������ȣ�� �Է����ּ���.');</script>");
	            	out_email.flush();
	            
	            
	            	return mv;
	        	}else{
	        		 response_email.setContentType("text/html; charset=UTF-8");
	 	            PrintWriter out_email = response_email.getWriter();
	 	            out_email.println("<script>alert('�̸� �Ǵ� �̸����� Ȯ�����ּ���');</script>");
	 	            out_email.flush();
	 	            
	 	            ModelAndView mv = new ModelAndView();
		            mv.setViewName("/login/findid");  
		            mv.addObject("name", client_name);
	            	mv.addObject("email", client_email);
		            return mv;
	        	}
	            
	        }
	    
	    
	    //�̸��Ϸ� ���� ������ȣ�� �Է��ϰ� ���� ��ư�� ������ ���εǴ� �޼ҵ�.
	    //���� �Է��� ������ȣ�� ���Ϸ� �Է��� ������ȣ�� �´��� Ȯ���ؼ� ������ ȸ������ �������� �Ѿ��,
	    //Ʋ���� �ٽ� ���� �������� ���ƿ��� �޼ҵ�
	    @RequestMapping(value = "/code_check${dice}", method = RequestMethod.POST)
	    public ModelAndView code_check( ClientVo bean, String code, @PathVariable("dice") String dice, HttpServletRequest req, HttpServletResponse response_equals) throws Exception {
	 
	        HttpSession session = req.getSession();
	        
	        ClientVo IdResult = clientService.findId(bean);
	        
	        System.out.println("������ : email_injeung : "+code);
	        
	        System.out.println("������ : dice : "+dice);
	        
	        //�������̵��� �ڷḦ ���ÿ� �ϱ����� ModelAndView�� ����ؼ� �̵��� �������� �ڷḦ ����
	        
	        ModelAndView mav = new ModelAndView();
	        
	        mav.setViewName("/member/join.do");
	        
	        mav.addObject("e_mail",code);
	        
	        if (code.equals(dice)) {
	            
	            //������ȣ�� ��ġ�� ��� ������ȣ�� �´ٴ� â�� ����ϰ� ȸ������â���� �̵���
	            
	            session.setAttribute("findid", IdResult);
	            mav.setViewName("/login/admin");
	            
	            //���� ������ȣ�� ���ٸ� �̸����� ȸ������ �������� ���� �Ѱܼ� �̸�����
	            //�ѹ��� �Է��� �ʿ䰡 ���� �Ѵ�.
	            
	    
	            return mav;
	            
	            
	        }else if (code != dice) {
	            
	            mav.setViewName("/login/findid");
	            
	            response_equals.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response_equals.getWriter();
	            out_equals.println("<script>alert('������ȣ�� ��ġ�����ʽ��ϴ�. ������ȣ�� �ٽ� �Է����ּ���.'); history.go(-1);</script>");
	            out_equals.flush();
	            
	    
	            return mav;
	            
	        }
	        return mav;
	
	    }
}
