<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<head>
<meta charset="UTF-8">
<title></title>
<!--    引入外部CSS  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" />

<!--    引入外部JS  -->
<script src="<%=request.getContextPath()%>/js/list.js"></script>
</head>
<body>
	<header>
		<ul class="nav nav-tabs">
			<li class="active"><a href="<%=request.getContextPath() %>/pages/room/roomlist.jsp">客房管理</a></li>
		</ul>
	</header>
	<section>
		<article>
			<form id="qryRoomForm" name="qryRoomForm" method="post"
				action="/HotelManager/room/qry.do?globalAccount=${globalAccount }"	class="form-group form-inline form-align">
				<input name="pageNo" value="1" type="hidden"> 
				<input id="key" name="key"  placeholder="房间编号/房间状态/室内配置/房间位置"
					class="form-control input-size input-sm " value="${key }" autofocus />
				<input type="submit" value="查 询" class="btn btn-warning btn-search">
			</form>
		</article>
		<form id="form2" name="form2" method="post" action="">
			<!--    table   详细信息    -->
			<table class="date table table-bordered ">
				<thead>
					<tr>
						<th>序号</th>
						<th>操作</th>
						<th>编号</th>
						<th>名称</th>
						<th>位置</th>
						<th>状态</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="g" items="${pageData}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td><a href="/HotelManager/room/chk.do?id=${g.id}&globalAccount=${globalAccount }">编辑/删除</a>
							</td>
							<td>${g.id}</td>
							<td>${g.roomType.typeName}</td>
							<td>${g.location}</td>
							<td>${g.state}</td>
							<td>${g.remark}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
            	<ul>
            	<c:if test="${totalPage>0 }">
            	<c:if test="${currentPage==1 }">
                	<li class="disabled"><a href="#" >首页</a></li>
                	<li class="disabled"><a href="#" >&laquo;</a></li>
            	</c:if>
            	<c:if test="${currentPage>1 }">
                	<li><a href="javascript:goPage(1)">首页</a></li>
                	<li><a href="javascript:goPage(${currentPage-1 })">&laquo;</a></li>
                </c:if>
                	<li><a href="javascript:goPage(${currentPage} )">第${currentPage}页</a></li>
                <c:if test="${currentPage==totalPage }">
                	<li class="disabled"><a href="#">&raquo;</a></li>
                	<li class="disabled"><a href="#">末页</a></li>
                </c:if>
                <c:if test="${currentPage<totalPage}">
                	<li><a href="javascript:goPage(${currentPage+1})">&raquo;</a></li>
                	<li><a href="javascript:goPage(${totalPage})">末页</a></li>
                </c:if>
                </c:if>
            	</ul>
        	</nav>
		</form>
	</section>
	<script>
		//跳转到指定页面
		var goPage=function(no){
				var form=document.querySelector("#qryRoomForm");
				form.pageNo.value=String(no);
				form.submit();
		}
	</script>
</body>
</html>