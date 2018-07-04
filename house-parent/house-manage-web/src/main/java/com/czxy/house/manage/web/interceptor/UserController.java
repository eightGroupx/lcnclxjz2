package com.czxy.house.manage.web.interceptor;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.czxy.house.service.UserService;

@Controller
@RequestMapping(path = "/user")
public class UserController {
	@Resource
	private UserService userService;

	@RequestMapping(path = "/findUserNum.action")
	public @ResponseBody Integer findUserNum() {
		int num = userService.findUserNum();
		return  num;

	}

}
