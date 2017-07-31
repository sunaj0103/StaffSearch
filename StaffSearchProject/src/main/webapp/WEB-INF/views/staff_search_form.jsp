<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/web/js_css/jquery-3.1.1.min.js"></script>
<title>사원 정보 검색</title>
<style>
.staffDiv {
	width: 1000px;
	margin: 30px auto;
	padding-top: 5px;
}

.staffInfo, .staffInfo th, .staffInfo td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}

#staffSearch tr:nth-child(odd) {
	background: #ddd;
}

#staffSearch tr:hover {
	background: #ffff80;
	cursor: pointer;
}

.searchResultZero:hover {
	background: #fff;
	cursor: auto;
}

.staffInfo {
	border-collapse: collapse;
	width: 100%;
}
.title {
	background-color: steelblue;
	color: #fff;
}
.btnLong {
	width: 300px;
	height: 30px;
	padding: 3px;
	margin: 10px 200px;
	text-decoration: none;
}
.btn {
	width: 80px;
	height: 30px;
	padding: 3px;
	margin: 10px 1px;
}
.btnUpdel {
	width: 80px;
	height: 25px;
	line-height: 25px;
	padding: 1px 8px;
	background-color: #ddd;
}
.btnLong:hover, .btn:hover, .btnUpdel:hover { 
	font-weight: bold;
	color: steelblue;
}
.countDiv {
	text-align: right;
	margin: 10px 10px;
}
.page {
	text-align: center;
	margin: 10px 10px;
}
.page a:link { 
	color: #000;
	text-decoration: none;
}
.page a:visited {
	color: #000;
	text-decoration: none;
}
.page a:hover { 
	color: #fff;
	background-color: steelblue;
	text-decoration: none;
}
</style>
<script>
var ok = "${ok}";

if(ok == "input"){
	alert("사원 정보가 등록되었습니다.");
}

$(function(){
	$("#searchBtn").click(function(){
		var check = true;
		check = graduateDayCheck();
		if(check) $("#erpSearchFrm").submit();
	});
	
	$("#allSearchBtn").click(function(){
		location.href="/web/searchAll";
	});
	
	$("#resetBtn").click(function(){
		location.href="/web";
	});
	
	$("#inputBtn").click(function(){
		window.open("/web/staffInput","staffInput","height=400,width=1100,scrollbars=1,resizable=1,left=150,top=50");
	});
	
	$("#nameTh").click(function(){
		if("${sortColumn}"=="staff_name"){
			if("${sort}"=="ASC"){
				$("#nameSort").html("&#9661;");
				searchPage(1,"staff_name","DESC");
			}else{
				$("#nameSort").html("&#9651;");
				searchPage(1,"staff_name","ASC");
			}
		}else{
			$("#nameSort").html("&#9651;");
			searchPage(1,"staff_name","ASC");
		}
		/* location.href="/web/search?sortColumn=staff_name&sort=ASC"; */
	});
	
	$("#genderTh").click(function(){
		if("${sortColumn}"=="jumin_no"){
			if("${sort}"=="ASC"){
				$("#genderSort").html("&#9651;");
				searchPage(1,"jumin_no","DESC");
			}else{
				$("#genderSort").html("&#9661;");
				searchPage(1,"jumin_no","ASC");
			}
		}else{
			$("#genderSort").html("&#9651;");
			searchPage(1,"jumin_no","ASC");
		}
	});
	
	$("#religionTh").click(function(){
		if("${sortColumn}"=="religion_name"){
			if("${sort}"=="ASC"){
				$("#religionSort").html("&#9651;");
				searchPage(1,"religion_name","DESC");
			}else{
				$("#religionSort").html("&#9661;");
				searchPage(1,"religion_name","ASC");
			}
		}else{
			$("#religionSort").html("&#9651;");
			searchPage(1,"religion_name","ASC");
		}
	});
	
});

function searchPage(currentPage,sortColumn,sort){
	var check = true;
	check = graduateDayCheck();
	if(check){
		$("#currentPagehidden").html("<input type=\'hidden\' name=\'currentPage\' value=\'"+currentPage+"\'/>");
		$("#currentPagehidden").append("<input type=\'hidden\' name=\'sortColumn\' value=\'"+sortColumn+"\'/>");
		$("#currentPagehidden").append("<input type=\'hidden\' name=\'sort\' value=\'"+sort+"\'/>");
		$("#erpSearchFrm").submit();
	}
}

