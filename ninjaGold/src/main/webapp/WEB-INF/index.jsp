<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ninja Gold Game</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>

	<div>
	<h3>Your Gold: <c:out value="${gold}"/></h3>
	<a href="/clear">Reset</a>
	</div>

<div class="d-flex justify-content-around">
	<div class="card text-center" style="width: 18rem;">
	  <img class="card-img-top" src="/resources/farm.jpg" alt="farm">
	  <div class="card-body">
	    <h5 class="card-title">Farm</h5>
	    <p class="card-text">(earns 10-20 gold)</p>
	    <form method=POST action="/">
	     <input type="hidden" name="location" value="farm">
  <button class="btn btn-warning">Find Gold!</button>
</form>
	  </div>
	</div>
	
	<div class="card text-center" style="width: 18rem;">
	  <img class="card-img-top" src="/resources/cave.jpg" alt="cave">
	  <div class="card-body">
	    <h5 class="card-title">Cave</h5>
	    <p class="card-text">(earns 5-10 gold)</p>
	    <form method=POST action="/">
	     <input type="hidden" name="location" value="cave">
  <button class="btn btn-warning">Find Gold!</button>
</form>
	  </div>
	</div>
	
	<div class="card text-center" style="width: 18rem;">
	  <img class="card-img-top" src="/resources/house.jpg" alt="house">
	  <div class="card-body">
	    <h5 class="card-title">House</h5>
	    <p class="card-text">(earns 2-5 gold)</p>
	    <form method=POST action="/">
	     <input type="hidden" name="location" value="house">
  <button class="btn btn-warning">Find Gold!</button>
</form>
	  </div>
	</div>
	
	<div class="card text-center" style="width: 18rem;">
	  <img class="card-img-top" src="/resources/casino.jpg" alt="casino">
	  <div class="card-body">
	    <h5 class="card-title">Casino</h5>
	    <p class="card-text">(earns/takes 0-50 gold)</p>
	    <form method=POST action="/">
	     <input type="hidden" name="location" value="casino">
  <button class="btn btn-warning">Find Gold!</button>
</form>

</form>
	  </div>
	</div>
	
	<div class="card text-center" style="width: 18rem;">
	  <img class="card-img-top" src="/resources/spa.jpg" alt="spa">
	  <div class="card-body">
	    <h5 class="card-title">Spa</h5>
	    <p class="card-text">(takes 5-20 gold)</p>
	    <form method=POST action="/">
	     <input type="hidden" name="location" value="spa">
  <button class="btn btn-warning">Spend Gold!</button>
</form>
	  </div>
	</div>
	</div>
	
	<div>
	<h2>Activities:</h2>
 <div class="" style="">   
      <div class=" p-3 mb-3 mb-md-0 mr-md-3 bg-light" 
      	style="margin: 0 auto;
	    overflow-y: scroll;
	    width: 600px;
	    height: 200px;
		display: flex;
		flex-direction: column-reverse;
	    ">
	    <!-- reverse order of the list so the newest activity is shown on the bottom -->

		<c:forEach items="${activities}" var="activity">

			<p style=
					"${activity.contains("lost") ? "color: red":"color: green"}";">
				<c:out value="${activity}"/>
			</p>

		</c:forEach>
		

		

		
		
	</div>
	</div>
	</div>

</body>
</html>