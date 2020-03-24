package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.EventVo;

public interface EventDao {


	
	List<EventVo> selectAll_event(Search search) throws Exception;
	 
//	DETAIL
	EventVo selectOne_event(int key) throws Exception;
	 
//	INSERT
	void insertOne_event(EventVo bean) throws Exception;
	 
//	UPDATE
	int updateOne_event(EventVo bean) throws Exception;

//	DELETE
	int deleteOne_event(int key) throws Exception;
	
//	��ȸ��
	int updateCnt(int key) throws Exception;
//	�Խù� �� ����
	public int getEventListCnt(Search search) throws Exception;
}
