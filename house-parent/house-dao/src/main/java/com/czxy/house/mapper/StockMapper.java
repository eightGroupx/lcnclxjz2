package com.czxy.house.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.czxy.house.domain.Configure;
import com.czxy.house.domain.Orders;
import com.czxy.house.domain.Stock;
import com.czxy.house.domain.StockConfigure;

import tk.mybatis.mapper.common.Mapper;

public interface StockMapper extends Mapper<Stock> {

	@Select("select * from stock")
	@Results(id = "stockMap", value = {
			@Result(property = "model", one = @One(select = "com.czxy.house.mapper.ModelMapper.findModel"), column = "model_id"),
			@Result(property = "houseInfo", one = @One(select = "com.czxy.house.mapper.HouseInfoMapper.findHouseinfo"), column = "info_id"),
			@Result(property = "city", one = @One(select = "com.czxy.house.mapper.CityMapper.findModel"), column = "city_id"),
			@Result(property = "configures", one = @One(select = "com.czxy.house.mapper.ConfigureMapper.selectByPrimaryKey"), column = "configure_id")

	})
	List<Stock> findStock();

	@Select("select * from stock where stock_id=#{id}")
	@Results(value = {
			@Result(property = "model", one = @One(select = "com.czxy.house.mapper.ModelMapper.findModel"), column = "model_id"),
			@Result(property = "houseInfo", one = @One(select = "com.czxy.house.mapper.HouseInfoMapper.findHouseinfo"), column = "info_id"),
			@Result(property = "city", one = @One(select = "com.czxy.house.mapper.CityMapper.findModel"), column = "city_id"),
			@Result(property = "configures", many = @Many(select = "com.czxy.house.mapper.StockConfigureMapper.findStockConfigure"), column = "stock_id")
			// @Result(property="configures",one=@One(select="com.czxy.house.mapper.ConfigureMapper.selectByPrimaryKey"),column="configure_id")

	})
	Stock findStockById(@Param("id") Integer id);

	@Select("SELECT configure_id FROM stock_configure WHERE stock_id=#{id}")
	@Results(value = {
			@Result(property = "configures", many = @Many(select = "com.czxy.house.mapper.StockConfigureMapper.findStockConfigure"), column = "configure_id")

	})
	List<StockConfigure> findStockConfig(@Param("id") Integer id);

//	@Select("SELECT * FROM stock WHERE house_name LIKE '%${houseName}%'")
	@Select("SELECT * FROM stock WHERE house_name LIKE #{houseName}")
	List<Stock> findStockByName(String houseName);

	

//	@Select("SELECT #{username},#{userPhone} FROM USER WHERE uid = (SELECT uid FROM orders USER)")
//	Orders findUserOrder(String username, String userPhone);

}