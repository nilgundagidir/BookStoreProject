<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cilek Books - Online Bookstore</title>
<link rel="stylesheet" href="css/mycss.css" >
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<div class="center">		
		<div>
			<h2>New Books:</h2>
			<c:forEach items="${listNewBooks}" var="book">
				<jsp:directive.include file="book_group.jsp" />
			</c:forEach>
		</div>
		<div class="next-row">
			<h2>Best-Selling Books:</h2>
			<c:forEach items="${listBestSellingBooks}" var="book">
				<jsp:directive.include file="book_group.jsp" />
			</c:forEach>			
		</div>
		<div class="next-row">
			<h2>Most-favored Books:</h2>
			<c:forEach items="${listFavoredBooks}" var="book">
				<jsp:directive.include file="book_group.jsp" />
			</c:forEach>			
		</div>
		<br/><br/>
	</div>
	
	<jsp:directive.include file="footer.jsp" />
</body>
</html>