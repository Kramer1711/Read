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
        <li class="active"><a href="<%=request.getContextPath() %>/pages/admin/adminadd.jsp">修改密码</a></li>
    </ul>
</header>
<section>
    <form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/admin/upp.do?account=${account }">
        <dl>
            <dt>修改密码</dt>
            <dd><strong>${message }</strong></dd>
            <dd><input type="text" id="username" name="username" disabled="disabled"
                       autofocus class="form-control input-sm " value="${account }"/></dd>
            <dd><input type="password" id="oldPassword" name="oldPassword" placeholder="请输入原密码！" 
                       class="form-control input-sm" /></dd>
            <dd><input type="password" id="newPassword1" name="newPassword1" placeholder="请输入新密码！" 
                       class="form-control input-sm" /></dd>
            <dd><input type="password" id="newPassword2" name="newPassword2" placeholder="请再次输入新密码！" 
                       class="form-control input-sm" /></dd>
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