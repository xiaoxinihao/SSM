package cn.xiaoix.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;








import cn.xiaoix.crud.beans.Employee;
import cn.xiaoix.crud.beans.EmployeeExample;
import cn.xiaoix.crud.beans.EmployeeExample.Criteria;
import cn.xiaoix.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	
	/**
	 * 查询所有员工的方法
	 * @return
	 */
	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}
	
	/**
	 * 保存员工的方法
	 * @return
	 */
	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);	
	}

	/**
	 * 验证用户是否存在
	 * @param empName
	 * @return
	 * 
	 * return l==0;返回 true 表示可用, 返回false 表示不可用
	 */
	public Boolean checkUser(String empName) {
		//Employee 的工具类
		EmployeeExample example = new EmployeeExample();
		
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long l = employeeMapper.countByExample(example);
		return l==0;
	}

	/**
	 * 查询单个员工信息并显示
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer id) {	
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	//修改员工信息
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	//删除单个员工
	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
	}

	//批量删除员工的方法
	public void deleteBatch(List<Integer> ids) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		//  sql语句为 delete from xxx where emp_id in();
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

	

}
