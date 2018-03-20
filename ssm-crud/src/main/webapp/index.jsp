<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>

<!-- 引入bootstrap 样式文件 -->
<link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	
	<!-- 批量删除的模态窗口 -->
	<div class="modal fade" id="empDeleteAllModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">员工删除</h4>
		      </div>
		      <div class="modal-body">
					<div class="alert alert-danger" role="alert">确定要删除所有选中的吗？</div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-danger" id="emp_deleteAll_but">确定</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	<!-- 单个删除的模态窗口 -->
	<div class="modal fade" id="empDeleteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">员工删除</h4>
		      </div>
		      <div class="modal-body">
					<div class="alert alert-danger" role="alert">确定要删除吗？</div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-danger" id="emp_delete_but">确定</button>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- 修改的模态窗口 -->
	<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">员工更新</h4>
		      </div>
		      <div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="emp_update_input" class="col-sm-2 control-label">lastName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="email_update_input" class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control" id="email_update_input"
									placeholder="xiaokeai@163.com">
									<span class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label  class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
										</label>
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender1_update_input" value="W"> 女
									</label>
							</div>
						</div> 
						
						<div class="form-group">
							<label  class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_update_select"></select>
							</div>
						</div>
					</form>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" id="emp_update_but">更新</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	<!-- 新增的模态窗口 -->
		<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
		      </div>
		      <div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="emp_add_input" class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control" id="emp_add_input"
									placeholder="empName">
									<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control" id="email_add_input"
									placeholder="xiaokeai@163.com">
									<span class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label  class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
										</label>
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender1_add_input" value="W"> 女
									</label>
							</div>
						</div> 
						
						<div class="form-group">
							<label  class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_add_select"></select>
							</div>
						</div>
					</form>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" id="emp_svae_but">保存</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<H1>SSM-CRUD</H1>
			</div>
		</div>
		<!-- 新增，删除按钮-->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-success" id="emp_add_model_but">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>

		</div>
		<!-- 表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all"/></th>
							<th>#</th>
							<th>empName</th>
							<th>email</th>
							<th>gender</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>

			</div>
		</div>
		<!-- 显示分页信息-->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>

		</div>
	</div>


	<!-- 引入jquery 文件  -->
	<script type="text/javascript"
		src="${path }/static/js/jquery-1.12.4.min.js"></script>
	<!-- 引入bootstrap js文件 -->
	<script src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		
		//设置总记录数全集变量
		var totalALL,currentPage;
			
		//1.页面加载完成之后，直接发送一个ajax请求，要到分页信息
		 $(function() {
			to_page(1);
		   });

		//抽取成单独的页码查询
		function to_page(pn) {
			$("#check_all").prop("checked",false);
			$.ajax({
				url : "${path}/emps",
				data : "pn="+pn,
				type : "GET",
				success : function(result) {
					//1.解析并显示员工数据
					build_emps_table(result);
					//2.解析显示分页信息
					build_page_info(result);
					//3.解析显示分页条
					build_page_nav(result);
				}
			});
		}

		// 解析并显示员工数据的方法
		function build_emps_table(result) {
			//每一次请求 都清空table表格
			$("#emps_table tbody").empty();
			//所有的员工数据
			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(
						item.gender == "M" ? "男" : "女");
				var emailTd = $("<td></td>").append(item.email);
				var departmentTd = $("<td></td>").append(
						item.department.deptName);

				var editBtn = $("<button></button>").addClass(
						"btn btn-info btn-sm edit_btn").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append("编辑");
					// 给编辑按钮添加一个属性
					editBtn.attr("edit-id",item.empId);
					
				var delBtn = $("<button></button>").addClass(
						"btn btn-danger btn-sm delete_btn").append(
						$("<span></span>")
								.addClass("glyphicon glyphicon-trash")).append(
						"删除");
				// 给删除按钮添加一个属性
				delBtn.attr("del-id",item.empId);
				
				
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(
						delBtn);
				$("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(
						genderTd).append(emailTd).append(departmentTd).append(
						btnTd).appendTo("#emps_table tbody");
			});
		}

		// 解析显示分页
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前第" + result.extend.pageInfo.pageNum + "页,共有"
							+ result.extend.pageInfo.pages + "页 ,总计"
							+ result.extend.pageInfo.total + "条记录");	
			totalALL = result.extend.pageInfo.total; //给全局总记录数赋值	
			currentPage = result.extend.pageInfo.pageNum; //给全局当前页赋值	
		}

		// 解析显示分页条,并且点击有动作发生...
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");

			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			//判断是否还有上一页 false 则设置不可以再点击
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//给元素绑定点击事件
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum-1);
				});
			}
		

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var listPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			//判断是否还有上一页 false 则设置不可以再点击
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				listPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum+1);
				});
				listPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			//添加首页和前一页
			ul.append(firstPageLi).append(prePageLi);

			//遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numli = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
						numli.addClass("active");
				}
				//绑定单击事件 当点击时发送ajax请求
				numli.click(function() {
					to_page(item);
				});
				ul.append(numli);
			});
			//添加下一页和末页
			ul.append(nextPageLi).append(listPageLi);
			
			var navEle = $("<nav></nav").append(ul);
			navEle.appendTo("#page_nav_area ");
		}
	
		//清空表单样式及内容
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
			
		// 点击新增弹出新增的模态窗口
		$("#emp_add_model_but").click(function(){
			//清除表单数据  表单完整重置(表单的数据,和表单有的样式)
			reset_form("#empAddModel form");
			
			//调用查询所有部门信息的ajax请求
			getDepts("#dept_add_select");
			//弹出模态窗
			$("#empAddModel").modal({
				backdrop:"static"
			});
		});
		
		//查询所有的部门信息显示在下拉列表中
		function getDepts(ele){
			$(ele).empty();
			$.ajax({
				url:"${path}/depts",
				type:"GTE",
				success:function(result){
					$.each(result.extend.depts,function(){
						var optionEle =$("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionEle.appendTo(ele);
					});
				}	
			});	
		}
		

		//校验表单数据
		function validate_add_form(){
			//1、拿到要校验的数据，使用正则表达式
			var empName = $("#emp_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(empName)){
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				show_validate_msg("#emp_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			}else{
				show_validate_msg("#emp_add_input", "success", "");
			};
			
			
			//2、校验邮箱信息
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//应该清空这个元素之前的样式
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
				return false;
			}else{
				show_validate_msg("#email_add_input", "success", "");
			}
			return true;
		}
		
		//显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		// 验证用户是否存在
		$("#emp_add_input").change(function(){
			//发送ajax请求到服务器验证是否存在
			var empName = this.value;
			$.ajax({
				url:"${path}/change",
				data:"empName="+empName,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#emp_add_input","success","用户名可用");
						$("#emp_svae_but").attr("ajax-va","success");
					}else{
						show_validate_msg("#emp_add_input","error",result.extend.va_msg);
						$("#emp_svae_but").attr("ajax-va","error");
					}
				}	
			});
		});
		
		//  点击保存按钮提交给服务器进行保存
		$("#emp_svae_but").click(function(){
			
			// 1.先对要提交给服务器的数据进行校验
			
			if(!validate_add_form()){
				return false;
			};
			
			// 2.对ajax发送的验证用户是否存在的请求在验证
			if($(this).attr("ajax-va")==error){
				return false;
			}
			
			//3.发送ajax请求保存员工
			$.ajax({
				url:"${path}/emp",
				type:"POST",
				data:$("#empAddModel form").serialize(),//serialize() 序列化form 表单中的元素用于ajax请求
				success:function(result){
					//员工保存成功后 
					//服务器端进行验证
					if(result.code==100){
						//1.关闭模态框  
						$("#empAddModel").modal('hide');
						//2.来到最后一页显示数据
						to_page(totalALL);
					}else{
						//有哪个字段的错误信息就显示哪个字段的；
						if(undefined != result.extend.errorField.email){
							//显示邮箱错误信息
							show_validate_msg("#email_add_input", "error", result.extend.errorField.email);
						}
						if(undefined != result.extend.errorField.empName){
							//显示员工名字的错误信息
							show_validate_msg("#emp_add_input", "error", result.extend.errorField.empName);
						}
					}	
				}	
			});
		});
		
		$(document).on("click",".edit_btn",function(){
			// 1.调用查询部门信息的函数
			getDepts(dept_update_select);
			
			// 2.调用查询员工信息的函数并显示
			getemp($(this).attr("edit-id"));
			
			// 3. 把员工的Id传递给模态窗口的更新按钮
			$("#emp_update_but").attr("edit-id",$(this).attr("edit-id"));
			
			// 4.弹出模态窗口
				$("#empUpdateModel").modal({
				backdrop:"static" 
			});		
		});
		
		function getemp(id){
			$.ajax({
				url:"${path}/emp/"+id,
				type:"GET",
				success:function(result){
					var empData =result.extend.emp;
					$("#empName_update").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModel input[name=gender]").val([empData.gender]);
					$("#empUpdateModel select").val([empData.dId]);
				}
			});
		}
		
		
		//当点击更新按钮的时候发送 ajax 请求
		$("#emp_update_but").click(function(){
			//  1. 验证邮箱
			var email = $("#email_update_input").val();
			var regEmail =/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//应该清空这个元素之前的样式
				show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
				return false;
			}else{
				show_validate_msg("#email_update_input", "success", "");
			}
			
			// 2. 发送 ajax请求
			$.ajax({
				url:"${path}/emp/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#empUpdateModel form").serialize(),
				success:function(result){
					//1、关闭对话框
					$("#empUpdateModel").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});	
		});
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			// 获得属性值
			var empId = $(this).attr("del-id");
			
			// 弹出是否确认删除模态窗口
			$("#empDeleteModel").modal({
				backdrop:"static" 
			});	
			//点击确认按钮发送ajax请求
			$("#emp_delete_but").click(function(){
				$.ajax({
					url:"${path}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						//1、关闭对话框
						$("#empDeleteModel").modal("hide");
						//回到本页
						to_page(currentPage);
					}
			    });
			});
		});
		
		
		// 完成全选/全不选功能
		$("#check_all").click(function(){
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		// .check_item
		$(document).on("click",".check_item",function(){
			//判断当前选择中的元素是否8个
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		
		//点击全部删除，就批量删除
		$("#emp_delete_all_btn").click(function(){
			//判断选则框是否选中
			if($(".check_item").prop("checked") == false){
				return false
			}
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				//组装员工id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
				//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			// 弹出是否确认删除模态窗口
			$("#empDeleteAllModel").modal({
				backdrop:"static" 
			});	
			
			//点击确认按钮发送ajax请求
			$("#emp_deleteAll_but").click(function(){
				//发送ajax请求删除
				$.ajax({
					url:"${path}/emp/"+del_idstr,
					type:"DELETE",
					success:function(result){
						//1、关闭对话框
						$("#empDeleteAllModel").modal("hide");
						//回到当前页面
						to_page(currentPage);
					}
				});
			});	
		});
			
		</script>
</body>
</html>
