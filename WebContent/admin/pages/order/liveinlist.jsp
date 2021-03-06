<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<!--    引入外部CSS  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/list.css" />
</head>
<body>
	<header>
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:void(0)">入住查询</a></li>
		</ul>
	</header>
	<section>
		<article>
			<form id="form1" name="form1" method="post"
				action="<%=request.getContextPath()%>/livein/qry.do"
				class="form-group form-inline form-align">
				<input type="hidden" name="pageNo" value="1"/>
				<input type="input" id="key" name="key" placeholder="请输入关键字！"
					class="form-control input-size input-sm " autofocus value="${key }"/> <input
					type="submit" value="查 询" class="btn btn-warning btn-search">
			</form>
		</article>
		<form id="form2" name="form2" method="post" action="">
			<!--    table   详细信息    -->
			<table class="table table-bordered ">
				<tbody>
					<tr>
						<th>序号</th>
						<th>操作</th>
						<th>订单编号</th>
						<th>客房编号</th>
						<th>客房类型</th>
						<th>入住客户</th>
						<th>证件类型</th>
						<th>证件编号</th>
						<th>登记时间</th>
						<th>入住时间</th>
						<th>押金</th>
						<th>备注</th>
					</tr>
				</tbody>
				<tbody>
					<c:forEach var="g" items="${pageData}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td><a
								href="/HotelManager/livein/chk.do?id=${g.id }">查看</a>
							</td>
							<td>${g.id}</td>
							<td>${g.rooms.id}</td>
							<td>${g.rooms.roomType.typeName}</td>
							<td>${g.customer.nameCustomer}</td>
							<td>${g.credentialType}</td>
							<td>${g.credentialNo}</td>
							<td>${g.dateRegister}</td>
							<td>${g.dateIn}</td>
							<td>${g.foregift}</td>
							<td>${g.remark}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<ul class="pagination nav-align">
					<c:if test="${totalPage>0 }">
						<c:if test="${currentPage==1 }">
							<li class="disabled"><a href="#">首页</a></li>
							<li class="disabled"><a href="#">&laquo;</a></li>
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
		var goPage = function(no) {
			var form = document.querySelector("#form1");
			form.pageNo.value = String(no);
			form.submit();
		}
	</script>
</body>
</html>
</body>
</html>