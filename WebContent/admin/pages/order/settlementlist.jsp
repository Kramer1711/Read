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
			<li class="active"><a href="javascript:void(0)">账单查询</a></li>
		</ul>
	</header>
	<section>
		<article>
			<form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/settlement/qry.do"
				class="form-group form-inline form-align">
				<input type="hidden" name="pageNo" value="1" /> <input type="input"
					id="key" name="key" placeholder="请输入关键字！"
					class="form-control input-size input-sm " autofocus value="${key }" />
				<input type="submit" value="查 询" class="btn btn-warning btn-search"
					onclick="selected()">
			</form>
		</article>
		<form id="form2" name="form2" method="post" action="">
			<!--    table   详细信息    -->
			<table class="table table-bordered ">
				<thead>
					<tr>
						<th>序号</th>
						<th>操作</th>
						<th>账单编号</th>
						<th>客房编号</th>
						<th>结账客户</th>
						<th>缴费金额</th>
						<th>操作时间</th>
						<th>操作员</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="g" items="${pageData}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td><a
								href="/HotelManager/settlement/chk.do?id=${g.id }">查看</a>
							</td>
							<td>${g.id}</td>
							<td>${g.livein.rooms.id }
							<td>${g.livein.customer.nameCustomer}</td>
							<td>${g.account}</td>
							<td>${g.settleTime}</td>
							<td>${g.receptionist.name }</td>
							<td>${g.remark}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<!--    页面标签    -->
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