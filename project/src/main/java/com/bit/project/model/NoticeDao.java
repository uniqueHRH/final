package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.NoticeVo;

public interface NoticeDao {

	List<NoticeVo> selectAll_notice(Search search) throws Exception;
	NoticeVo selectOne_notice(int key) throws Exception;
	void insertOne_notice(NoticeVo bean) throws Exception;
	int updateOne_notice(NoticeVo bean) throws Exception;
	int deleteOne_notice(int key) throws Exception;
//	��ȸ��
	int updateCnt(int key) throws Exception;
//	�Խù� �� ����
	public int getNoticeListCnt(Search search) throws Exception;
}
