<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <!--    引入外部CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/edit.css"/>
</head>
<body>
<header>
    <ul class="nav nav-tabs">
        <li class="active"><a href="<%=request.getContextPath() %>/pages/room/roomlist.jsp">客房管理</a></li>
    </ul>
</header>
<section>
    <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/room/add.do">
        <dl>
            <dt>录入客房信息</dt>
            <dd><strong>${message }</strong></dd>
            <dd><input type="text" id="roomId" name="roomId" placeholder="请输入客房编号！" required
                       autofocus class="form-control input-sm"
                       value="${vo.id }"/></dd>
            <dd>
                <select id="roomType" name="roomType" class="form-control input-sm" required>
                    <c:forEach var="c" items="${rtList }" >
                    	<option value="${c.id }">${c.typeName }</option>
                    </c:forEach>
                </select>
            </dd>
            <dd><input type="text" id="roomLocation" name="roomLocation" placeholder="请输入客房位置！" required
                       value="${vo.location }" class="form-control input-sm"/></dd>
            <dd><input type="text" id="roomRemark" name="roomRemark" placeholder="备注（非必填项）"
                       value="${vo.remark }" class="form-control input-sm"/></dd>
				<dd class="btn-container">
					<div class="btn-group" role="group" aria-label="...">
						<input type="submit" value="确 定" class="btn btn-success btn-sm"
							onclick="tips(${message})" /> <input type="reset" value="重 置"
							class="btn btn-danger btn-sm" /> <input type="button" value="返回"
							class="btn btn-info btn-sm" onclick="returnQry()" />
					</div>
				</dd>
			</dl>
    </form>
</section>
<script>
		function tips(message){
			var ms = String(messags);
			alert(messags);
			alert(ms);
		}
		function returnQry(){
			window.location.href="<%=request.getContextPath()%>/room/qry.do";
		}
</script>
</body>
</html>