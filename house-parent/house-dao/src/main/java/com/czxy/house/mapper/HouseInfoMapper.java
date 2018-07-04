package com.czxy.house.mapper;

import org.apache.ibatis.annotations.Select;

import com.czxy.house.domain.HouseInfo;

import tk.mybatis.mapper.common.Mapper;

public interface HouseInfoMapper extends Mapper<HouseInfo>{

	@Select("select * from house_info where info_id=#{infoId}")
	public HouseInfo findHouseinfo(Integer infoId);

}