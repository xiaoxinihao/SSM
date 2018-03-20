package cn.xiaoix.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xiaoix.crud.beans.Employee;
import cn.xiaoix.crud.service.EmployeeService;
import cn.xiaoix.crud.utils.Msg;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeSer;
	
	
	
	
	
	/**
	 * 
	 * 单个删除和批量删除 二合一的方法
	 *  批量删除  id 之间使用 - 分割
	 * @param ids
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg delEmp(@PathVariable("ids") String ids){
		//批量删除
		if(ids.contains("-")){
			//定义list集合组装批量删除的id
			List<Integer> del_id = new ArrayList<>();	
			String[] ste_id = ids.split("-");
			for (String string : ste_id) {
				del_id.add(Integer.parseInt(string));
			}
			employeeSer.deleteBatch(del_id);	
		}else{
			Integer id = Integer.parseInt(ids);
			employeeSer.deleteEmp(id);	
		}
		return Msg.success();
	}
	
	
	/**
	 * AJAX发送PUT请求：
	 * 		PUT请求，请求体中的数据，request.getParameter("empName")拿不到
	 * 		Tomcat一看是PUT不会封装请求体中的数据为map，只有POST形式的请求才封装请求体为map
	 * 
	 * 解决办法
	 * 1、配置上HttpPutFormContentFilter；
	 * 2、他的作用；将请求体中的数据解析包装成一个map。
	 * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
	 * 
	 * 更新的方法
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(Employee employee){
		employeeSer.updateEmp(employee);
		return Msg.success();
	}
	
	
	/**
	 * 查询单个用户信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public Msg getEmp(@PathVariable("id") Integer id){
		Employee employee  = employeeSer.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
	/**
	 * 验证用户是否存在
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/change")
	public Msg checkUser(@RequestParam("empName") String empName){

	String verify="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
	
	if(!empName.matches(verify)){
		return Msg.fail().add("va_msg", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
	}
	
	//验证数据库
	Boolean b = employeeSer.checkUser(empName);
	if(b){
		return Msg.success();
	}else{
		return Msg.fail().add("va_msg", "用户名以存在");
		}
	}

	/**
	 * 保存员工的方法
	 * 使用后端JSR303 验证
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result){
		if(result.hasErrors()){
			
			Map<String,Object> map = new HashMap<String,Object>();
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorField", map);
		}else{
			employeeSer.saveEmp(employee);
			return Msg.success();
		}	
	}
	
	
	/**
	 * 
	 * 导入jackson包。
	 * @ResponseBody
	 * 封装成json
	 * 
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsJosn(@RequestParam(value="pn",defaultValue="1") Integer pn){
		//使用PageHelper 插件完成分页查询
		PageHelper.startPage(pn,7);
		//	startPage 后面紧跟的就是一个分页查询
		List<Employee> emps	 = employeeSer.getAll();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo",page);
	}
	
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")
		Integer pn,Model model){
	//使用PageHelper 插件完成分页查询
	PageHelper.startPage(pn,5);
	//	startPage 后面紧跟的就是一个分页查询
	List<Employee> emps	 = employeeSer.getAll();
	// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
	// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
	PageInfo page = new PageInfo(emps, 5);
	model.addAttribute("pageInfo", page);
		return "list";	
	}
}
