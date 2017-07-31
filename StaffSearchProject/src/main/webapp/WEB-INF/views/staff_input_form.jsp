<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/web/js_css/jquery-3.1.1.min.js"></script>
<title>사원 정보 등록</title>
<style>
.staffDiv {
	width: 1000px;
	margin: 30px auto;
	padding-top: 30px;
}

.staffInfo, .staffInfo th, .staffInfo td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}
.staffInfo {
	border-collapse: collapse;
	width: 100%;
}
.title {
	background-color: steelblue;
	color: #fff;
}
.btn {
	width: 80px;
	height: 30px;
	padding: 3px;
	margin: 10px 50px 10px 340px;
}
</style>
<script>
var ok = "${ok}";

if(ok == "input"){
	alert("사원 정보가 등록되었습니다.");
	window.opener.top.location.reload();
	window.close();
}

var regJumin1 = /^\d{6}$/;
var regJumin2 = /^\d{7}$/;

$(function(){
	$("#inputBtn").click(function(){
		if($("#staff_name").val() == ""){
			alert("이름을 입력해 주세요.");
			return false;
		}
		
		if($("#jumin_no1").val() == ""){
			alert("주민번호를 입력해 주세요.");
			return false;
		}else{
        	if(!regJumin1.test($("#jumin_no1").val())) {
        		alert("주민번호는 숫자만 사용 가능합니다.");
        		return false;
        	}
        }
		
		if($("#jumin_no2").val() == ""){
			alert("주민번호를 입력해 주세요.");
			return false;
		}else{
        	if(!regJumin2.test($("#jumin_no2").val())) {
        		alert("주민번호는 숫자만 사용 가능합니다.");
        		return false;
        	}
        }
		
		if($("#religion_code").val() == ""){
			alert("종교를 선택해 주세요.");
			return false;
		}

		if($(':radio[name="school_code"]:checked').length < 1){
			alert("학력을 선택해 주세요.");
			return false;
		}
		
		if($(':checkbox[name="staff_skill_no"]:checked').length < 1){
			alert("기술을 선택해 주세요.");
			return false;
		}
		
		var year = $("#graduateYear").val();
	    var month = $("#graduateMonth").val();
	    var day = $("#graduateDay").val();   
		
		if(year == null || year == "" || month == null || month == "" || day == null || day == ""){
			alert("졸업일을 선택해 주세요.");
			return false;
	    }
				
		if(confirm("정말 저장 하시겠습니까?")){
			$("#erpInputFrm").submit();
		}
    });
	
	$("#resetInputBtn").click(function(){
		location.href="/web/staffInput";
	});
});
</script>
</head>
<body>
<div class="staffDiv">
	<form id="erpInputFrm" name="erpInputFrm" method="post" action="/web/staffInputOk">
		<table class="staffInfo">
			<tr>
				<td colspan="6" class="title">사원 정보 등록</td>
			</tr>
			<tr>
				<td class="title">이름</td>
				<td><input type="text" name="staff_name" id="staff_name"/></td>
				<td class="title">주민번호</td>
				<td><input type="text" name="jumin_no1" id="jumin_no1"/>-<input type="password" name="jumin_no2" id="jumin_no2"/></td>
				<td class="title">종교</td>
				<td>
					<select id="religion_code" name="religion_code">
						<option value="">--</option>
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
						<input type="radio" name="school_code" value="${schoolList.school_code}"/>
						<label for="school_code">${schoolList.school_name}</label>
					</c:forEach>
				</td>
				<td class="title">기술</td>
				<td colspan="3">
					<c:forEach var="skillList" items="${skillList}">
						<input type="checkbox" name="staff_skill_no" value="${skillList.skill_code}"/>
						<label for="skill_code">${skillList.skill_name}&nbsp;</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		</td>
			</tr>
			<tr>
				<td class="title">졸업일</td>
				<td colspan="6">
					<select id="graduateYear" name="graduateYear" onChange="setMonth()"><option value="">----</option></select>년
					<select id="graduateMonth" name="graduateMonth" onChange="setDay()"><option value="">--</option></select>월
					<select id="graduateDay" name="graduateDay"><option value="">--</option></select>일
          		</td>
			</tr>
		</table>
		<div>
			<input type="button" id="inputBtn" value="등록" class="btn"/>
			<input type="button" id="resetInputBtn" value="초기화" class="btn"/>
		</div>
	</form>
</div>
<script>
$(document).ready(function() {
	var nowDate = new Date();
    var nowYear = nowDate.getFullYear();
    var nowMonth = eval(nowDate.getMonth()) +1;
    var nowDay = eval(nowDate.getDate());
    
    var startYear = nowYear - 60;
    for(var i=nowYear; i>startYear; i--) {
    	$("#graduateYear").append("<option value='"+i+"'>"+i+"</option>");
    }
    
    for(var i=1; i<=nowMonth; i++){
		if(i<10){
			$("#graduateMonth").append("<option value='0"+i+"'>0"+i+"</option>");
		}else{
			$("#graduateMonth").append("<option value='"+i+"'>"+i+"</option>");
		}
    }
    
});

function setMonth() {
	var nowDate = new Date();
    var nowYear = nowDate.getFullYear();
    var nowMonth = eval(nowDate.getMonth()) +1;
    var nowDay = eval(nowDate.getDate());
    
	var year = $("#graduateYear").val();  
	var month = $("#graduateMonth").val();
	
	/* 기존 월 select를 모두 삭제한다. */
    $("#graduateMonth").find("option").remove();
	
    if(year == nowYear){
    	for(var i=1; i<=nowMonth; i++){
    		if(i<10){
    			$("#graduateMonth").append("<option value='0"+i+"'>0"+i+"</option>");
    		}else{
    			$("#graduateMonth").append("<option value='"+i+"'>"+i+"</option>");
    		}
	    }
    	/* 기존에 선택된 월값 유지(기존 값보다 현재 최대값이 작을 경우) */
        if(month != null || month != ""){
        	if(parseInt(month) <= nowMonth+1){
        		$("#graduateMonth").val(month);
        	}
        }
    }else{
    	for(var i=1; i<=12; i++){
    		if(i<10){
    			$("#graduateMonth").append("<option value='0"+i+"'>0"+i+"</option>");
    		}else{
    			$("#graduateMonth").append("<option value='"+i+"'>"+i+"</option>");
    		}
        }
    	if(month != null || month != ""){
        	$("#graduateMonth").val(month);
        }
    }

    setDay();
}

function setDay() {
    var year = $("#graduateYear").val();
    var month = $("#graduateMonth").val();
    var day = $("#graduateDay").val();   
    
    var arrayMonth = [31,28,31,30,31,30,31,31,30,31,30,31];

    /* 윤달 체크 */
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        arrayMonth[1] = 29;
    }

    /* 기존 일(day) select를 모두 삭제한다. */
    $("#graduateDay").find("option").remove();
        
    /* 일(day) select 옵션 생성 */
    for(var i=1; i<=arrayMonth[month-1]; i++){
    	if(i<10){
			$("#graduateDay").append("<option value='0"+i+"'>0"+i+"</option>");
		}else{
			$("#graduateDay").append("<option value='"+i+"'>"+i+"</option>");
		}
    }
    
    /* 기존에 선택된 일값 유지(기존 값보다 현재 최대값이 작을 경우) */
    if(day != null || day != ""){
    	if(parseInt(day) <= arrayMonth[month-1]){
    		$("#graduateDay").val(day);
    	}
    }
}

</script>
</body>
</html>