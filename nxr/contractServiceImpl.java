package com.czxy.house.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.house.dao.contractDao;
import com.czxy.house.pojo.Contract;
import com.czxy.house.service.contractService;
@Service
@Transactional
public class contractServiceImpl implements contractService{
	@Resource
	private contractDao dao;

	@Override
	public void registerContract(Contract contract) {
		dao.insertSelective(contract);
	}
	
	
	
	
	
}
