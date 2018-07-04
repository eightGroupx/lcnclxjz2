package com.czxy.house.mapper;

import java.util.List;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.czxy.house.domain.Configure;
import com.czxy.house.domain.StockConfigure;

import tk.mybatis.mapper.common.Mapper;


public interface StockConfigureMapper extends Mapper<StockConfigure>{
	
	@Select("SELECT * FROM stock_configure WHERE stock_id =#{id}")
	@Results(value={
			@Result(property="configure",one=@One(select="com.czxy.house.mapper.ConfigureMapper.findConfigure"),column="configure_id")
	})
	List<StockConfigure> findStockConfigure(@Param("id") Integer id);
}