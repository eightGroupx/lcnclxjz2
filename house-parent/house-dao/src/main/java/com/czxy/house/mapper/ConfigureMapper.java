package com.czxy.house.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.czxy.house.domain.Configure;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Config;

public interface ConfigureMapper extends Mapper<Configure> {
@Select("SELECT * FROM configure WHERE configure_id=#{id}")
public Configure findConfigure(@Param("id") Integer id);



}