<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>预定订单详情</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/edit.css"/>
</head>
<body>
<header>
    <ul class="nav nav-tabs">
        <li class="active"><a href="javascript:void(0)">预定订单详情</a></li>
    </ul>
</header>
<div id="container" >
    <div id = "login">
        <section>
            <form id="form1" name="form1"  >
                <dl>
                    <dt>预定订单详情</dt>
                </dl>
                <table class="table   ">
                    <tr>
                        <th> 订单编号</th>
                        <th> ${reserve.id}</th>
                    </tr>
                    <tr>
                        <th> 客房编号</th>
                        <th> ${reserve.rooms.id}</th>
                    </tr>
                    <tr>
                        <th> 客房类型</th>
                        <th> ${reserve.rooms.roomType.typeName}</th>
                    </tr>
                    <tr>
                        <th> 预定客户</th>
                        <th> ${reserve.customer.nameCustomer}</th>
                    </tr>
                    <tr>
                        <th> 联系号码</th>
                        <th> ${reserve.customer.telCustomer}</th>
                    </tr>
                    <tr>
                        <th> 登记时间</th>
                        <th> 2017-01-20</th>
                    </tr>
                    <tr>
                        <th> 预计入住时间</th>
                        <th> ${reserve.reserveTime}</th>
                    </tr>
                </table>
                <p class="btn-container">
                    <input type="button" value="返 回" class="btn btn-primary btn-sm" onclick="history.back(-1)"/>
                </p>
            </form>
        </section>
    </div>
</div>
</body>
</html>