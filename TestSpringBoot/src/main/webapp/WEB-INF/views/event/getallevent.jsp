<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.* , com.petpet.bean.EventBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <!-- jQuery library -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <!-- Popper JS -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> 
 <!-- Latest compiled JavaScript -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 



 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>  -->
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"> -->

<title> 活動頁面</title>
<style>
nav {
  background-color: #60CA91;
  padding:13px;
  position:fixed;
  top:0;
  left:0;
  width:100%;
  z-index:100;
}
nav ul{
  display:flex;
  margin:0 auto;
  padding:0;
  justify-content:center;
  list-style-type: none;
}
nav ul li a{
  color:deepblue;
  padding:15px;
  font-size:28px;
  margin:40px;
}
td {
  text-align: center;
}
footer{
  background-color:#58876D;
  padding:13px;
  margin:0px;
  font-size:20px;
  text-align: center;
  font-weight:bolder;
}
.anchor::before {
content: "";
display: block;
height: 70px;
}

.table > tbody > tr > td {
     vertical-align: middle;
}
</style>
<script>

</script>
</head>
<body>
    <nav>
		<ul>
			<li><a href="queryallevent.controller" class="href">查詢所有活動</a> 	</li>
			<li><a href="createeevent.url" class="href">新增活動</a> 	</li>
			<li><a href="about" class="href">about</a> 	</li>
		</ul>
	</nav>	


<div class="container anchor align-middle" >
<table class="table table-hover " id="datatable">
	<thead class="thead-dark">
		<tr>
			<th scope="col">活動名稱</th> <th scope="col">活動是否開啟</th> <th scope="col">起始時間</th><th scope="col">結束時間</th>  <th scope="col">地點</th> 
			<th scope="col">種類</th><th scope="col">人數上限</th> <th scope="col">費用</th><th>點閱次數</th><th scope="col" >修改</th><th scope="col">刪除</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${events}" var="event" varStatus="s">
		<tr>
			<td scope="row"><a href="<c:url value='/queryevent.controller?eventid=${event.eventID}'  />">  ${event.eventName} </a> </td> 
			<c:choose>
				<c:when test="${event.eventStatus == 'true'}">
					<td>開放 <i class="fa fa-check fa-1x" aria-hidden="true"></i></td>
				</c:when>
				<c:when test="${event.eventStatus == 'false'}">
					<td>不開放<i class="fa fa-times" aria-hidden="true"></i>
					</td>
				</c:when>
			</c:choose>
			
			<td><fmt:formatDate pattern="yyyy-MM-dd aa HH:mm" value='${event.eventStartTime}'/></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd aa HH:mm" value='${event.eventEndTime}'/></td> 
			<td>${event.eventLocation}</td>
			<td>${event.eventType}<br></td>
			<td>${event.eventMaxLimit}</td>
			<td>${event.eventFee}</td>
			<td>${event.eventClick}</td>
			<td><input type="button" value="修改" name="eventID" onclick="location.href='/petpet/queryevent.controller?eventid=${event.eventID}'"> <i class="fa fa-pencil fa-1x" aria-hidden="true"></i>
			</td>
			<td><input type="button" class="delete" value="刪除" name="eventID" onclick="deleteItem(${event.eventID})"><i class="fa fa-trash fa-1x" aria-hidden="true"></i>
			</td>
		</tr>
  		</c:forEach>
	</tbody>
  
</table>
</div>


<footer>
	第八組組員-蕭詠謙
</footer>


</body>
<script>
 
function deleteItem(ID) {
    if (confirm("你確定要刪除這個活動嗎")) {
    	// let  web="/petpet/deleteevent.controller?eventid="+ID;
    	// window.location.href=web;
    	$.get( "/petpet/deleteevent.controller?eventid="+ID, function( ) {
			alert( "刪除成功" );
			location.reload() ;
});
    }
    return false;
}

$(document).ready( function () {
    $('#datatable').DataTable();
} );

 </script>


</html>