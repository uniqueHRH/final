package com.bit.project.common;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bit.project.model.ReceiveDao;

@Repository
public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	ReceiveDao receiveDao;
	
	Map<String, WebSocketSession> map=new HashMap<String, WebSocketSession>();
	Map<String, String> users=new HashMap<String, String>();
	
	
	@Override   // ����
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId()+"���� ����Ǿ����ϴ�");
		map.put(session.getId(), session);
		users.put(session.getId(), "id");
	}

	@Override   // �߼�
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+" : "+message.getPayload());
		session.sendMessage(message);
/*
		sqlSession.getMapper(ReceiveDao.class);   // getMapper : Dao �������̽��� ���ǵ� �� �Լ��� ȣ��
		session.sendMessage(new TextMessage(receiveDao.select_receiveUnCnt(message.getPayload())));
*/
	}
	
	@Override   // ����
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId()+"���� ������ ����Ǿ����ϴ�");
		map.remove(session.getId());
		users.remove(session.getId());
	}
}
