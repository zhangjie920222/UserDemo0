package gnnt.demo.user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import gnnt.demo.user.dao.UserDao;
import gnnt.demo.user.model.Page;
import gnnt.demo.user.model.User;
import gnnt.demo.user.service.UserService;
public class UserServiceImpl implements UserService{
	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	private UserDao userDao;
    //list user
	@Override
	public Page listUser(String username, String gender, String interest,
			int departno, String fromtime, String totime, int pagenum,
			int pagesize) {
		Page page = new Page();
	    page = userDao.listUser(username,gender, interest,departno,  fromtime,totime, pagenum,pagesize);
		int totalsize = userDao.findTotalNum(username, gender, interest, departno, fromtime, totime, pagenum, pagesize);
		int totalNum=0;
		int pageSize= page.getPageSize();
		if(totalsize%pageSize==0){
			totalNum=totalsize/pageSize;
		}else{
			totalNum=totalsize/pageSize+1;
		}
		page.setTotalPageSize(totalsize);
		page.setTotalPageNum(totalNum);
		return page;
	}
	  //添加 user
	@Override
	public int addUser(User user) {
		int n = userDao.saveOrUpdate(user);
		return n;
	}
	 //删除 user
	@Override
	public int delUser(int userid) {
		int n = userDao.delUser(userid);
		return n;
	}
	 //修改 user
	@Override
	public int modifyUser(User user) {
		int n = userDao.saveOrUpdate(user);
		return n;
	}
	 //根据id查询
	@Override
	public User findByid(int userid) {
		User user = userDao.findByid(userid);
		return user;
	}
    //注入dao
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	

}
