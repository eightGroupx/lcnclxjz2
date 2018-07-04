package com.czxy.house.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.czxy.house.dao.AddressMapper;
import com.czxy.house.dao.CityMapper;
import com.czxy.house.dao.ModellerMapper;
import com.czxy.house.dao.stockDao;
import com.czxy.house.pojo.Address;
import com.czxy.house.pojo.City;
import com.czxy.house.pojo.Modeller;
import com.czxy.house.pojo.Stock;
import com.czxy.house.service.stockService;

@Service
@Transactional 
public class stockServiceImpl implements stockService{
	@Resource
	private stockDao dao;
	
	@Resource
	private CityMapper cityMapper;
	
	@Resource
	private AddressMapper addressMapper ;
	
	@Resource
	private ModellerMapper modellerMapper;

	//注册房东
	@Override
	public void registerStock(Stock stock) {
		Integer uid = stock.getUid();
		String houseName = stock.getHouseName();
		System.out.println(houseName);
		Integer price = stock.getPrice();
		System.out.println(price);
		Date stockTime = stock.getStockTime();
		System.out.println(stockTime);
		Integer stocktypeId = stock.getStocktypeId();
		System.out.println(stocktypeId);
		Integer modelId = stock.getModelId();
		System.out.println(modelId);
		String described = stock.getDescribed();
		System.out.println(described);
		dao.registerStock(uid,houseName, price, stockTime, stocktypeId, modelId, described);
		
	}

	@Override
	public List<Stock> showStock() {
		
		return dao.showStock();
	}

	//整租，合租，短租，写字楼
	public List<Stock> findAll(Integer stocktypeId) {
		return dao.findAll(stocktypeId);
	}

	//按照租金排序
	public List<Stock> priceDesc(Integer stocktypeId,Integer id) {
		if (id==1) {
			return dao.priceDesc1(stocktypeId);
		} else {
			return dao.priceDesc2(stocktypeId);
		}
	}

	//按照租金排序
	public List<Stock> findByprice(Integer stocktypeId,Integer id) {
		if (id==1) {
			return dao.findByprice1(stocktypeId);
		}
		if (id==2) {
			return dao.findByprice2(stocktypeId);
		}
		if (id==3) {
			return dao.findByprice3(stocktypeId);
		}
		if (id==4) {
			return dao.findByprice4(stocktypeId);
		}
		return null;
	}

	//查找所有城市
	public List<City> selectAddress() {
		return cityMapper.selectAll();
	}

	//查询所有的户型
	public List<Stock> findByModel(Integer stocktypeId, Integer id) {
		if (id==1) {
			return modellerMapper.findByModel1(stocktypeId,id);
		}
		if (id==2) {
			return modellerMapper.findByMode2(stocktypeId,id);
		}
		if (id==3) {
			return modellerMapper.findByModel3(stocktypeId,id);
		}
		if (id==4) {
			return modellerMapper.findByModel4(stocktypeId,id);
		}
		return null;
	}

	
	
	

	
	
	


	
	
	



}
