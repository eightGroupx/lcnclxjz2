<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="${pageContext.request.contextPath }/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>首页</title>
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
		  //页面加载成功
		$(function(){
			
			/**一级分类 start*/
		    var url = "${pageContext.request.contextPath}/user/findUserNum.action";
			var params = {};
			
			$.ajax({
				url:url,					//请求路径
				data: JSON.stringify(params),				//请求参数 
				type:"post",				//请求方式
				success:function( data ){	//成功回调
					//data所有的分类
					$(data).each( function(i,n){
						$("#num").append("<p class='header-num'>房嫂已为<span>"+n+"</span>用户成功租房！</p><p class='header-da'>轻松租房  乐享生活</p>");	
					} );
				},
				error:function(){			//失败回调
					
				},
				
				//响应数据的格式
				"contentType":"application/json;charset=UTF-8",		//请求数据的格式
			}) 
		})
		
		
		
		
		  //页面加载成功
		$(function(){
			$("#ss").blur(function(){
				/**一级分类 start*/
			    var url = "${pageContext.request.contextPath}/stock/findStockByName.action";
				var params = {"houseName":$(this).val()};
				
				$.ajax({
					url:url,					//请求路径
					data:  JSON.stringify(params),				//请求参数 
					type:"post",				//请求方式
					success:function(data){	//成功回调
						//data所有的分类
						$(data).each( function(i,n){
							//"+n.stockId+"'
							var str = "<a href=${pageContext.request.contextPath}/stock/findStockById.action?id="+n.stockId+">"+n.houseName+"</a>";
							alert(str);
						$(".tags").append(str)	
						} );
					},
					error:function(){			//失败回调
						
					},
					contentType:"application/json;charset=utf-8"
				}) 
				
				
				
			})
			
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
		<!--header star-->
		<div class="header clearfloat">
			<div class="tu clearfloat">
				<img src="img/index-banner.jpg"/>
			</div>
			<header class="mui-bar mui-bar-nav">
				<a class="btn" href="#">		            
		            <p>合肥<i class="iconfont icon-iconfontarrowdown-copy"></i></p>
		        </a>
		        <div class="top-sch-box flex-col">
		            <div class="centerflex">
		                <i class="fdj iconfont icon-sousuo"></i>
		                <div class="sch-txt">请输入您要搜索的内容</div>
		            </div>
		        </div>
		    </header>
		    <div class="header-tit clearfloat" id="num">
		    	
		    	
		    </div>
		</div>
		<!--header end-->
		<div id="main" class="mui-clearfix">
		 	<!-- 搜索层 -->
		    <div class="pop-schwrap">
		        <div class="ui-scrollview">
		        	<div class="poo-mui clearfloat box-s">
		        		<div class="mui-bar mui-bar-nav clone poo-muitwo">
			                <div class="top-sch-box flex-col">
			                    <div class="centerflex">
			                    	<i class="fdj iconfont icon-sousuo"></i>
			                        <input type="text" class="sch-input mui-input-clear"  name="houseName" id = "ss"  placeholder="请输入您要搜索的内容" />
			                    </div>
			                </div>			                
			            </div>
			            <a href="javascript:;" class="mui-btn mui-btn-primary btn-back" href="#">取消</a>
		        	</div>		            
		            <div class="scroll-wrap">
		                <div class="mui-scroll">
		                    <div class="sch-cont">
		                        <div class="section ui-border-b">
		                            <div class="tit">热门搜索</div>
		                            <div class="tags">
		                                <!-- <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span>
		                                <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span>
		                                <span class="tag">大溪地</span><span class="tag">大溪地</span><span class="tag">大溪地</span> -->
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    <div class="cation clearfloat">
		    	<ul class="clearfloat">
		    		<li>
		    			<a href="entire.html">
			    			<img src="img/fang.png" />
			    			<p>整租</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="entire.html">
			    			<img src="img/chuang.png" />
			    			<p>合租</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="entire.html">
			    			<img src="img/bao.png" />
			    			<p>短租</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="entire.html">
			    			<img src="img/lou.png" />
			    			<p>写字楼</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="map.html">
			    			<img src="img/map.png" />
			    			<p>地图找房</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="landlord.html">
			    			<img src="img/people.png" />
			    			<p>我是房东</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="join.html">
			    			<img src="img/woshou.png" />
			    			<p>加盟</p>
		    			</a>
		    		</li>
		    		<li>
		    			<a href="life-service.html">
			    			<img src="img/self.png" />
			    			<p>生活服务</p>
		    			</a>
		    		</li>
		    	</ul>
		    </div>
		    
		    <div class="recom clearfloat">
		    	<div class="recom-tit clearfloat box-s">
		    		<p>热门房源推荐</p>
		    	</div>
		    	<div class="content clearfloat box-s">
		    		<c:forEach var="list" items="${list }">
		    		<div class="list clearfloat fl box-s">
		    	
		    			<a href="${pageContext.request.contextPath }/stock/findStockById.action?id=${list.stockId}" >
			    			<div class="tu clearfloat">
			    				<span></span>
			    				<img src="upload/list-tu.jpg"/>
			    			</div>
			    			<div class="right clearfloat">
			    				<div class="tit clearfloat">
			    					<p class="fl">${list.houseName }</p>
			    					<span class="fr">${list.price }<samp>元/月</samp></span>
			    				</div>
			    				<p class="recom-jianjie">${list.model.modelName }|  ${list.houseInfo.square }m²  |  ${list.houseInfo.fitment }</p>
			    				<div class="recom-bottom clearfloat">
			    					<span><i class="iconfont icon-duihao"></i>随时住</span>
			    					<span><i class="iconfont icon-duihao"></i>家电齐全</span>
			    				</div>
			    			</div>
		    			</a>
		    			
		    		</div>
		</c:forEach>
		    </div>
	   </div>
	   
	   <footer class="page-footer fixed-footer" id="footer">
			<ul>
				<li class="active">
					<a href="index.html">
						<i class="iconfont icon-shouyev1"></i>
						<p>首页</p>
					</a>
				</li>
				<li>
					<a href="lease.html">
						<i class="iconfont icon-chuzuwo"></i>
						<p>我要出租</p>
					</a>
				</li>
				<li>
					<a href="stock/schedule.jsp">
						<i class="iconfont icon-richengbiao"></i>
						<p>看房日程</p>
					</a>
				</li>
				<li>
					<a href="sign.html">
						<i class="iconfont icon-gerenzhongxin"></i>
						<p>个人中心</p>
					</a>
				</li>
			</ul>
		</footer>
	</body>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
	<script src="js/fastclick.js"></script>
	<script src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/hmt.js" ></script>
	<!--插件-->
	<link rel="stylesheet" href="css/swiper.min.css">
	<script src="js/swiper.jquery.min.js"></script>
	<!--插件-->

	<!--搜索点击效果-->
	<script >
	    $(function () {
	        var banner = new Swiper('.banner',{
	            autoplay: 5000,
	            pagination : '.swiper-pagination',
	            paginationClickable: true,
	            lazyLoading : true,
	            loop:true
	        });
	
	         mui('.pop-schwrap .sch-input').input();
	        var deceleration = mui.os.ios?0.003:0.0009;
	         mui('.pop-schwrap .scroll-wrap').scroll({
	                bounce: true,
	                indicators: true,
	                deceleration:deceleration
	        });
	        $('.top-sch-box .fdj,.top-sch-box .sch-txt,.pop-schwrap .btn-back').on('click',function () {
	            $('html,body').toggleClass('holding');
	            $('.pop-schwrap').toggleClass('on');
	            if($('.pop-schwrap').hasClass('on')) {;
	                $('.pop-schwrap .sch-input').focus();
	            }
	        });
	
	    });
	</script>
</html>
