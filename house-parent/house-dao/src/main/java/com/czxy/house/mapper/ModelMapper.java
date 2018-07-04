package com.czxy.house.mapper;

import org.apache.ibatis.annotations.Select;

import com.czxy.house.domain.Model;

import tk.mybatis.mapper.common.Mapper;

public interface ModelMapper extends Mapper<Model>{

	@Select("select * from model where model_id=#{modelId}")
	public Model findModel(Integer modelId );
}