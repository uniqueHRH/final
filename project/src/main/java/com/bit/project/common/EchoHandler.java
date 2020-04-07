package com.bit.project.common;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bit.project.model.ClientDao;

@Repository
public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	ClientDao clientDao;
	
	
	@Override   // ����
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId());
		System.out.println(session.getId()+"���� ����Ǿ����ϴ�");
	}

	@Override   // �߼�
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+" : "+message.getPayload());
		session.sendMessage(message);
		sqlSession.getMapper(ClientDao.class);   // getMapper : Dao �������̽��� ���ǵ� �� �Լ��� ȣ��
	}
	
	@Override   // ����
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId()+"���� ������ ����Ǿ����ϴ�");
	}
}
