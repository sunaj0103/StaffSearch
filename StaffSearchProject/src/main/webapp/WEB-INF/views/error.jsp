<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ page session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/web/js_css/jquery-3.1.1.min.js"></script>
<title>게시판</title>
<script>
function prePage(){
	history.back();
}

function close(){
	var win=window.open("","_self");
	win.close();
}
</script>
</head>
<body>
	<div class="error">
		<h3>${msg}</h3>
		<div>
			<a class="btn" href="javascript:prePage();">이전 페이지</a>

		</div>
	</div>
</body>
</html>