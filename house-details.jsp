<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="${pageContext.request.contextPath }/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>房源详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <script src="js/rem.js"></script> 
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/base.css"/>
    <link rel="stylesheet" type="text/css" href="css/page.css"/>
    <link rel="stylesheet" type="text/css" href="css/all.css"/>
    <link rel="stylesheet" type="text/css" href="css/mui.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/loaders.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/loading.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<script type="text/javascript">
		$(window).load(function(){
			$(".loading").addClass("loader-chanage")
			$(".loading").fadeOut(300)
		})
		
		
	</script>
</head>
<!--loading页开始-->
<div class="loading">
	<div class="loader">
        <div class="loader-inner pacman">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
	</div>
</div>
<!--loading页结束-->
	<body>
		<div class="headertwo clearfloat" id="header">
			<a href="javascript:history.go(-1)" class="fl box-s"><i class="iconfont icon-arrow-l fl"></i></a>
			<p class="fl">房源详情</p>
			<a href="#" class="fr" onClick="toshare()"><i class="iconfont icon-fenxiang fl"></i></a>
		</div>
		
		<!--分享内容-->
		<div class="am-share">
		  <h3 class="am-share-title">分享到</h3>
		  <ul class="am-share-sns">
		    <li><a href="#"> <i class="iconfont icon-weixin weixin"></i> <span>微信</span> </a> </li>
		    <li><a href="#"> <i class="iconfont icon-qq qq"></i> <span>QQ</span> </a> </li>
		    <li><a href="#"> <i class="iconfont icon-weibo weibo"></i> <span>微博</span> </a> </li>
		    <li><a href="#"> <i class="iconfont icon-renrenwang renren"></i> <span>人人</span> </a> </li>
		  </ul>
		  <div class="am-share-footer"><button class="share_btn">取消</button></div>
		</div>
		
		<div class="clearfloat" id="main">		
			<div class="service clearfloat">
				<div class="slider one-time">
					<div>
						<img src="upload/room.jpg"/>
						<div class="tit clearfloat box-s">
							<p class="one">${stock.houseName }</p>
							<p class="two">${stock.city.cityName }</p>
						</div>
					</div>
				</div>
			</div>		
			
			<div class="service-top clearfloat box-s">
			
				<div class="left fl clearfloat box-s">
					<p class="tit titwo">${stock.price }<span>元/月</span></p>
					<p class="fu-tit">${stock.model.modelName }   |  ${stock.houseInfo.square }m²  |  ${stock.houseInfo.fitment}</p>
				</div>
				<div class="right fl clearfloat">
					<i class="iconfont icon-shoucang"></i>
					<p>收藏</p>
				</div>
			</div>
			
			<div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>房屋信息</p>
		    	</div>
		    	<div class="service-list clearfloat box-s">
		    		<ul>
		    			<li>类型：${stock.houseInfo.houseType }</li>
		    			<li>朝向：${stock.houseInfo.orientation }</li>
		    			<li>楼层：${stock.houseInfo.level }/28 </li>
		    			<li>装修：${stock.houseInfo.fitment }</li>
		    			<c:if test="${stock.stockStatus==1 }">
		    			<li>现状：空闲</li>
		    			</c:if>
		    			<c:if test="${stock.stockStatus==1 }">
		    			<li>现状：已出租</li>
		    			</c:if>
		    			<li>可入驻：${stock.houseInfo.checkTime }</li>
		    			<li>建造年代：${stock.houseInfo.houseTime }年</li>
		    			<li>可看房：${stock.houseInfo.seeTime }以后</li>
		    		</ul>
		    		<p class="service-tit">交通：${stock.houseInfo.traffic }</p>
		    	</div>		    	
			</div>
			
			<div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>配置设施</p>
		    	</div>
		    	<div class="service-ties clearfloat box-s">
		    		<ul>
		    		 <c:forEach var="list" items="${stock.configures }">
		    			<li><i class="${list.configure.configureCss }"></i>${list.configure.configureName }</li>
		    		</c:forEach> 
		    			
		    		</ul>
		    	</div>
			</div>
			
			<div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>房源描述</p>
		    	</div>
		    	<p class="tit box-s">
		    		${stock.described }
		    	</p>
			</div>
			
			<div class="service-ctent clearfloat">
				<div class="recom-tit clearfloat box-s">
		    		<p>相似好房</p>
		    	</div>
		    	<div class="recom-xia clearfloat box-s">
		    		<div class="list clearfloat fl">
		    		<c:forEach var="list" items="${list }">
		    			<a href="house-details.html">
			    			<div class="tu">
			    				<span></span>
			    				<img src="upload/1.jpg"/>
			    			</div>
			    			<div class="bottom clearfloat">
			    			
			    				<div class="top clearfloat">
			    					<p class="biaoti">${list.houseName }</p>
			    					<p class="price">${list.price }<span>元/月</span></p>
			    				</div>
			    				<p class="fu-tit">
			    					${list.model.modelName }|  ${list.houseInfo.square }m²  |  ${list.houseInfo.fitment }
			    				</p>
			    			</div>
			    			</c:forEach>
		    			</a>
		    		</div>
		    	
		    	</div>
			</div>
			
		</div>
		
		<div class="footer-look clearfloat" id="footer">
			<a href="#loginmodal" id="modaltrigger">我要看房</a>
		</div>
		
		
		
	    <!--弹窗内容 star-->
	    <div id="loginmodal" class="box-s loginmodal" style="display:none;">	    	
			<form  action="${pageContext.request.contextPath}/stock/findUserOrder.action" method="post">
				<!-- 预约房子Id -->
				<input type="hidden" name="stockId" id="username" value="" />
				<!-- 预约房子Id  -->	
				<div class="center">
				</div>
				<div class="top clearfloat box-s">
					填写信息
				</div>
				<div class="bottom clearfloat box-s">
					<ul>
						<li class="clearfloat">
							<i class="iconfont icon-user"></i>
							<input type="text" name="username" id="username" value="" placeholder="您的姓名" />
						</li>
						<li class="clearfloat">
							<i class="iconfont icon-phone"></i>
							<input type="text" name="userPhone" id="userPhoneId" value="" placeholder="您的手机号码" />
						</li>
						<li class="clearfloat">
							<i class="iconfont icon-calendar"></i>
							<input type="date" name="orderTime" id="orderTime" value="" placeholder="请选择看房时间" />
						</li>
					</ul>
					<input type="submit" value="立即预约" class="btn" />
				</div>
			</form>
			
		</div>
	    <!--弹窗内容 end-->
		
	</body>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
	<script type="text/javascript" src="slick/slick.min.js" ></script>
	<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="js/tchuang.js" ></script>
	<script type="text/javascript" src="js/hmt.js" ></script>
	<script type="text/javascript">
		$('.one-time').slick({
		  dots: true,
		  infinite: false,
		  speed: 300,
		  slidesToShow: 1,
		  touchMove: false,
		  slidesToScroll: 1
		});
	</script>
	<!--分享js-->
	<script type="text/javascript">
		function toshare(){
			$(".am-share").addClass("am-modal-active");	
			if($(".sharebg").length>0){
				$(".sharebg").addClass("sharebg-active");
			}else{
				$("body").append('<div class="sharebg"></div>');
				$(".sharebg").addClass("sharebg-active");
			}
			$(".sharebg-active,.share_btn").click(function(){
				$(".am-share").removeClass("am-modal-active");	
				setTimeout(function(){
					$(".sharebg-active").removeClass("sharebg-active");	
					$(".sharebg").remove();	
				},300);
			})
		}	
	</script>
</html>
