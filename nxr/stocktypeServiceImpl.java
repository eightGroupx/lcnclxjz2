package com.czxy.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.house.dao.stocktypeDao;
import com.czxy.house.pojo.StockType;
import com.czxy.house.service.stocktypeService;
@Service
@Transactional
public class stocktypeServiceImpl implements stocktypeService{
	@Resource
	private stocktypeDao dao;

	@Override
	public List<StockType> showStockType(StockType stocktype) {
		return dao.selectAll();
	}
	
}
