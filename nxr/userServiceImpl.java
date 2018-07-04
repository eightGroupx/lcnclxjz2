package com.czxy.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.czxy.house.dao.userDao;
import com.czxy.house.pojo.User;
import com.czxy.house.service.userService;

@Service
@Transactional
public class userServiceImpl implements userService{
	@Resource
	private userDao dao;

	@Override
	public User login(User user) {
		List<User> list = dao.selectAll();
		for (User u : list) {
			if (u.getUserPhone().equals(user.getUserPhone()) && u.getPassword().equals(user.getPassword())) {
				return u;
			}
		}
		return null;
	}

	//查询用户
	@Override
	public User findUserUid(Integer uid) {
		return dao.selectByPrimaryKey(uid);
	}


}
