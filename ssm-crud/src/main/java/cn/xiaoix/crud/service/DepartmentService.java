package cn.xiaoix.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xiaoix.crud.beans.Department;
import cn.xiaoix.crud.dao.DepartmentMapper;


@Service
public class DepartmentService {

	@Autowired
	DepartmentMapper departmentMapper;
	
	/**
	 * 查询所有部门信息
	 * @return
	 */
	public List<Department> getDepts() {
		List<Department> example = departmentMapper.selectByExample(null);
		return example;
	}

	
	
}
