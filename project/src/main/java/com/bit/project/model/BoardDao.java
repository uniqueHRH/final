package com.bit.project.model;

import java.util.List;

import com.bit.project.model.entity.BoardVo;

public interface BoardDao {


	
//	MAIN
//	���� �⺻  ���� (�ۼ� ����)
	List<BoardVo> selectAll_tour() throws Exception;
//	���� ���ú� ����
	List<BoardVo> selectAll_tourCity() throws Exception;
//	���� �׸��� ����
	List<BoardVo> selectAll_tourTheme() throws Exception;
	 
//	�ı� �⺻ ���� (�ۼ� ����)
	List<BoardVo> selectAll_review() throws Exception;
//	�ı� ���ú� ����
	List<BoardVo> selectAll_reviewCity() throws Exception;
//	�ı� �׸��� ����
	List<BoardVo> selectAll_reviewTheme() throws Exception;
	 
	List<BoardVo> selectAll_partner() throws Exception;
	List<BoardVo> selectAll_free() throws Exception;
	List<BoardVo> selectAll_event() throws Exception;
	
//	update ������ ���� ��ȸ	
	BoardVo select_land(int key) throws Exception;
	int countBoardListTotal() throws Exception;
	
//	DETAIL
	BoardVo selectOne_tour(int key) throws Exception;
	BoardVo selectOne_review(int key) throws Exception;
	BoardVo selectOne_partner(int key) throws Exception;
	BoardVo selectOne_free(int key) throws Exception;
	BoardVo selectOne_event(int key) throws Exception;
	
	 
//	INSERT
	void insertOne_tour(BoardVo bean) throws Exception;
	void insertOne_review(BoardVo bean) throws Exception;
	void insertOne_partner(BoardVo bean) throws Exception;
	void insertOne_free(BoardVo bean) throws Exception;
	void insertOne_event(BoardVo bean) throws Exception;

	 
//	UPDATE
	int updateOne_tour(BoardVo bean) throws Exception;
	int updateOne_review(BoardVo bean) throws Exception;
	int updateOne_partner(BoardVo bean) throws Exception;
	int updateOne_free(BoardVo bean) throws Exception;
	int updateOne_event(BoardVo bean) throws Exception;

//	��ȸ��
	int updateCnt(int key) throws Exception;
	 
//	DELETE
	int deleteOne_tour(int key) throws Exception;
	int deleteOne_review(int key) throws Exception;
	int deleteOne_partner(int key) throws Exception;
	int deleteOne_free(int key) throws Exception;
	int deleteOne_event(int key) throws Exception;
	
	 
}
