package com.czxy.house.mapper;

import org.apache.ibatis.annotations.Select;

import com.czxy.house.domain.User;

import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User>{
@Select("SELECT COUNT(uid) FROM  user")
	int findUserNum();

}