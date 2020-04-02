package com.bit.project.common;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	@Override   // ����
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId());
		System.out.println(session.getId()+"���� ����Ǿ����ϴ�");
	}

	@Override   // �߼�
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+" : "+message.getPayload());
		session.sendMessage(message);
	}
	
	@Override   // ����
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId()+"���� ������ ����Ǿ����ϴ�");
	}
}
