<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-CH">
<head>

	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/bind_cart.js"></script>
<style type="text/css">
.spe-img {
	height: 60px;
	width: 70px;
}

.tips {
	color: #ff5722;
	font-size: 12px;
	margin-bottom: 10px;
}

.user-img {
	height: 40px;
	width: 40px;
}
.dropdown-menu1{
	position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    list-style: none;
    font-size: 14px;
    text-align: left;
    background-color: #fff;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    box-shadow: 0 2px 8px rgba(0,0,0,.1);
    border-color: transparent;
    background-clip: padding-box;
}
.user ul li{
	display: block !important;    
    width: 100% !important;
    opacity: 0.87;
    
}

.user{
	position: relative;  
	display: inline-block;
	width: 160px; 
}
.user-head{
	
	display: block;
	margin: 0 60px;
}
@
keyframes pop-in { 0% {
	opacity: 0;
	transform: scale(0.1);
}

60%
{
opacity
:
 
1;
transform
:
 
scale
(1
.2
);
 
}
100%
{
transform
:
 
scale
(1);
 
}
}
@
-webkit-keyframes pop-in { 0% {
	opacity: 0;
	-webkit-transform: scale(0.1);
}

60%
{
opacity
:
 
1;
-webkit-transform
:
 
scale
(1
.2
);
 
}
100%
{
-webkit-transform
:
 
scale
(1);
 
}
}
@
-moz-keyframes pop-in { 0% {
	opacity: 0;
	-moz-transform: scale(0.1);
}

60%
{
opacity
:
 
1;
-moz-transform
:
 
scale
(1
.2
);
 
}
100%
{
-moz-transform
:
 
scale
(1);
 
}
}
.minicartk-showing #PPminicartk {
	display: block;
	transform: translateZ(0);
	-webkit-transform: translateZ(0);
	-moz-transform: translateZ(0);
	animation: pop-in 0.25s;
	-webkit-animation: pop-in 0.25s;
	-moz-animation: pop-in 0.25s;
}

#PPminicartk {
	display: none;
	position: fixed;
	left: 50%;
	top: 75px;
}

#PPminicartk form {
	position: relative;
	width: 400px;
	max-height: 400px;
	margin-left: -200px;
	padding: 10px 10px 40px;
	background: #fbfbfb;
	border: 1px solid #d7d7d7;
	border-radius: 4px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
	font: 15px/normal arial, helvetica;
	color: #333;
}

#PPminicartk form.minicartk-empty {
	padding-bottom: 10px;
	font-size: 16px;
	font-weight: bold;
}

#PPminicartk ul {
	clear: both;
	float: left;
	width: 380px;
	margin: 5px 0 20px;
	padding: 10px;
	list-style-type: none;
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
}

#PPminicartk .minicartk-empty ul {
	display: none;
}

#PPminicartk .minicartk-closer {
	float: right;
	margin: -12px -10px 0;
	padding: 10px;
	background: 0;
	border: 0;
	font-size: 18px;
	cursor: pointer;
	font-weight: bold;
}

#PPminicartk .minicartk-item {
	clear: left;
	padding: 6px 0;
	min-height: 25px;
}

#PPminicartk .minicartk-item+.minicartk-item {
	border-top: 1px solid #f2f2f2;
}

#PPminicartk .minicartk-item a {
	color: #333;
	text-decoration: none;
}

#PPminicartk .minicartk-details-name {
	float: left;
	width: 62%;
}

#PPminicartk .minicartk-details-quantity {
	float: left;
	width: 15%;
}

#PPminicartk .minicartk-details-remove {
	float: left;
	width: 7%;
}

#PPminicartk .minicartk-details-price {
	float: left;
	width: 16%;
	text-align: right;
}

#PPminicartk .minicartk-attributes {
	margin: 0;
	padding: 0;
	background: transparent;
	border: 0;
	border-radius: 0;
	box-shadow: none;
	color: #999;
	font-size: 12px;
	line-height: 22px;
}

#PPminicartk .minicartk-attributes li {
	display: inline;
}

#PPminicartk .minicartk-attributes li:after {
	content: ",";
}

#PPminicartk .minicartk-attributes li:last-child:after {
	content: "";
}

#PPminicartk .minicartk-quantity {
	width: 30px;
	height: 18px;
	padding: 2px 4px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	font-size: 13px;
	text-align: right;
	transition: border linear 0.2s, box-shadow linear 0.2s;
	-webkit-transition: border linear 0.2s, box-shadow linear 0.2s;
	-moz-transition: border linear 0.2s, box-shadow linear 0.2s;
}

#PPminicartk .minicartk-quantity:hover {
	border-color: #0078C1;
}

#PPminicartk .minicartk-quantity:focus {
	border-color: #0078C1;
	outline: 0;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 3px
		rgba(0, 120, 193, 0.4);
}

#PPminicartk .minicartk-remove {
	width: 18px;
	height: 19px;
	margin: 2px 0 0;
	padding: 0;
	background: #b7b7b7;
	border: 1px solid #a3a3a3;
	border-radius: 3px;
	color: #fff;
	font-size: 13px;
	opacity: 0.70;
	cursor: pointer;
}