function graduateDayCheck(){
	var year = $("#graduateStartYear").val(); 
	var month = $("#graduateStartMonth").val();
	var day = $("#graduateStartDay").val();
	var endYear = $("#graduateEndYear").val();
	var endMonth = $("#graduateEndMonth").val();
	var endDay = $("#graduateEndDay").val();
	
	if(year == null) {
		year = "";
    }
	if(month == null) {
		month = "";
    }
	if(day == null) {
		day = "";
    }
	if(endYear == null) {
		endYear = "";
    }
	if(endMonth == null) {
		endMonth = "";
    }
	if(endDay == null) {
		endDay = "";
    }
	
	if(year || year != "" || month || month != "" || day || day != "" || endYear || endYear != "" || endMonth || endMonth != "" || endDay || endDay != ""){
		if(!year) {
	        alert("졸업일 검색 시작 연도를 선택해 주세요.");
	        return false;
	    }
		if(!month) {
	        alert("졸업일 검색 시작 달을 선택해 주세요.");
	        return false;
	    }
		if(!day) {
	        alert("졸업일 검색 시작 일을 선택해 주세요.");
	        return false;
	    }
		
		if(endYear || endYear != "" || endMonth || endMonth != "" || endDay || endDay != ""){
			if(!endYear) {
				alert("졸업일 검색 종료 연도를 선택해 주세요.");
				return false;
			}
			if(!endMonth) {
				alert("졸업일 검색 종료 달을 선택해 주세요.");
				return false;
			}
			if(!endDay) {
				alert("졸업일 검색 종료 일을 선택해 주세요.");
				return false;
			}
			
			
			var getDate = year+month+day;
			var startDate = endYear+endMonth+endDay;
			if(eval(getDate) > eval(startDate)) {
				alert("졸업일 검색 시작일이 종료일보다 큽니다.");
				return false;
			}
		}
	}
	
	return true;
}

</script>
</head>
<body>
<div class="staffDiv">
	<form id="erpSearchFrm" name="erpSearchFrm" method="post" action="/web/search">
		<table class="staffInfo">
			<tr>
				<td colspan="6" class="title">사원 정보 검색</td>
			</tr>
			<tr>
				<td class="title">키워드</td>
				<td><input type="text" name="staff_name" id="staff_name" <c:if test="${search eq 'ok'}">value="${dto.staff_name}"</c:if>/></td>
				<td class="title">성별</td>
				<td>
					<input type="checkbox" id="genderM" name="jumin_no" value="1" <c:if test="${dto.jumin_no[0]==1 || dto.jumin_no[1]==1}">checked</c:if>/>
					<label for="other">남</label>
					<input type="checkbox" id="genderF" name="jumin_no" value="2" <c:if test="${dto.jumin_no[0]==2 || dto.jumin_no[1]==2}">checked</c:if>/>
					<label for="other">여</label>
          		</td>
				<td class="title">종교</td>
				<td>
					<select name="religion_code">
						<option value="0">--</option>
						<c:forEach var="religionList" items="${religionList}">
							<option value="${religionList.religion_code}" <c:if test="${dto.religion_code==religionList.religion_code}">selected</c:if>>${religionList.religion_name}</option>
					  	</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="title">학력</td>
				<td>
					<c:forEach var="schoolList" items="${schoolList}">
						<input type="checkbox" name="school_code" value="${schoolList.school_code}"/>
						<label for="school_code">${schoolList.school_name}</label>
					</c:forEach>
				</td>
				<td class="title">기술</td>
				<td colspan="3">
					<c:forEach var="skillList" items="${skillList}">
						<input type="checkbox" name="skill_code" value="${skillList.skill_code}"/>
						<label for="skill_code">${skillList.skill_name}&nbsp;</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		</td>
			</tr>
			<tr>
				<td class="title">졸업일</td>
				<td colspan="6">
					<select id="graduateStartYear" name="graduateStartYear" onChange="setStartMonth()">
						<option value="">----</option>
					</select>년
					<select id="graduateStartMonth" name="graduateStartMonth">
						<option value="">--</option>
					</select>월
					<select id="graduateStartDay" name="graduateStartDay">
						<option value="">--</option>
					</select>일 ~ 
					<select id="graduateEndYear" name="graduateEndYear">
						<option value="">----</option>
					</select>년
					<select id="graduateEndMonth" name="graduateEndMonth">
						<option value="">--</option>
					</select>월
					<select id="graduateEndDay" name="graduateEndDay">
						<option value="">--</option>
					</select>일
          		</td>
			</tr>
		</table>
		<div>
			<input type="button" id="searchBtn" value="검색" class="btnLong"/>
			<input type="button" id="allSearchBtn" value="전부검색" class="btn"/>
			<input type="button" id="resetBtn" value="초기화" class="btn"/>
			<input type="button" id="inputBtn" value="등록" class="btn"/>
		</div>
		<div id="currentPagehidden"></div>
	</form>
