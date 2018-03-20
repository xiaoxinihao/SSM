package cn.xiaoix.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xiaoix.crud.beans.Department;
import cn.xiaoix.crud.dao.DepartmentMapper;
import cn.xiaoix.crud.service.DepartmentService;
import cn.xiaoix.crud.utils.Msg;


/**
 *处理和部门有关的请求 
 *
 */
@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 返回所有部门信息
	 */
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts(){
	//查出的所有数据
	List<Department> listDepts = departmentService.getDepts();
		return Msg.success().add("depts", listDepts);
	}
	
}
