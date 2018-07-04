package com.czxy.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.house.dao.modelDao;
import com.czxy.house.pojo.Modeller;
import com.czxy.house.service.modelService;

@Service
@Transactional
public class modelServiceImpl implements modelService{
	
	@Resource
	private modelDao dao;

	@Override
	public List<Modeller> showModeller(Modeller modeller) {
		return dao.selectAll();
	}


	

	
	
	
	
}
