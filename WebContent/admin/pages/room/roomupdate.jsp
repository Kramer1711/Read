<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <li class="active"><a href="<%=request.getContextPath() %>/room/qry.do">客房管理</a></li>
    </ul>
</header>
<section>
    <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/room/upd.do">
        <dl>
            <dt>编辑客房${rooms.id}的信息</dt>
            <dd><strong>${message }</strong></dd>
            <input type="hidden" name="account" value="${account }"/>
            <dd><input type="text" id="roomId" name="roomId" placeholder="请输入客房编号！" required
                       autofocus class="form-control input-sm"
                       value="${rooms.id }"/></dd>
            <dd>
                <select id="roomTypeId" name="roomTypeId" class="form-control input-sm" required>
                    <option value="${rooms.roomType.id }">${rooms.roomType.typeName }</option>
                    <c:forEach var="c" items="${rtList }" >
                    	<c:if test="${c.id!=rooms.roomType.id }">
                    		<option value="${c.id }">${c.typeName }</option>
                    	</c:if>
                    </c:forEach>
                </select>
            </dd>
            <dd>
                <select id="roomState" name="roomState" class="form-control input-sm" required>
                    <option value="${rooms.state }">${rooms.state }</option>
                    <option value="空闲">空闲</option>
                    <option value="正在使用">正在使用</option>
                    <option value="暂不可用">暂不可用</option>
                </select>
            </dd>
            <dd><input type="text" id="roomLocation" name="roomLocation" placeholder="请输入客房位置！" required
                       value="${rooms.location }" class="form-control input-sm"/></dd>
            <dd><input type="text" id="roomRemark" name="roomRemark" placeholder="备注（非必填项）"
                       value="${rooms.remark }" class="form-control input-sm"/></dd>
            <dd class="btn-container">
            	<div class="btn-group" role="group" aria-label="..." >
                	<input type="submit" value="确 定" class="btn btn-success btn-sm"/>
                	<input type="reset" value="重 置" class="btn btn-warning btn-sm" />
                	<input type="button" value="删 除" class="btn btn-danger btn-sm" onclick="deleteRoom(${rooms.id})"/>
                	<input type="button" value="返 回" class="btn btn-info btn-sm" onclick="returnQry()"/>
                </div>
                
            </dd>
        </dl>
    </form>
</section>
<script type="text/javascript">

function returnQry() {				
	window.location.href="<%=request.getContextPath()%>/room/qry.do";
}
function deleteRoom(id){
	var roomId = String(id);
	window.location.href="<%=request.getContextPath()%>/room/del.do?id="+roomId;
}
</script>
</body>
</html>