#PPminicartk .minicartk-remove:hover {
	opacity: 1;
}

#PPminicartk .minicartk-footer {
	clear: left;
}

#PPminicartk .minicartk-subtotal {
	position: absolute;
	bottom: 17px;
	padding-left: 6px;
	left: 10px;
	font-size: 16px;
	font-weight: bold;
}

#PPminicartk .minicartk-submit {
	position: absolute;
	bottom: 10px;
	right: 10px;
	min-width: 153px;
	height: 33px;
	margin-right: 6px;
	padding: 0 9px;
	border: 1px solid #ffc727;
	border-radius: 5px;
	color: #000;
	text-shadow: 1px 1px 1px #fff6e9;
	cursor: pointer;
	background: #ffaa00;
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZjZlOSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmZmFhMDAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
	background: -moz-linear-gradient(top, #fff6e9 0%, #ffaa00 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fff6e9),
		color-stop(100%, #ffaa00));
	background: -webkit-linear-gradient(top, #fff6e9 0%, #ffaa00 100%);
	background: -o-linear-gradient(top, #fff6e9 0%, #ffaa00 100%);
	background: -ms-linear-gradient(top, #fff6e9 0%, #ffaa00 100%);
	background: linear-gradient(to bottom, #fff6e9 0%, #ffaa00 100%);
}

#PPminicartk .minicartk-submit img {
	vertical-align: middle;
	padding: 4px 0 0 2px;
}
</style>
<title>Home</title>
<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script>
		addEventListener("load", function() {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!--//tags -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
		media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet">
		<!--pop-up-box-->
		<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
			media="all" />
		<!--//pop-up-box-->
		<!-- price range -->
		<link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
			<!-- fonts -->
			<link
				href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
				rel="stylesheet">
</head>

<s:if test="#cartList.size() > 5">
<body class="minicartk-showing">
</s:if>
<s:else>
<body>   
</s:else>
	<!-- top-header -->
	<div class="header-most-top">
		<p>Grocery Offer Zone Top Deals & Discounts</p>
	</div>
	<!-- //top-header -->
	<!-- header-bot-->
	<div class="header-bot">
		<div class="header-bot_inner_wthreeinfo_header_mid">
			<!-- header-bot-->
			<div class="col-md-4 logo_agile">
				<h1>
					<a href="index.html"> <span>G</span>rocery <span>S</span>hoppy
						<img src="images/logo2.png" alt=" "></a>
				</h1>
			</div>
			<!-- header-bot -->
			<div class="col-md-8 header">
				<!-- header lists -->
				<ul>
					<li><a class="play-icon popup-with-zoom-anim"
						href="#small-dialog1"> <span class="fa fa-map-marker"
							aria-hidden="true"></span> Shop Locator
					</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal1">
							<span class="fa fa-truck" aria-hidden="true"></span>Track Order
					</a></li>
					<li><span class="fa fa-phone" aria-hidden="true"></span> 001
						234 5678</li>
					<c:if test="${ empty cookie.username}">
						<li><a href="#" data-toggle="modal" data-target="#myModal1">
								<span class="fa fa-unlock-alt" aria-hidden="true"></span> 登录
						</a></li>
						
						<li><a href="#" data-toggle="modal" data-target="#myModal2">
							<span class="fa fa-pencil-square-o" aria-hidden="true"></span>
							注册
					</a></li>
					
					</c:if>
					<c:if test="${not empty cookie.username }">
						<%
							//用户登录之后显示用户的简单信息和下拉框等
						%>   
						
						<div class="user">
							<a href="#" data-toggle="modal" data-target="#myModal1" class="user-head">
								<img src="images/user.png" alt="${cookie.username.value}"
								class="user-img">
							</a>  
							
							<ul class="dropdown-menu1 multi-column columns-3">
								<li><a href="javascript:void(0)" onclick="toMycart('${cookie.username.value}')">购物车</a></li>
								<li><a href="javascript:void(0)" onclick="toProfile('${cookie.username.value}')">我的资料</a></li>
								<li><a href="javascript:void(0)" onclick="toLogout()">注销</a></li>
							</ul>
							
						</div>
					</c:if>
				</ul>
					
				<!-- //header lists -->
				<!-- search -->
				<div class="agileits_search">
					<form action="#" method="post">
						<input name="Search" type="search"
							placeholder="How can we help you today?" required="">
							<button type="submit" class="btn btn-default"
								aria-label="Left Align">
								<span class="fa fa-search" aria-hidden="true"> </span>
							</button>
					</form>
				</div>
				<!-- //search -->
				<!-- cart details -->
				<div class="top_nav_right">
					<div class="wthreecartaits wthreecartaits2 cart cart box_1">
						<form action="#" method="post" class="last">
							<input type="hidden" name="cmd" value="_cart"> <input
								type="hidden" name="display" value="1">
									<button class="w3view-cart" type="submit" name="submit"
										value="">
										<i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
									</button>
						</form>
					</div>
				</div>
				<!-- //cart details -->
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- shop locator (popup) -->
	<!-- Button trigger modal(shop-locator) -->
	<div id="small-dialog1" class="mfp-hide">
		<div class="select-city">
			<h3>Please Select Your Location</h3>
			<select class="list_of_cities">
				<optgroup label="Popular Cities">
					<option selected style="display: none; color: #eee;">Select
						City</option>
					<option>Birmingham</option>
					<option>Anchorage</option>
					<option>Phoenix</option>
					<option>Little Rock</option>
					<option>Los Angeles</option>
					<option>Denver</option>
					<option>Bridgeport</option>
					<option>Wilmington</option>
					<option>Jacksonville</option>
					<option>Atlanta</option>
					<option>Honolulu</option>
					<option>Boise</option>
					<option>Chicago</option>
					<option>Indianapolis</option>
				</optgroup>
				<optgroup label="Alabama">
					<option>Birmingham</option>
					<option>Montgomery</option>
					<option>Mobile</option>
					<option>Huntsville</option>
					<option>Tuscaloosa</option>
				</optgroup>
				<optgroup label="Alaska">
					<option>Anchorage</option>
					<option>Fairbanks</option>
					<option>Juneau</option>
					<option>Sitka</option>
					<option>Ketchikan</option>
				</optgroup>
				<optgroup label="Arizona">
					<option>Phoenix</option>
					<option>Tucson</option>
					<option>Mesa</option>
					<option>Chandler</option>
					<option>Glendale</option>
				</optgroup>
				<optgroup label="Arkansas">
					<option>Little Rock</option>
					<option>Fort Smith</option>
					<option>Fayetteville</option>
					<option>Springdale</option>
					<option>Jonesboro</option>
				</optgroup>
				<optgroup label="California">
					<option>Los Angeles</option>
					<option>San Diego</option>
					<option>San Jose</option>
					<option>San Francisco</option>
					<option>Fresno</option>
				</optgroup>
				<optgroup label="Colorado">
					<option>Denver</option>
					<option>Colorado</option>
					<option>Aurora</option>
					<option>Fort Collins</option>
					<option>Lakewood</option>
				</optgroup>
				<optgroup label="Connecticut">
					<option>Bridgeport</option>
					<option>New Haven</option>
					<option>Hartford</option>
					<option>Stamford</option>
					<option>Waterbury</option>
				</optgroup>
				<optgroup label="Delaware">
					<option>Wilmington</option>
					<option>Dover</option>
					<option>Newark</option>
					<option>Bear</option>
					<option>Middletown</option>
				</optgroup>
				<optgroup label="Florida">
					<option>Jacksonville</option>
					<option>Miami</option>
					<option>Tampa</option>
					<option>St. Petersburg</option>
					<option>Orlando</option>
				</optgroup>
				<optgroup label="Georgia">
					<option>Atlanta</option>
					<option>Augusta</option>
					<option>Columbus</option>
					<option>Savannah</option>
					<option>Athens</option>
				</optgroup>
				<optgroup label="Hawaii">
					<option>Honolulu</option>
					<option>Pearl City</option>
					<option>Hilo</option>
					<option>Kailua</option>
					<option>Waipahu</option>
				</optgroup>
				<optgroup label="Idaho">
					<option>Boise</option>
					<option>Nampa</option>
					<option>Meridian</option>
					<option>Idaho Falls</option>
					<option>Pocatello</option>
				</optgroup>
				<optgroup label="Illinois">
					<option>Chicago</option>
					<option>Aurora</option>
					<option>Rockford</option>
					<option>Joliet</option>
					<option>Naperville</option>
				</optgroup>
				<optgroup label="Indiana">
					<option>Indianapolis</option>
					<option>Fort Wayne</option>
					<option>Evansville</option>
					<option>South Bend</option>
					<option>Hammond</option>
				</optgroup>
				<optgroup label="Iowa">
					<option>Des Moines</option>
					<option>Cedar Rapids</option>
					<option>Davenport</option>
					<option>Sioux City</option>
					<option>Waterloo</option>
				</optgroup>
				<optgroup label="Kansas">
					<option>Wichita</option>
					<option>Overland Park</option>
					<option>Kansas City</option>
					<option>Topeka</option>
					<option>Olathe</option>
				</optgroup>
				<optgroup label="Kentucky">
					<option>Louisville</option>
					<option>Lexington</option>
					<option>Bowling Green</option>
					<option>Owensboro</option>
					<option>Covington</option>
				</optgroup>
				<optgroup label="Louisiana">
					<option>New Orleans</option>
					<option>Baton Rouge</option>
					<option>Shreveport</option>
					<option>Metairie</option>
					<option>Lafayette</option>
				</optgroup>
				<optgroup label="Maine">
					<option>Portland</option>
					<option>Lewiston</option>
					<option>Bangor</option>
					<option>South Portland</option>
					<option>Auburn</option>
				</optgroup>
				<optgroup label="Maryland">
					<option>Baltimore</option>
					<option>Frederick</option>
					<option>Rockville</option>
					<option>Gaithersburg</option>
					<option>Bowie</option>
				</optgroup>
				<optgroup label="Massachusetts">
					<option>Boston</option>
					<option>Worcester</option>
					<option>Springfield</option>
					<option>Lowell</option>
					<option>Cambridge</option>
				</optgroup>
				<optgroup label="Michigan">
					<option>Detroit</option>
					<option>Grand Rapids</option>
					<option>Warren</option>
					<option>Sterling Heights</option>
					<option>Lansing</option>
				</optgroup>
				<optgroup label="Minnesota">
					<option>Minneapolis</option>
					<option>St. Paul</option>
					<option>Rochester</option>
					<option>Duluth</option>
					<option>Bloomington</option>
				</optgroup>
				<optgroup label="Mississippi">
					<option>Jackson</option>
					<option>Gulfport</option>
					<option>Southaven</option>
					<option>Hattiesburg</option>
					<option>Biloxi</option>
				</optgroup>
				<optgroup label="Missouri">
					<option>Kansas City</option>
					<option>St. Louis</option>
					<option>Springfield</option>
					<option>Independence</option>
					<option>Columbia</option>
				</optgroup>
				<optgroup label="Montana">
					<option>Billings</option>
					<option>Missoula</option>
					<option>Great Falls</option>
					<option>Bozeman</option>
					<option>Butte-Silver Bow</option>
				</optgroup>
				<optgroup label="Nebraska">
					<option>Omaha</option>
					<option>Lincoln</option>
					<option>Bellevue</option>
					<option>Grand Island</option>
					<option>Kearney</option>
				</optgroup>
				<optgroup label="Nevada">
					<option>Las Vegas</option>
					<option>Henderson</option>
					<option>North Las Vegas</option>
					<option>Reno</option>
					<option>Sunrise Manor</option>
				</optgroup>
				<optgroup label="New Hampshire">
					<option>Manchesters</option>
					<option>Nashua</option>
					<option>Concord</option>
					<option>Dover</option>
					<option>Rochester</option>
				</optgroup>
				<optgroup label="New Jersey">
					<option>Newark</option>
					<option>Jersey City</option>
					<option>Paterson</option>
					<option>Elizabeth</option>
					<option>Edison</option>
				</optgroup>
				<optgroup label="New Mexico">
					<option>Albuquerque</option>
					<option>Las Cruces</option>
					<option>Rio Rancho</option>
					<option>Santa Fe</option>
					<option>Roswell</option>
				</optgroup>
				<optgroup label="New York">
					<option>New York</option>
					<option>Buffalo</option>
					<option>Rochester</option>
					<option>Yonkers</option>
					<option>Syracuse</option>
				</optgroup>
				<optgroup label="North Carolina">
					<option>Charlotte</option>
					<option>Raleigh</option>
					<option>Greensboro</option>
					<option>Winston-Salem</option>
					<option>Durham</option>
				</optgroup>
				<optgroup label="North Dakota">
					<option>Fargo</option>
					<option>Bismarck</option>
					<option>Grand Forks</option>
					<option>Minot</option>
					<option>West Fargo</option>
				</optgroup>
				<optgroup label="Ohio">
					<option>Columbus</option>
					<option>Cleveland</option>
					<option>Cincinnati</option>
					<option>Toledo</option>
					<option>Akron</option>
				</optgroup>
				<optgroup label="Oklahoma">
					<option>Oklahoma City</option>
					<option>Tulsa</option>
					<option>Norman</option>
					<option>Broken Arrow</option>
					<option>Lawton</option>
				</optgroup>
				<optgroup label="Oregon">
					<option>Portland</option>
					<option>Eugene</option>
					<option>Salem</option>
					<option>Gresham</option>
					<option>Hillsboro</option>
				</optgroup>
				<optgroup label="Pennsylvania">
					<option>Philadelphia</option>
					<option>Pittsburgh</option>
					<option>Allentown</option>
					<option>Erie</option>
					<option>Reading</option>
				</optgroup>
				<optgroup label="Rhode Island">
					<option>Providence</option>
					<option>Warwick</option>
					<option>Cranston</option>
					<option>Pawtucket</option>
					<option>East Providence</option>
				</optgroup>
				<optgroup label="South Carolina">
					<option>Columbia</option>
					<option>Charleston</option>
					<option>North Charleston</option>
					<option>Mount Pleasant</option>
					<option>Rock Hill</option>
				</optgroup>
				<optgroup label="South Dakota">
					<option>Sioux Falls</option>
					<option>Rapid City</option>
					<option>Aberdeen</option>
					<option>Brookings</option>
					<option>Watertown</option>
				</optgroup>
				<optgroup label="Tennessee">
					<option>Memphis</option>
					<option>Nashville</option>
					<option>Knoxville</option>
					<option>Chattanooga</option>
					<option>Clarksville</option>
				</optgroup>
				<optgroup label="Texas">
					<option>Houston</option>
					<option>San Antonio</option>
					<option>Dallas</option>
					<option>Austin</option>
					<option>Fort Worth</option>
				</optgroup>
				<optgroup label="Utah">
					<option>Salt Lake City</option>
					<option>West Valley City</option>
					<option>Provo</option>
					<option>West Jordan</option>
					<option>Orem</option>
				</optgroup>
				<optgroup label="Vermont">
					<option>Burlington</option>
					<option>Essex</option>
					<option>South Burlington</option>
					<option>Colchester</option>
					<option>Rutland</option>
				</optgroup>
				<optgroup label="Virginia">
					<option>Virginia Beach</option>
					<option>Norfolk</option>
					<option>Chesapeake</option>
					<option>Arlington</option>
					<option>Richmond</option>
				</optgroup>
				<optgroup label="Washington">
					<option>Seattle</option>
					<option>Spokane</option>
					<option>Tacoma</option>
					<option>Vancouver</option>
					<option>Bellevue</option>
				</optgroup>
				<optgroup label="West Virginia">
					<option>Charleston</option>
					<option>Huntington</option>
					<option>Parkersburg</option>
					<option>Morgantown</option>
					<option>Wheeling</option>
				</optgroup>
				<optgroup label="Wisconsin">
					<option>Milwaukee</option>
					<option>Madison</option>
					<option>Green Bay</option>
					<option>Kenosha</option>
					<option>Racine</option>
				</optgroup>
				<optgroup label="Wyoming">
					<option>Cheyenne</option>
					<option>Casper</option>
					<option>Laramie</option>
					<option>Gillette</option>
					<option>Rock Springs</option>
				</optgroup>
			</select>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //shop locator (popup) -->
	<!-- signin Model -->
	<!-- Modal1 -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body modal-body-sub_agile">
					<div class="main-mailposi">
						<span class="fa fa-envelope-o" aria-hidden="true"></span>
					</div>
					<div class="modal_body_left modal_body_left1">
						<h3 class="agileinfo_sign">Sign In</h3>
						<p>
							现在登录，立马进行购物! 没有账号? <a href="#" data-toggle="modal"
								data-target="#myModal2"> 注册</a>
						</p>
						<form action="javascript:void(0)" method="post" id="signIn">
							<div class="styled-input agile-styled-input-top">
								<input type="text" placeholder="User Name" name="username"
									required=""> <label class="tips username-tips"></label>
							</div>
							<div class="styled-input">
								<input type="password" placeholder="Password" name="password"
									required="">
							</div>
							<input type="submit" value="登录">
						</form>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- //Modal content-->
		</div>
	</div>
	<!-- //Modal1 -->
	<!-- //signin Model -->
	<!-- signup Model -->
	<!-- Modal2 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body modal-body-sub_agile">
					<div class="main-mailposi">
						<span class="fa fa-envelope-o" aria-hidden="true"></span>
					</div>
					<div class="modal_body_left modal_body_left1">
						<h3 class="agileinfo_sign">Sign Up</h3>
						<p>Come join the Grocery Shoppy! Let's set up your Account.</p>
						<form action="signUp" method="post">
							<div class="styled-input agile-styled-input-top">
								<input type="text" placeholder="Name" name="Name" required="">
							</div>
							<div class="styled-input">
								<input type="email" placeholder="E-mail" name="Email"
									required="">
							</div>
							<div class="styled-input">
								<input type="password" placeholder="Password" name="password"
									id="password1" required="">
							</div>
							<div class="styled-input">
								<input type="password" placeholder="Confirm Password"
									name="Confirm Password" id="password2" required="">
							</div>
							<input type="submit" value="Sign Up">
						</form>
						<p>
							<a href="#">By clicking register, I agree to your terms</a>
						</p>
					</div>
				</div>
			</div>
			<!-- //Modal content-->
		</div>
	</div>
	<!-- //Modal2 -->
	<!-- //signup Model -->
	<!-- //header-bot -->
	<!-- navigation -->
	<div class="ban-top">
		<div class="container">
			<div class="agileits-navi_search">
				<form action="#" method="post">
					<select id="agileinfo-nav_search" name="agileinfo_search" required>
						<option value="">All Categories</option>
						<option value="Kitchen">Kitchen</option>
						<option value="Household">Household</option>
						<option value="Snacks &amp; Beverages">Snacks & Beverages</option>
						<option value="Personal Care">Personal Care</option>
						<option value="Gift Hampers">Gift Hampers</option>
						<option value="Fruits &amp; Vegetables">Fruits &
							Vegetables</option>
						<option value="Baby Care">Baby Care</option>
						<option value="Soft Drinks &amp; Juices">Soft Drinks &
							Juices</option>
						<option value="Frozen Food">Frozen Food</option>
						<option value="Bread &amp; Bakery">Bread & Bakery</option>
						<option value="Sweets">Sweets</option>
					</select>
				</form>
			</div>
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav menu__list">
							<li class="active"><a class="nav-stylehead"
								href="index.html">Home <span class="sr-only">(current)</span>
							</a></li>
							<li class=""><a class="nav-stylehead" href="about.html">About
									Us</a></li>
							<li class="dropdown"><a href="#"
								class="dropdown-toggle nav-stylehead" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Kitchen
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="agile_inner_drop_nav_info">
										<div class="col-sm-4 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="product.html">Bakery</a></li>
												<li><a href="product.html">Baking Supplies</a></li>
												<li><a href="product.html">Coffee, Tea & Beverages</a>
												</li>
												<li><a href="product.html">Dried Fruits, Nuts</a></li>
												<li><a href="product.html">Sweets, Chocolate</a></li>
												<li><a href="product.html">Spices & Masalas</a></li>
												<li><a href="product.html">Jams, Honey & Spreads</a></li>
											</ul>
										</div>
										<div class="col-sm-4 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="product.html">Pickles</a></li>
												<li><a href="product.html">Pasta & Noodles</a></li>
												<li><a href="product.html">Rice, Flour & Pulses</a></li>
												<li><a href="product.html">Sauces & Cooking Pastes</a>
												</li>
												<li><a href="product.html">Snack Foods</a></li>
												<li><a href="product.html">Oils, Vinegars</a></li>
												<li><a href="product.html">Meat, Poultry & Seafood</a>
												</li>
											</ul>
										</div>
										<div class="col-sm-4 multi-gd-img">
											<img src="images/nav.png" alt="">
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class="dropdown"><a href="#"
								class="dropdown-toggle nav-stylehead" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Household
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="agile_inner_drop_nav_info">
										<div class="col-sm-6 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="product2.html">Kitchen & Dining</a></li>
												<li><a href="product2.html">Detergents</a></li>
												<li><a href="product2.html">Utensil Cleaners</a></li>
												<li><a href="product2.html">Floor & Other Cleaners</a>
												</li>
												<li><a href="product2.html">Disposables, Garbage
														Bag</a></li>
												<li><a href="product2.html">Repellents & Fresheners</a>
												</li>
												<li><a href="product2.html"> Dishwash</a></li>
											</ul>
										</div>
										<div class="col-sm-6 multi-gd-img">
											<ul class="multi-column-dropdown">
												<li><a href="product2.html">Pet Care</a></li>
												<li><a href="product2.html">Cleaning Accessories</a></li>
												<li><a href="product2.html">Pooja Needs</a></li>
												<li><a href="product2.html">Crackers</a></li>
												<li><a href="product2.html">Festive Decoratives</a></li>
												<li><a href="product2.html">Plasticware</a></li>
												<li><a href="product2.html">Home Care</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul></li>
							<li class=""><a class="nav-stylehead" href="faqs.html">Faqs</a>
							</li>
							<li class="dropdown"><a
								class="nav-stylehead dropdown-toggle" href="#"
								data-toggle="dropdown">Pages <b class="caret"></b>
							</a>
								<ul class="dropdown-menu agile_short_dropdown">
									<li><a href="icons.html">Web Icons</a></li>
									<li><a href="typography.html">Typography</a></li>
								</ul></li>
							<li class=""><a class="nav-stylehead" href="contact.html">Contact</a>
							</li>
						</ul>
					</div>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- banner -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators-->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
			<li data-target="#myCarousel" data-slide-to="2" class=""></li>
			<li data-target="#myCarousel" data-slide-to="3" class=""></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="container">
					<div class="carousel-caption">
						<h3>
							Big <span>Save</span>
						</h3>
						<p>
							Get flat <span>10%</span> Cashback
						</p>
						<a class="button2" href="product.html">Shop Now </a>
					</div>
				</div>
			</div>
			<div class="item item2">
				<div class="container">
					<div class="carousel-caption">
						<h3>
							Healthy <span>Saving</span>
						</h3>
						<p>
							Get Upto <span>30%</span> Off
						</p>
						<a class="button2" href="product.html">Shop Now </a>
					</div>
				</div>
			</div>
			<div class="item item3">
				<div class="container">
					<div class="carousel-caption">
						<h3>
							Big <span>Deal</span>
						</h3>
						<p>
							Get Best Offer Upto <span>20%</span>
						</p>
						<a class="button2" href="product.html">Shop Now </a>
					</div>
				</div>
			</div>
			<div class="item item4">
				<div class="container">
					<div class="carousel-caption">
						<h3>
							Today <span>Discount</span>
						</h3>
						<p>
							Get Now <span>40%</span> Discount
						</p>
						<a class="button2" href="product.html">Shop Now </a>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- //banner -->

	<!-- top Products -->
	<div class="ads-grid">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">
				Our Top Products <span class="heading-style"> <i></i> <i></i>
					<i></i>
				</span>
			</h3>
			<!-- //tittle heading -->
			<!-- product left -->
			<div class="side-bar col-md-3">
				<div class="search-hotel">
					<h3 class="agileits-sear-head">Search Here..</h3>
					<form action="#" method="post">
						<input type="search" placeholder="商品名称进行查找..." name="search"
							required=""> <input type="submit" value=" ">
					</form>
				</div>
				<!-- price range -->
				<div class="range">
					<h3 class="agileits-sear-head">价钱范围</h3>
					<ul class="dropdown-menu6">
						<li>
							<div id="slider-range"></div> <input type="text" id="amount"
							style="border: 0; color: #ffffff; font-weight: normal;" />
						</li>
					</ul>
				</div>
				<!-- //food preference -->
				<!-- discounts -->
				<div class="left-side">
					<h3 class="agileits-sear-head">Discount</h3>
					<ul>
						<li><input type="checkbox" class="checked"> <span
								class="span">5% or More</span></li>
						<li><input type="checkbox" class="checked"> <span
								class="span">10% or More</span></li>
						<li><input type="checkbox" class="checked"> <span
								class="span">20% or More</span></li>
						<li><input type="checkbox" class="checked"> <span
								class="span">30% or More</span></li>
						<li><input type="checkbox" class="checked"> <span
								class="span">50% or More</span></li>
						<li><input type="checkbox" class="checked"> <span
								class="span">60% or More</span></li>
					</ul>
				</div>
				<div class="left-side">
					<h3 class="agileits-sear-head">商品分类</h3>
					<ul>
						<s:iterator value="topicList">
							<li><input type="checkbox" class="checked"> <span
									class="span"><s:property value="topicName" /></span></li>
						</s:iterator>


					</ul>
				</div>
				<!-- //cuisine -->
				<!-- deals -->
				<div class="deal-leftmk left-side">
					<h3 class="agileits-sear-head">特别推荐</h3>
					<s:iterator value="recommendList">
						<div class="special-sec1">
							<div class="col-xs-4 img-deals">
								<img src="images/item/<s:property value="imagePath"/>" alt=""
									class="spe-img">
							</div>
							<div class="col-xs-8 img-deal1">
								<h3>
									<s:property value="itemName" />
								</h3>
								<a href="single.html"><s:property value="parsentPrice" /></a>
							</div>
							<div class="clearfix"></div>
						</div>
					</s:iterator>
				</div>
				<!-- //deals -->
			</div>
			<!-- //product left -->
			<!-- product right -->
			<div class="agileinfo-ads-display col-md-9">
				<div class="wrapper">

					<s:iterator value="topicList">
						<div class="product-sec1">
							<h3 class="heading-tittle">
								<s:property value="topicName" />
							</h3>
							<%--最多只显示三个商品 --%>
							<s:iterator value="items" status="state" begin="0" step="1"
								end="2">
								<div class="col-md-4 product-men">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item">
											<img src="images/item/${imagePath}" alt="${itemName}"
												style="height: 150px; width: 166px;">
												<div class="men-cart-pro">
													<div class="inner-men-cart-pro">
														<a href="single.html" class="link-product-add-cart">Quick
															View</a>
													</div>
												</div> <span class="product-new-top">New</span>
										</div>
										<div class="item-info-product ">
											<h4>
												<a href="single.html"><s:property value="itemName" /></a>
											</h4>
											<div class="info-product-price">
												<span class="item_price">￥<s:property
														value="parsentPrice" /></span>
												<del>
													<s:property value="originalPrice" />
												</del>
											</div>
											<div
												class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
												<form action="javascript:void(0)"  method="post" class="cart">
													<fieldset>
														<input type="hidden" name="itemId" 
														value="<s:property value='itemId'/>" /> 
														<input type="hidden" name="originalPrice" 
														value="<s:property value="originalPrice"/>" /> 
														<input type="hidden" name="itemName"
															value="<s:property value='itemName'/>" /> 
														<input type="hidden" name="parsentPrice"
															value="<s:property value='parsentPrice'/>"/>
														<input type="submit" name="submit" value="添加到购物车"
															class="button" />
													</fieldset>
												</form>
											</div>
										</div>
									</div>
								</div>

							</s:iterator>
							<div class="clearfix"></div>
						</div>
					</s:iterator>

				</div>
			</div>
			<!-- //top products -->
			<!-- special offers -->
			<div class="featured-section" id="projects">
				<div class="container"></div>
			</div>

		</div>

	</div>


	<div class="copy-right">
		<div class="container">
			<p>
				Copyright &copy; 2018.Company name All rights reserved.More
				Templates <a href="http://www.tblack.cn" target="_blank"
					title="TD开发">TD在线商城</a> - Collect from <a
					href="http://www.tblack.cn" title="访问我的网站" target="_blank">更多项目</a>
			</p>
		</div>
	</div>

	<!-- popup modal (for signin & signup)-->
	<script src="js/jquery.magnific-popup.js"></script>
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
		/* paypalm.minicartk.render(); //use only unique class names other than paypalm.minicartk.Also Replace same class name in css and minicart.min.js
		
		paypalm.minicartk.cart
				.on(
						'checkout',
						function(evt) {
							var items = this.items(), len = items.length, total = 0, i;

							// Count the number of each item in the cart
							for (i = 0; i < len; i++) {
								total += items[i].get('quantity');
							}

							if (total < 3) {
								alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
								evt.preventDefault();
							}
						}); */
	</script>
	<!-- //cart-js -->
	<div id="PPminicartk">
		<form method="post" class="" action="#" target="">
		
			<button type="button" class="minicartk-closer">×</button>
			
   			<s:if test="#cartList != null && #cartList.size() > 0">
					<ul>
					<s:set var="subTotal"  value="0" scope="request"></s:set>
					<s:iterator value="cartList" var="miniCart">
						<li class="minicartk-item">
						<div class="minicartk-details-name">
							<a class="minicartk-name" href="home">${miniCart.item.itemName }</a>
							<ul class="minicartk-attributes">
								<li>优惠:￥<span class="discount-amount">${(miniCart.item.originalPrice - miniCart.item.parsentPrice) * miniCart.cart.amount}</span><input type="hidden" name="discount_amount_1"
									value="${miniCart.cart.amount}"></li>
							</ul>  
						</div>
						<div class="minicartk-details-quantity">
							<input class="minicartk-quantity" data-minicartk-idx="0"
								name="quantity_1" type="text" pattern="[0-9]*" value="${miniCart.cart.amount }"
								autocomplete="off">
						</div>
						<div class="minicartk-details-remove">
							<button type="button" class="minicartk-remove"
								data-minicartk-idx="0">×</button>
						</div>
						<div class="minicartk-details-price">
							<span class="minicartk-price">${miniCart.cart.total }</span>
						</div>
						<input type='hidden' name='itemId' value='${miniCart.cart.itemId}'>
						<input type='hidden' name='amount' value='${miniCart.cart.amount }'>
						<input type='hidden' name='parsentPrice' value='${miniCart.item.parsentPrice }'>
						<input type='hidden' name='originalPrice' value='${miniCart.item.originalPrice }'>
						<input type='hidden' name='username' value='${cookie.username.value }'>
						<input type='hidden' name='total' value='${miniCart.cart.total }'>
					</li>
					</s:iterator>
					</ul>
			</s:if>
			<div class="minicartk-footer">
				<s:if test="#cartList != null && #cartList.size() > 0">
					<div class="minicartk-subtotal">总计:  ￥<span id="total-price">${cartList.stream().map(miniCart -> miniCart.cart.total).sum()}</span></div>
					<button class="minicartk-submit" type="submit"
						data-minicartk-alt="undefined">
						立即结算 <img
							src="//cdnjs.cloudflare.com/ajax/libs/minicart/3.0.1/paypal_65x18.png"
							width="65" height="18" alt="paypalm">
					</button>
				</s:if>
				<s:else>
					<p class="minicartk-empty-text">你的购物车为空</p>
				</s:else>
			</div>
		</form>
	</div>
	<!-- price range (top products) -->
	<script src="js/jquery-ui.js"></script>
	<script>
		//<![CDATA[ 
		$(window).load(
				function() {
					$("#slider-range").slider(
							{
								range : true,
								min : 0,
								max : 9000,
								values : [ 50, 6000 ],
								slide : function(event, ui) {
									$("#amount").val(
											"$" + ui.values[0] + " - $"
													+ ui.values[1]);
								}
							});
					$("#amount").val(
							"$" + $("#slider-range").slider("values", 0)
									+ " - $"
									+ $("#slider-range").slider("values", 1));

				}); //]]>
	</script>
	<!-- //price range (top products) -->

	<!-- flexisel (for special offers) -->
	<script src="js/jquery.flexisel.js"></script>
	<script>
		$(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems : 3,
				animationSpeed : 1000,
				autoPlay : true,
				autoPlaySpeed : 3000,
				pauseOnHover : true,
				enableResponsiveBreakpoints : true,
				responsiveBreakpoints : {
					portrait : {
						changePoint : 480,
						visibleItems : 1
					},
					landscape : {
						changePoint : 640,
						visibleItems : 2
					},
					tablet : {
						changePoint : 768,
						visibleItems : 2
					}
				}
			});

		});
	</script>
	<!-- //flexisel (for special offers) -->

	<!-- password-script -->
	<script>
		window.onload = function() {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;	
			
			$(".minicartk-quantity").change(function(){
				itemChanged(this);
			});
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity(
						"Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- //password-script -->

	<!-- smoothscroll -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>

	<script src="js/bootstrap.js"></script>
	<script src="js/jquery-cookie.js"></script>


	<script>
		function isLogin() {

			if ($.cookie("username"))
				return true;

			console.log("没有存在 cookie对象");
			return false;
		}
		
		
		function getUsername(){
			
			return $.cookie("username");
		}
	</script>

	<script>
		$("#signIn").submit(function() {

			//		console.log("表单提交了");
			var formData = new FormData(this);

			$.ajax({
				url : "signIn",
				method : "post",
				processData : false,
				contentType : false,
				data : formData,
				success : function(data) {
					console.log("接收到返回值是:" + data);

					//登录失败
					if (data == "FAILED") {
						$(".username-tips").text("账号或密码错误");
					} else if (data == "SUCCESS") {
						//重新加载页面
						window.location.reload();
					}
				}
			});

		});
		
		$(".user").mouseover(function(){
			$(".dropdown-menu1").css("display","block");		
		});
		$(".user").mouseout(function(){
			
			$(".dropdown-menu1").css("display","none");
			
		});
		$(".dropdown-menu1").mouseover(function(){
			$(".dropdown-menu1").css("display","block");		
		});
		$(".dropdown-menu1").mouseover(function(){
			$(".dropdown-menu1").css("display","none");	
		});
		
		function toLogout(){
			$.ajax({
				url :  "logout",
				method: "post",
				success: function(data){
					
					console.log("收到的回报： " + data);
					
					if(data == "success"){
						window.location.reload();
					}
				}			
			});
		}
	</script>
</body>
</html>