package gnnt.demo.user.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import gnnt.demo.user.model.Page;
import gnnt.demo.user.model.User;
import gnnt.demo.user.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven{
	private static final long serialVersionUID = 1L;
	
	private UserService userService;
	private int pagenum;
	private int pagesize;
	private User user;
	HttpServletRequest request = ServletActionContext.getRequest();
    //list员工
    public String listUser(){
    	Page page0 = new Page();
    	try {
    		String username = request.getParameter("username");
    		String gender = request.getParameter("gender");
    		String interest = request.getParameter("interest");
    		String departnos = request.getParameter("departno");
    		String pagenums = request.getParameter("pagenum");
    		String pagesizes = request.getParameter("pagesize");
    		if(pagenums!=null&&!"".equals(pagenums)){
    			pagenum = Integer.parseInt(pagenums);
    		}
    		if(pagesizes!=null&&!"".equals(pagesizes)){
    			pagesize = Integer.parseInt(pagesizes);
    		}
    		int departno=0;
    		if(departnos!=null&&!"".equals(departnos)){
    			departno =  Integer.parseInt(departnos);
    		}    		
    		String fromtime =request.getParameter("fromtime");
    		String totime =request.getParameter("totime");	
    		page0 = userService.listUser(username,gender,interest, departno,fromtime, totime, pagenum,pagesize);
    		request.setAttribute("pageinfo", page0);
    		return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
    	
	    		
    }
    //到修改员工页面
    public String toModifyUser() {
    	 String userids = request.getParameter("userid");
    	 int userid = Integer.parseInt(userids);
    	 User user = userService.findByid(userid);
         if(user!=null){ 
        	String interest = user.getInterest();
         	String[] interests = interest.split(",");
         	List<String> list = new ArrayList<String>();
         	for(String str:interests){
         		list.add(str.trim());
         	}
         	request.setAttribute("interests", list);
         	request.setAttribute("user", user);
         	return SUCCESS;
         }else{
         	return ERROR;
         }
    	

    }
    //修改员工
    public String modifyUser() {
    	int n = userService.modifyUser(user);	
        if(n>0){
    		request.setAttribute("isSuccess", "yes");
         	return SUCCESS;
         }else{
         	return ERROR;
         }

    }
    //添加员工
    public String addUser(){  
    	int n = userService.addUser(user);   	
        if(n>0){
    		request.setAttribute("isSuccess", "yes");
         	return SUCCESS;
         }else{
         	return ERROR;
         }
	
    }
    //删除员工
    public String delUser(){
        int n = userService.delUser(user.getUserId());       
        if(n>0){
        	request.setAttribute("isSuccess", "yes");
        	return SUCCESS;
        }else{
        	return ERROR;
        }
    	
    }
    //查询员工
    public String findByid(){    	
        User n = userService.findByid(9);
        if(n!=null){
        	request.setAttribute("isSuccess", "yes");
        	return SUCCESS;
        }else{
        	return ERROR;
        }
    	
    }
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public Object getModel() {
		if(user== null){
	          user = new User();
	       }
	    return user;
	}
    
}
