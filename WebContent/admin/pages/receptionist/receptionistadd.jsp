<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <li class="active"><a href="<%=request.getContextPath()%>/receptionist/qry.do">前台管理</a></li>
        </ul>
    </header>
    <section>
        <form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/receptionist/add.do">
            <dl>
                <dt>添加前台人员</dt>
                <dd><strong>${message}</strong></dd>
                <dd><input type="text" id="name" name="name" placeholder="请输入姓名！" required
                           autofocus class="form-control input-sm"/></dd>
                <dd><input type="text" id="username" name="username" placeholder="请设置帐号！" required
                           class="form-control input-sm"/></dd>
                <dd>
                <dd>
                    <input type="date" id="workDate" name="inDate" placeholder="请输入入职时间！" 
                           class="form-control input-sm"/>
                </dd>
                <dd>Tips：<br />密码默认为"123456"，如需修改密码和完善信息,请前台人员自行登录设置！管理人员可通过管理操作重置密码！</dd>
                <dd class="btn-container">
                <div class="btn-group" role="group" aria-label="...">
                    <input type="submit" value="确 定" class="btn btn-success "/>
                    <input type="reset" value="重 置" class="btn btn-primary "/>
                </div>
                </dd>
            </dl>
        </form>
    </section>
<script>
</script>
</body>
</html>