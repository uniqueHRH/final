package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.model.GuideDao;
import com.bit.project.model.entity.GuideVo;

@Service
public class GuideServiceImpl implements GuideService {

	@Autowired
	GuideDao guideDao;
	
	@Override
	public void selectAll_guide(Model model) {
		try {
			List<GuideVo> list=guideDao.selectAll_guide();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void selectOne_guide(int key, Model model) {
		try {
			model.addAttribute("bean",guideDao.selectOne_guide(key));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertOne_guide(GuideVo bean) {
		try {
			guideDao.insertOne_guide(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOne_guide(GuideVo bean) {
		try {
			guideDao.updateOne_guide(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_guide(int key) {
		try {
			guideDao.deleteOne_guide(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
