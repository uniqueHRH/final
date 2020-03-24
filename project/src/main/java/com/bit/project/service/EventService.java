package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.EventVo;

public interface EventService {

	
	List<EventVo> selectAll_event(Search search) throws Exception;
	
	void selectOne_event(int key,Model model);
	
	void insertOne_event(EventVo bean);
	
	void updateOne_event(EventVo bean);
	
	void deleteOne_event(int key);
	
//	�Խù� �� ����
	public int getEventListCnt(Search search) throws Exception;
}