</div>

<div class="staffDiv">
	<c:if test="${searchAll eq 'ok' || search eq 'ok'}">
		<div class="countDiv">검색건수--> ${count}건</div>		
		<div>	
			<table id="staffSearch" class="staffInfo">
				<tr>
					<th class="title">번호</th>
					<th id="nameTh" class="title">이름 
						<span id="nameSort">
							<c:if test="${sortColumn eq 'staff_name' && sort eq 'ASC'}"> &#9651;</c:if>
							<c:if test="${sortColumn eq 'staff_name' && sort eq 'DESC'}"> &#9661;</c:if>
						</span>
					</th>
					<th id="genderTh" class="title">성별 
						<span id="genderSort">
							<c:if test="${sortColumn eq 'jumin_no' && sort eq 'ASC'}"> &#9651;</c:if>
							<c:if test="${sortColumn eq 'jumin_no' && sort eq 'DESC'}"> &#9661;</c:if>
						</span>
					</th>
					<th id="religionTh" class="title">종교 
						<span id="religionSort">
							<c:if test="${sortColumn eq 'religion_name' && sort eq 'ASC'}"> &#9651;</c:if>
							<c:if test="${sortColumn eq 'religion_name' && sort eq 'DESC'}"> &#9661;</c:if>
						</span>
					</th>
					<th class="title">기술</th>
					<th class="title">졸업일</th>
				</tr>
				
				<c:set var="number" value="${(page.onePageCount*page.currentPage)-(page.onePageCount-1)}"/>
				<c:if test="${count == 0}">
					<tr>
						<td class="searchResultZero" colspan="6">검색 조건에 맞는 데이터가 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="list" items="${list}">
					<tr onclick="window.open('/web/staffUpdel?num=${list.staff_no}','staffUpdel','height=400,width=1100,scrollbars=1,resizable=1,left=150,top=50')">
						<td>
							${number}
							<c:set var="number" value="${number+1}"/>
						</td>
						<td>${list.staff_name}</td>
						<td>
							<%-- <c:set var="juminLastNum" value="${list.jumin_no}"/>
							<c:set var="gender" value="${fn:substring(juminLastNum,7,8)}"/> --%>
							<c:if test="${list.jumin_no eq '1'}">남</c:if>
							<c:if test="${list.jumin_no eq '2'}">여</c:if>
						</td>
						<td>
							${list.religion_name}
							<%-- <c:forEach var="religionList" items="${religionList}">
								<c:if test="${list.religion_code==religionList.religion_code}">
									${religionList.religion_name}
								</c:if>
							</c:forEach> --%>
						</td>
						<td>
							<c:set var="skill_code" value="${list.skill_code}"/>
							<c:set var="skillCode" value="${fn:split(skill_code, ',')}"/>
							<c:forEach var="skillCode" items="${skillCode}" varStatus="status">
								<c:forEach var="skillList" items="${skillList}">
									<c:if test="${skillCode==skillList.skill_code}">
										${skillList.skill_name}
										<c:if test="${!status.last}">
										, 
										</c:if>
									</c:if>
								</c:forEach>
							</c:forEach>

							<%-- <c:set var="skillCode1" value="${list.skill_code}"/>
							<c:set var="skillCode2" value="${fn:replace(skillCode1,'1','Java')}" />
							<c:set var="skillCode3" value="${fn:replace(skillCode2,'2','JSP')}" />
							<c:set var="skillCode4" value="${fn:replace(skillCode3,'3','ASP')}" />
							<c:set var="skillCode5" value="${fn:replace(skillCode4,'4','PHP')}" />
							<c:set var="skillCode6" value="${fn:replace(skillCode5,'5','Delphi')}" />
							${skillCode6} --%>
						</td>
						<td>${list.graduate_day}</td>
					</tr>
				</c:forEach>
			</table>
		
			<div class="page">
				<c:if test="${page.currentPage>1}">
					<c:choose>
						<c:when test="${search eq 'ok'}">
							<a href="javascript:searchPage(1,'${sortColumn}','${sort}')">First</a>
						</c:when>
						<c:otherwise>
							<a href="/web/searchAll?currentPage=1">First</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search eq 'ok'}">
							<a href="javascript:searchPage(${page.currentPage-1},'${sortColumn}','${sort}')">&#60;</a>
						</c:when>
						<c:otherwise>
							<a href="/web/searchAll?currentPage=${page.currentPage-1}">&#60;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:forEach var="p" begin="${page.startPageNum}" end="${page.startPageNum+page.onePageCount-1}">
					<c:if test="${p<=page.totalPageCount}">
						<c:if test="${page.currentPage==p}">
							<c:choose>
								<c:when test="${search eq 'ok'}">
									<c:if test="${count != 0}">
										<a href="javascript:searchPage(${p},'${sortColumn}','${sort}')">[${p}]</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<a href="/web/searchAll?currentPage=${p}">[${p}]</a>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${page.currentPage!=p}">
							<c:choose>
								<c:when test="${search eq 'ok'}">
									<c:if test="${count != 0}">
										<a href="javascript:searchPage(${p},'${sortColumn}','${sort}')">${p}</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<a href="/web/searchAll?currentPage=${p}">${p}</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${page.currentPage!=page.totalPageCount}">
					<c:choose>
						<c:when test="${search eq 'ok'}">
							<c:if test="${count != 0}">
								<a href="javascript:searchPage(${page.currentPage+1},'${sortColumn}','${sort}')">&#62;</a>
							</c:if>
						</c:when>
						<c:otherwise>
							<a href="/web/searchAll?currentPage=${page.currentPage+1}">&#62;</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search eq 'ok'}">
							<c:if test="${count != 0}">
								<a href="javascript:searchPage(${page.totalPageCount},'${sortColumn}','${sort}')">Last</a>
							</c:if>
						</c:when>
						<c:otherwise>
							<a href="/web/searchAll?currentPage=${page.totalPageCount}">Last</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</c:if>
