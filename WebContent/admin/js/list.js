/**
 * Created by Kramer on 2016/12/25.
 */

/**
 * 全选或反选
 * @param thisz
 */
function checkedOrOnchecked(thisz) {
    //  获得所有数据行的复选框
    var idsArr = document.getElementsByName("ids");
    //  循环修改选中状态的属性
    for(i = 0;i < idsArr.length;i++){
        idsArr[i].checked = thisz.checked;
    }
}
/**
 * 获得选择复选框的数量
 */
function getelectdCount() {
    //  获得所有数据行的复选框
    var idsArr = document.getElementsByName("ids");
    var count = 0;//选中的数量
    //  循环统计选中数量
    for(i = 0;i < idsArr.length;i++){
        if (idsArr[i].checked){count++;}
    }
    return count;
}
/**
 * 添加
 */
function add() {
    //  获得表单对象
    var form = document.getElementById("form2");
    //  设置提交路径
    form.action  = "employeeadd.html";
    //  提交表单
    form.submit();
    // location.href = "employeeadd.html";
}
/**
 * 修改
 */
function update() {
    //获得选中的数量
    var count = getelectdCount();
    //  获得表单对象
    var form = document.getElementById("form2");
    if (count != 1){
        alert("请选择一条需要修改的信息！" );
    }else {
        //  设置提交路径
        form.action = "employeeupdate.html";
        //  提交表单
        form.submit();
    }
}
/**
 * 删除
 */
function deleted() {
    //获得选中的数量
    var count = getelectdCount();
    //  判断是否选中了数据行
    if(count == 0){
        alert("请选择要删除的记录！");
        return;
    }
    var form = document.getElementById("form2");
    //  弹出选择对话框
    if(confirm("您是否要删除选中的记录！")){
        alert("删除");
        form.action = "";
        form.submit();
    }
}

function selected() {
    alert("wocao");
}