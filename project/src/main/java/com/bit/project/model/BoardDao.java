package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.BoardVo;

public interface BoardDao {


	
//	�ı� �⺻ ���� (�ۼ� ����)
	List<BoardVo> selectAll_review(Search search) throws Exception;

	/* List<BoardVo> selectAll_review() throws Exception; */
//	�ı� ���ú� ����
	List<BoardVo> selectAll_reviewCity(Search search) throws Exception;
//	�ı� �׸��� ����
	List<BoardVo> selectAll_reviewTheme(Search search) throws Exception;
	 
	
//	update ������ ���� ��ȸ
	BoardVo select_land(int key) throws Exception;
	
//	DETAIL
	BoardVo selectOne_review(int key) throws Exception;
	
	 
//	INSERT
	void insertOne_review(BoardVo bean) throws Exception;

	 
//	UPDATE
	int updateOne_review(BoardVo bean) throws Exception;

//	DELETE
	int deleteOne_review(int key) throws Exception;
	
//	��ȸ��
	int updateCnt(int key) throws Exception;
//	�Խù� �� ����
	public int getBoardListCnt(Search search) throws Exception;
	
//	���� �� ��
	List<BoardVo> myBoardList(Search search) throws Exception;
	public int myBoardTotal(Search search) throws Exception;
}
