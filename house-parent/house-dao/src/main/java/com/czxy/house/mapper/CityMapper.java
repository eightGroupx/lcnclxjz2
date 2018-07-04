package com.czxy.house.mapper;

import org.apache.ibatis.annotations.Select;

import com.czxy.house.domain.City;
import com.czxy.house.domain.Model;

import tk.mybatis.mapper.common.Mapper;

public interface CityMapper extends Mapper<City> {

	@Select("select * from city where city_id=#{cityId}")
	public Model findModel(Integer cityId );
}