</div>

<script>
var schoolCodeList = new Array(); 
<c:forEach items="${dto.school_code}" var="schoolCode">
	schoolCodeList.push("${schoolCode}");
</c:forEach>
if(schoolCodeList.length>0){
	for(var i=0; i<schoolCodeList.length; i++) {	
		$("input:checkbox[name=school_code][value="+schoolCodeList[i]+"]").prop('checked', true);
	}
}
var skillCode = "${dto.skill_code}";
if(skillCode.replace(/\s/g,"") != ""){
	skillCode = skillCode.slice(1,-1);
	var skillCodeList = skillCode.split(",");
	for(var i=0; i<skillCodeList.length; i++) {	
		$("input:checkbox[name=skill_code][value="+skillCodeList[i]+"]").prop('checked', true);
	}
}

$(document).ready(function() {
	var nowDate = new Date();
    var nowYear = nowDate.getFullYear();
    var nowMonth = eval(nowDate.getMonth()) +1;
    var nowDay = eval(nowDate.getDate());
    
    var startYear = nowYear - 60;
    for(var i=nowYear; i>startYear; i--) {
    	$("#graduateStartYear").append("<option value='"+i+"'>"+i+"</option>");
    }
    
    for(var i=1; i<=12; i++){
    	if(i<10){
			$("#graduateStartMonth").append("<option value='0"+i+"'>0"+i+"</option>");
		}else{
			$("#graduateStartMonth").append("<option value='"+i+"'>"+i+"</option>");
		}
    }
    
    for(var i=1; i<=31; i++){
    	if(i<10){
			$("#graduateStartDay").append("<option value='0"+i+"'>0"+i+"</option>");
		}else{
			$("#graduateStartDay").append("<option value='"+i+"'>"+i+"</option>");
		}
    }
    
    for(var i=nowYear; i>startYear; i--) {
    	$("#graduateEndYear").append("<option value='"+i+"'>"+i+"</option>");
    }
    
    for(var i=1; i<=12; i++){
    	if(i<10){
			$("#graduateEndMonth").append("<option value='0"+i+"'>0"+i+"</option>");
		}else{
			$("#graduateEndMonth").append("<option value='"+i+"'>"+i+"</option>");
		}
    }
    
    for(var i=1; i<=31; i++){
    	if(i<10){
			$("#graduateEndDay").append("<option value='0"+i+"'>0"+i+"</option>");
		}else{
			$("#graduateEndDay").append("<option value='"+i+"'>"+i+"</option>");
		}
    }

    var search = "${search}";
	if(search == 'ok'){
		var graduateStartYear = "${dto.graduateStartYear}";
		var graduateStartMonth = "${dto.graduateStartMonth}";
		var graduateStartDay = "${dto.graduateStartDay}";
		var graduateEndYear = "${dto.graduateEndYear}";
		var graduateEndMonth = "${dto.graduateEndMonth}";
		var graduateEndDay = "${dto.graduateEndDay}";
		
		if(graduateStartYear != '' || graduateStartYear != null || graduateStartYear != '----'){
	    	$("#graduateStartYear").val(graduateStartYear);
	    }
		if(graduateStartMonth != '' || graduateStartMonth != null || graduateStartMonth != '--'){
	    	$("#graduateStartMonth").val(graduateStartMonth);
	    }
		if(graduateStartDay != '' || graduateStartDay != null || graduateStartDay != '--'){
			setStartDay();
	    	$("#graduateStartDay").val(graduateStartDay);
	    }
		if(graduateEndYear != '' || graduateEndYear != null || graduateEndYear != '----'){
			setEndYear();
	    	$("#graduateEndYear").val(graduateEndYear);
	    }
		if(graduateEndMonth != '' || graduateEndMonth != null || graduateEndMonth != '--'){
			setEndMonth();
	    	$("#graduateEndMonth").val(graduateEndMonth);
	    }
		if(graduateEndDay != '' || graduateEndDay != null || graduateEndDay != '--'){
			setEndDay();
	    	$("#graduateEndDay").val(graduateEndDay);
	    }
    }
	
	$("#graduateStartYear").change(function(){
		setEndYear();
	});
	
	$("#graduateStartMonth").change(function(){ 
		var year = $("#graduateStartYear").val();
		if(year == '' || year == null || year == '----'){
	    	alert("연도를 먼저 선택해 주세요.");
	    	$("#graduateStartMonth").val("");
	    	$("#graduateStartDay").val("");
		}else{
			 setStartDay();
		}
	});
	
	$("#graduateStartDay").change(function(){ 
		var year = $("#graduateStartYear").val();
		var month = $("#graduateStartMonth").val();
		if(year == '' || year == null || year == '----'){
	    	alert("연도를 먼저 선택해 주세요.");
	    	$("#graduateStartMonth").val("");
	    	$("#graduateStartDay").val("");
	    }else if(month == '' || month == null || month == '--'){
	    	alert("달을 먼저 선택해 주세요.");
	    	$("#graduateStartDay").val("");
	    }
	});
	
	$("#graduateEndYear").change(function(){ 
		var year = $("#graduateStartYear").val();
		var month = $("#graduateStartMonth").val();
		var day = $("#graduateStartDay").val();
		
		if(year == '' || year == null || year == '----'){
	    	alert("시작 연도를 먼저 선택해 주세요.");
	    	$("#graduateEndYear").val("");
		}else if(month == '' || month == null || month == '--'){
			alert("시작 달을 먼저 선택해 주세요.");
	    	$("#graduateEndYear").val("");
		}else if(day == '' || day == null || day == '--'){
			alert("시작 일을 먼저 선택해 주세요.");
	    	$("#graduateEndYear").val("");
		}else{
			 setEndMonth();
		}
	});
	
	$("#graduateEndMonth").change(function(){ 
		var year = $("#graduateEndYear").val();
		if(year == '' || year == null || year == '----'){
	    	alert("연도를 먼저 선택해 주세요.");
	    	$("#graduateEndMonth").val("");
	    	$("#graduateEndDay").val("");
		}else{
			 setEndDay();
		}
	});
	
	$("#graduateEndDay").change(function(){ 
		var year = $("#graduateEndYear").val();
		var month = $("#graduateEndMonth").val();
		if(year == '' || year == null || year == '----'){
	    	alert("연도를 먼저 선택해 주세요.");
	    	$("#graduateEndMonth").val("");
	    	$("#graduateEndDay").val("");
	    }else if(month == '' || month == null || month == '--'){
	    	alert("달을 먼저 선택해 주세요.");
	    	$("#graduateEndDay").val("");
	    }
	});
});

