package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.model.entity.PaidVo;

@Repository
public class PaidDaoImpl implements PaidDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<PaidVo> selectAll_paid() throws Exception {
		return sqlSession.selectList("paid.selectAll_paid");
	}

	@Override
	public PaidVo selectOne_paid(int paid_no) throws Exception {
		return sqlSession.selectOne("paid.selectOne_paid",paid_no);
	}

}
