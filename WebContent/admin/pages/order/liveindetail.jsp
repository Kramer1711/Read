<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>入住订单详情</title>
    <!--引入css-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/edit.css"/>
</head>
<body>
<header>
    <ul class="nav nav-tabs">
        <li class="active"><a href="javascript:void(0)">入住订单详情</a></li>
    </ul>
</header>
<div id="container" >
    <div id = "login">
        <section>
            <form id="form1" name="form1"  >
                <dl>
                    <dt>入住订单详情</dt>
                </dl>
                <table class="table   ">
                    <tr>
                        <th> 订单编号</th>
                        <th> ${livein.id }</th>
                    </tr>
                    <tr>
                        <th> 客房编号</th>
                        <th> ${livein.rooms.id }</th>
                    </tr>
                    <tr>
                        <th> 客房类型</th>
                        <th> ${livein.rooms.roomType.typeName }</th>
                    </tr>
                    <tr>
                        <th> 入住客户</th>
                        <th> ${livein.customer.nameCustomer }</th>
                    </tr>
                    <tr>
                        <th> 证件类型</th>
                        <th> ${livein.credentialType }</th>
                    </tr>
                    <tr>
                        <th> 证件编号</th>
                        <th> ${livein.credentialNo }</th>
                    </tr>
                    <tr>
                        <th> 登记时间</th>
                        <th> ${livein.dateRegister }</th>
                    </tr>
                    <tr>
                        <th> 入住时间</th>
                        <th> ${livein.dateIn }</th>
                    </tr>
                    <tr>
                        <th> 操作员</th>
                        <th> ${livein.receptionist.name }</th>
                    </tr>
                    <tr>
                        <th> 备注</th>
                        <th> ${lievin.remark }</th>
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