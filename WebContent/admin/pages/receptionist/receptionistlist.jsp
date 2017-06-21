<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title></title>
    <!--    引入外部CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/list.css"/>

    <!--    引入外部JS  -->
    <script src="<%=request.getContextPath() %>/js/list.js"></script>
</head>
<body>
    <header>
        <ul class="nav nav-tabs">
            <li class="active"><a href="<%=request.getContextPath()%>/receptionist/qry.do">前台管理</a></li>
        </ul>
    </header>
    <section>
        <article>
            <form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/receptionist/qry.do" 
            	class="form-group form-inline form-align">
                <input type="text" id="key" name="key" placeholder="请输入职工姓名"
                       class="form-control input-size input-sm " value="${key }"/>
                <input name="pageNo" value="1" type="hidden"> 
                <input type="submit" value="查 询" class="btn btn-warning btn-search">
            </form>
        </article>
        <form id="form2" name="form2" method="post" action="">
            <table class="date table table-bordered ">
                <thead>
                	<tr>
                    <th>序号</th>
                    <th>操作</th>
                    <th>职工号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>登录帐号</th>
                    <th>入职时间</th>
                    <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="g" items="${pageData }" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td><a href="<%=request.getContextPath() %>/receptionist/chk.do?id=${g.id }">编辑/删除</a>
							</td>
							<td>${g.id}</td>
							<td>${g.name}</td>
							<td>${g.sex}</td>
							<td>${g.account.username}</td>
							<td>
							<fmt:formatDate value="${g.inDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
							</td>
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