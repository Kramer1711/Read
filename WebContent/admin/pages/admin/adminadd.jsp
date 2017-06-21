<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <!--    引入外部CSS  -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/edit.css"/>
</head>
<body>
<header>
    <ul class="nav nav-tabs">
        <li class="active"><a href="<%=request.getContextPath() %>/pages/admin/adminadd.jsp">添加管理员</a></li>
    </ul>
</header>
<section>
    <form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/admin/add.do?globalAccount=${globalAccount }">
        <dl>
            <dt>添加管理员信息</dt>
            <dd><input type="hidden"value="${globalAccount }" name="globalAccount"/></dd>
            <dd><input type="text" id="userName" name="username" placeholder="请输入账号！" required
                       autofocus class="form-control input-sm" value="${username }"/></dd>
            <dd><input type="text" id="remark" name="remark" placeholder="备注" 
                       class="form-control input-sm" /></dd>
            <dd class="btn-container">
                <input type="submit" value="提交" class="btn btn-primary btn-sm"/>
                <input type="reset" value="重 置" class="btn btn-danger btn-sm"/>
            </dd>
        </dl>
    </form>
</section>
</body>
</html>