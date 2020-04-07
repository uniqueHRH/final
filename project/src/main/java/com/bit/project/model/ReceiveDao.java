package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ReceiveVo;

public interface ReceiveDao {

	List<ReceiveVo> selectAll_receive(Search search) throws Exception;
	ReceiveVo selectOne_receive(int key) throws Exception;
//	�ǽð� ���� ����
	ReceiveVo selectOne_receiveLimitOne(String key) throws Exception;
	int updateOne_receive(int key) throws Exception;
	int deleteOne_receive(int key) throws Exception;
//	�Խù� �� ����
	public int getReceiveListCnt(Search search) throws Exception;
}