function setStartMonth() {
	var nowDate = new Date();
    var nowYear = nowDate.getFullYear();
    var nowMonth = eval(nowDate.getMonth()) +1;
    var nowDay = eval(nowDate.getDate());
    
	var year = $("#graduateStartYear").val();  
	var month = $("#graduateStartMonth").val();
	
	/* 기존 월 select를 모두 삭제한다. */
    $("#graduateStartMonth").find("option").remove();
    $("#graduateStartMonth").append("<option value=''>--</option>");
	
    if(year == nowYear){
    	for(var i=1; i<=nowMonth; i++){
	    	if(i<10){
    			$("#graduateStartMonth").append("<option value='0"+i+"'>0"+i+"</option>");
    		}else{
    			$("#graduateStartMonth").append("<option value='"+i+"'>"+i+"</option>");
    		}
	    }
    	/* 기존에 선택된 월값 유지(기존 값보다 현재 최대값이 작을 경우) */
        if(month != null || month != ""){
        	if(parseInt(month) <= nowMonth+1){
        		$("#graduateStartMonth").val(month);
        	}
        }
    }else{
    	for(var i=1; i<=12; i++){
        	if(i<10){
    			$("#graduateStartMonth").append("<option value='0"+i+"'>0"+i+"</option>");
    		}else{
    			$("#graduateStartMonth").append("<option value='"+i+"'>"+i+"</option>");
    		}
        }
    	if(month != null || month != ""){
        	$("#graduateStartMonth").val(month);
        }
    }
    
    setStartDay();
}

