<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>整租</title>
<meta name="keywords" content="">
<meta name="description" content="">
<script src="js/rem.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/page.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/all.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/mui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/loaders.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/loading.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/slick/slick.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/menu.js"></script>
<script type="text/javascript">
	$(window).load(function() {
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
		<a href="javascript:history.go(-1)" class="fl box-s"><i
			class="iconfont icon-arrow-l fl"></i></a>
		<p class="fl" id="city">宿迁</p>
		<a href="javascript:history.go(-1)" class="fr"><i
			class="iconfont icon-sousuo fl"></i></a>
	</div>
	<div class="clearfloat" id="main">
		<div class="menu-list clearfloat am-sharetwo">
			<ul class="yiji" id="oe_menu">
				<li>
				<a href="#" class="inactive">户型<i></i></a>
					<ul style="display: none">
						<li><a href="${pageContext.request.contextPath }/house/findByModel.action?stocktypeId=${stocktypeId}&id=1">一室一厅</a></li>
						<li><a href="${pageContext.request.contextPath }/house/findByModel.action?stocktypeId=${stocktypeId}&id=2">一室两厅</a></li>
						<li><a href="${pageContext.request.contextPath }/house/findByModel.action?stocktypeId=${stocktypeId}&id=3">两室两厅</a></li>
						<li><a href="${pageContext.request.contextPath }/house/findByModel.action?stocktypeId=${stocktypeId}&id=4">三室两厅</a></li>
						<li><a href="${pageContext.request.contextPath }/house/findByModel.action?stocktypeId=${stocktypeId}&id=5">四室两厅</a></li>
						<li><a href="${pageContext.request.contextPath }/house/findByModel.action?stocktypeId=${stocktypeId}&id=6">小别墅</a></li>
						<li><a href="${pageContext.request.contextPath }/house/findByModel.action?stocktypeId=${stocktypeId}&id=7">小别墅</a></li>

					</ul></li>
				<li><a href="#" class="inactive">租金<i></i></a>
					<ul style="display: none">
						<li><a
							href="${pageContext.request.contextPath }/house/findByprice.action?stocktypeId=${stocktypeId}&id=1">1000-3000元</a></li>
						<li><a
							href="${pageContext.request.contextPath }/house/findByprice.action?stocktypeId=${stocktypeId}&id=2">3000-5000元</a></li>
						<li><a
							href="${pageContext.request.contextPath }/house/findByprice.action?stocktypeId=${stocktypeId}&id=3">5000-8000元</a></li>
						<li><a
							href="${pageContext.request.contextPath }/house/findByprice.action?stocktypeId=${stocktypeId}&id=4">8000以上</a></li>
					</ul></li>
				<li><a href="#" class="inactive">排序<i></i></a>
					<ul style="display: none">
						<li><a id="jiage"
							href="${pageContext.request.contextPath }/house/priceDesc.action?stocktypeId=${stocktypeId}&id=1">价格升序</a></li>
						<li><a id="jiage"
							href="${pageContext.request.contextPath }/house/priceDesc.action?stocktypeId=${stocktypeId}&id=2">价格降序</a></li>
					</ul></li>
			</ul>
		</div>

		<div id="oe_overlay" class="oe_overlay"></div>

		<div class="recom clearfloat recomtwo">
			<div class="content clearfloat box-s">

				<c:forEach var="stock" items="${stocks }" varStatus="st">
					<div class="list clearfloat fl box-s">
						<a href="${pageContext.request.contextPath }/house-details.jsp">
							<div class="tu clearfloat">
								<span></span> <img
									src="${pageContext.request.contextPath }/upload/111.jpg" />
							</div>

							<div class="right clearfloat">
								<div class="tit clearfloat">
									<p class="fl">${stock.houseName }</p>
									<span class="fr">${stock.price }<samp>元/月</samp></span>
								</div>
								<p class="recom-jianjie">
								<c:forEach var="model" items="${stock.mlist }">
								${model.modelName }
								</c:forEach>
								
								| 125m² |
									普装</p>
								<div class="recom-bottom clearfloat">
									<span><i class="iconfont icon-duihao"></i>随时住</span> <span><i
										class="iconfont icon-duihao"></i>家电齐全</span>
								</div>
							</div>

						</a>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/psong.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/hmt.js"></script>
</html>
