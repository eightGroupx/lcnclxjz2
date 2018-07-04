package com.czxy.house.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.czxy.house.pojo.Stock;
import com.czxy.house.pojo.StockType;
import com.czxy.house.pojo.User;
import com.czxy.house.pojo.Address;
import com.czxy.house.pojo.City;
import com.czxy.house.pojo.Modeller;
import com.czxy.house.service.contractService;
import com.czxy.house.service.modelService;
import com.czxy.house.service.stockService;
import com.czxy.house.service.stocktypeService;
import com.czxy.house.service.userService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/house")
public class StockController {

	@Resource
	private stockService service;

	@Resource
	private modelService mservice;

	@Resource
	private contractService cservice;

	@Resource
	private stocktypeService tservice;
	
	@Resource
	private userService uservice;
	
	

	// 房东注册/我要出租
	@RequestMapping("/register")
	public String registerStock(Stock stock) {
		service.registerStock(stock);
		return "forward:/index.jsp";
	}

	// 回显
	@RequestMapping("/show")
	public String showHouse(StockType stocktype,User user, Model model, HttpSession session, Modeller modeller) {
		List<StockType> slist = tservice.showStockType(stocktype);
		List<Modeller> mlist = mservice.showModeller(modeller);
		model.addAttribute("slist", slist);
		model.addAttribute("mlist", mlist);
		//用户信息回显
		User u = (User) session.getAttribute("login");
		System.out.println("用户的ID:"+u.getUid());
		User us = uservice.findUserUid(u.getUid());
		model.addAttribute("user", us);
		return "forward:/landlord.jsp";
	}
	// 回显2
	@RequestMapping("/showtwo")
	public String showHouse2(StockType stocktype,User user, Model model, HttpSession session, Modeller modeller) {
		List<StockType> slist = tservice.showStockType(stocktype);
		List<Modeller> mlist = mservice.showModeller(modeller);
		model.addAttribute("slist", slist);
		model.addAttribute("mlist", mlist);
		//用户信息回显
		User u = (User) session.getAttribute("login");
		System.out.println("用户的ID:"+u.getUid());
		User us = uservice.findUserUid(u.getUid());
		model.addAttribute("user", us);
		return "forward:/lease.jsp";
	}
	
	
	// 用户登录
		@RequestMapping("login")
		public String login(User user, Model model, HttpSession session) {
			User login = uservice.login(user);
			// 比较 如果为空则登陆成功，如果不为空则登陆失败
			if (login != null) {
				session.setAttribute("login", login);
				return "forward:/p-center.jsp";
			} else {
				model.addAttribute("msg", "账号或密码错误");
				return "forward:/sign.jsp";
			}
		}
	
	// 整租，合租，短租，写字楼
	@RequestMapping("/findAll.action")
	public  String findAll(Integer stocktypeId, Model model) {
		List<Stock> stocks = service.findAll(stocktypeId);
		model.addAttribute("stocks", stocks);
		model.addAttribute("stocktypeId", stocktypeId);
		return "forward:/entire.jsp";
	}

	// 按照价格的降序排序
	@RequestMapping("/priceDesc.action")
	public String priceDesc(Integer stocktypeId, Model model,Integer id) {
		
		List<Stock> stocks = service.priceDesc(stocktypeId,id);
		model.addAttribute("stocks", stocks);
		model.addAttribute("stocktypeId", stocktypeId);
		return "forward:/entire.jsp";
	}

	// 按照租金排序
	@RequestMapping("/findByprice.action")
	public String findByprice(Integer stocktypeId, Model model,Integer id) {
		List<Stock> stocks = service.findByprice(stocktypeId,id);
		model.addAttribute("stocks", stocks);
		model.addAttribute("stocktypeId", stocktypeId);
		return "forward:/entire.jsp";
	}

	
	//查询所有的城市
	@RequestMapping("/selectAddress.action")
	@ResponseBody
	public List<City> selectAddress(){
		List<City> cities = service.selectAddress();
	return cities;
	}
	
	//查询户型
	@RequestMapping("findByModel.action")
	public String findByModel(Integer stocktypeId, Model model,Integer id) {
		List<Stock> stocks =service.findByModel(stocktypeId,id);
		model.addAttribute("stocks", stocks);
		model.addAttribute("stocktypeId", stocktypeId);
		return "forward:/entire.jsp";
	}

}