function setStartDay() {
    var year = $("#graduateStartYear").val();
    var month = $("#graduateStartMonth").val();
    var day = $("#graduateStartDay").val();   
    
    var arrayMonth = [31,28,31,30,31,30,31,31,30,31,30,31];

    /* 윤달 체크 */
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        arrayMonth[1] = 29;
    }

    /* 기존 일(day) select를 모두 삭제한다. */
    $("#graduateStartDay").find("option").remove();
    $("#graduateStartDay").append("<option value=''>--</option>");
        
    /* 일(day) select 옵션 생성 */
    for(var i=1; i<=arrayMonth[month-1]; i++){
    	if(i<10){
			$("#graduateStartDay").append("<option value='0"+i+"'>0"+i+"</option>");
		}else{
			$("#graduateStartDay").append("<option value='"+i+"'>"+i+"</option>");
		}
    }
    
    /* 기존에 선택된 일값 유지(기존 값보다 현재 최대값이 작을 경우) */
    if(day != null || day != ""){
    	if(parseInt(day) <= arrayMonth[month-1]){
    		$("#graduateStartDay").val(day);
    	}
    }

}

function setEndYear() {
	var nowDate = new Date();
    var nowYear = nowDate.getFullYear();
	var year = $("#graduateStartYear").val();  
	
	/* 기존 select를 모두 삭제한다. */
    $("#graduateEndYear").find("option").remove();
    $("#graduateEndYear").append("<option value=''>----</option>");
    
    for(var i=nowYear; i>=year; i--) {
    	$("#graduateEndYear").append("<option value='"+i+"'>"+i+"</option>");
    }
}

