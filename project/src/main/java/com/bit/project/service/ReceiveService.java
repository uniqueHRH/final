package com.bit.project.service;


import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ReceiveVo;


public interface ReceiveService {

	List<ReceiveVo> selectAll_receive(Search search) throws Exception;
	void selectOne_receive(int key,Model model);
//	 �ǽð� ����
	void selectOne_receiveLimitOne(String key, Model model);
	void deleteOne_receive(int key);
//	�Խù� �� ����
	public int getReceiveListCnt(Search search) throws Exception;
//	���� ���� ���� ����
	public int select_receiveUnCnt(String client_nick2) throws Exception;
}
