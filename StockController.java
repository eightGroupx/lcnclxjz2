package com.czxy.house.manage.web.interceptor;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.czxy.house.domain.Orders;
import com.czxy.house.domain.Stock;
import com.czxy.house.service.StockService;

@Controller
@RequestMapping(path="/stock")
public class StockController {
	
	@Resource
	private StockService stockService;
/*
 * 房源查询所有
 */
	@RequestMapping(path="/findStock.action")
	public String findStock(Model model){
		List<Stock> list = stockService.findStock();
		model.addAttribute("list", list);
		return "index";
		
	}
	
	
	/*
	 * 查询房源详情
	 */
	@RequestMapping(path="/findStockById.action")
	public String findStockById(Integer id ,Model model){
		Stock stock = stockService.findStockById(id);
		model.addAttribute("stock", stock);
		List<Stock> list = stockService.findStock();
		model.addAttribute("list", list);
		
		return "house-details";
		
	}
	
	/*
	 * 模糊查询
	 * 
	 * 当页面使用ajax的post方式请求后台的时候，后台接收参数使用@RequestBody
	 * 
	 * 当页面表单使用post方式提交的时候，一定不能加@RequestBody，加了就获取不到值
	 * 
	 */
	@RequestMapping(path="/findStockByName.action",method = RequestMethod.POST)
	public  @ResponseBody List<Stock> findStockByName(@RequestBody String houseName ,Model model){
		System.out.println(houseName);
		JSONObject parse = (JSONObject) JSON.parse(houseName);
		houseName = parse.getString("houseName");
		List<Stock> list = stockService.findStockByName(houseName);
		return list;
		
	}

	/*
	 * 我要预约的登陆
	 */
	@RequestMapping(path="/findUserOrder.action")
	public  String findUserOrder(Orders orders){
		System.out.println(orders);
		stockService.addUserOrder(orders);
		return "schedule";
		
		
		
//		ModelAndView modelAndView = new ModelAndView();
//	Orders orders = stockService.findUserOrder(username,userPhone);
//	if (!orders.getUser().getUsername().equals(username)) {
//		model.addAttribute("msg", "用户名不存在，请先登录");
//		modelAndView.setViewName("house-details");
//	}
//	if (!orders.getUser().getUserPhone().equals(userPhone)) {
//		model.addAttribute("msg", "手机号已经存在，请先登录");
//		modelAndView.setViewName("house-details");
//	}
//		
//	modelAndView.setViewName("schedule");
//		return modelAndView;
		
	}
	
}