function setEndMonth() {
	var nowDate = new Date();
    var nowYear = nowDate.getFullYear();
    var nowMonth = eval(nowDate.getMonth()) +1;
    var nowDay = eval(nowDate.getDate());
    
    var startYear = $("#graduateStartYear").val(); 
    var startMonth = parseInt($("#graduateStartMonth").val()); 
	var year = $("#graduateEndYear").val();  
	var month = $("#graduateEndMonth").val();
	
	/* 기존 월 select를 모두 삭제한다. */
    $("#graduateEndMonth").find("option").remove();
    $("#graduateEndMonth").append("<option value=''>--</option>");
	
    if(year == startYear){
    	var endMonth = 12;
    	if(year == nowYear){ endMonth = nowMonth; }
    	
    	for(var i=startMonth; i<=endMonth; i++){
	    	if(i<10){
    			$("#graduateEndMonth").append("<option value='0"+i+"'>0"+i+"</option>");
    		}else{
    			$("#graduateEndMonth").append("<option value='"+i+"'>"+i+"</option>");
    		}
	    }
    	/* 기존에 선택된 월값 유지 */
        if(month != null || month != ""){
        	if(parseInt(month) >= startMonth){
        		$("#graduateEndMonth").val(month);
        	}
        }
    }else if(year == nowYear){
    	for(var i=1; i<=nowMonth; i++){
	    	if(i<10){
    			$("#graduateEndMonth").append("<option value='0"+i+"'>0"+i+"</option>");
    		}else{
    			$("#graduateEndMonth").append("<option value='"+i+"'>"+i+"</option>");
    		}
	    }
    	/* 기존에 선택된 월값 유지(기존 값보다 현재 최대값이 작을 경우) */
        if(month != null || month != ""){
        	if(parseInt(month) <= nowMonth+1){
        		$("#graduateEndMonth").val(month);
        	}
        }
    }else{
    	for(var i=1; i<=12; i++){
        	if(i<10){
    			$("#graduateEndMonth").append("<option value='0"+i+"'>0"+i+"</option>");
    		}else{
    			$("#graduateEndMonth").append("<option value='"+i+"'>"+i+"</option>");
    		}
        }
    	if(month != null || month != ""){
        	$("#graduateEndMonth").val(month);
        }
    }
    
    setEndDay();
}

function setEndDay() {
    var year = $("#graduateEndYear").val();
    var month = $("#graduateEndMonth").val();
    var day = $("#graduateEndDay").val();   
    
    var startYear = $("#graduateStartYear").val(); 
    var startMonth = parseInt($("#graduateStartMonth").val()); 
    var startDay = parseInt($("#graduateStartDay").val()); 
    
    var arrayMonth = [31,28,31,30,31,30,31,31,30,31,30,31];

    /* 윤달 체크 */
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        arrayMonth[1] = 29;
    }

    /* 기존 일(day) select를 모두 삭제한다. */
    $("#graduateEndDay").find("option").remove();
    $("#graduateEndDay").append("<option value=''>--</option>");

    if(year == startYear && month == startMonth){
    	for(var i=startDay; i<=arrayMonth[month-1]; i++){
        	if(i<10){
    			$("#graduateEndDay").append("<option value='0"+i+"'>0"+i+"</option>");
    		}else{
    			$("#graduateEndDay").append("<option value='"+i+"'>"+i+"</option>");
    		}
        }
    	
    	/* 기존에 선택된 일값 유지 */
        if(day != null || day != ""){
        	if(parseInt(day) >= startDay){
        		$("#graduateEndDay").val(day);
        		
        	}
        }
    }else{
	    /* 일(day) select 옵션 생성 */
	    for(var i=1; i<=arrayMonth[month-1]; i++){
	    	if(i<10){
				$("#graduateEndDay").append("<option value='0"+i+"'>0"+i+"</option>");
			}else{
				$("#graduateEndDay").append("<option value='"+i+"'>"+i+"</option>");
			}
	    }
	    
	    /* 기존에 선택된 일값 유지(기존 값보다 현재 최대값이 작을 경우) */
	    if(day != null || day != ""){
	    	if(parseInt(day) <= arrayMonth[month-1]){
	    		$("#graduateEndDay").val(day);
	    		
	    	}
	    }
    }
}

</script>
</body>
</html>