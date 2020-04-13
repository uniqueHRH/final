package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.TourVo;

public interface TourDao {
	//ȸ����
	List<TourVo> selectAll_eastasia() throws Exception;
	List<TourVo> selectAll_southeastasia() throws Exception;
	List<TourVo> selectAll_america() throws Exception;
	List<TourVo> selectAll_europe() throws Exception;
	List<TourVo> selectAll_pacific() throws Exception;
	List<TourVo> selectAll_africa() throws Exception;
	List<TourVo> selectAll_themetour() throws Exception;
	List<TourVo> selectAll_themesnap() throws Exception;
	List<TourVo> selectAll_themeactivity() throws Exception;
	List<TourVo> selectAll_themefood() throws Exception;
	List<TourVo> selectAll_thememovie() throws Exception;
	List<TourVo> selectAll_themesports() throws Exception;
	
	TourVo selectOne_tour(int tour_no) throws Exception;
	//����
	void insertOne(PaidVo bean) throws Exception;
	//�����ڿ�
	List<TourVo> selectAll_tour(Search search) throws Exception;
	List<TourVo> selectAll_tour_arrayland(Search search) throws Exception;
	List<TourVo> selectAll_tour_arraycountry(Search search) throws Exception;
	public int getallTourListCnt(Search search) throws Exception;
}
