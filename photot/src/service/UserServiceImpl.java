package service;

import dao.UserDao;
import domain.User;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import utils.PageBean;

import java.util.List;

@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
public class UserServiceImpl implements UserService {
    private UserDao ud;

    public void setUd(UserDao ud) {
        this.ud = ud;
    }

    @Override
    public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
//        调用Dao查询总记录数

        Integer totalCount=ud.getTotalCount(dc);
//      创建pageBean对象
        PageBean pageBean = new PageBean(currentPage, totalCount, pageSize);
//        调用Dao查询分页列表数据
        List<User> list=ud.getPageList(dc, pageBean.getStart(), pageBean.getPageSize());
////
        pageBean.setList(list);

        return pageBean;
    }

    @Override
    public User getUserByCodePassword(User user) {
        User u = ud.getUserByUsername(user.getUser_code());
        if(u==null){
            throw new RuntimeException("该用户名不存在");
        }
        if(!u.getUser_password().equals(user.getUser_password())){
            throw new RuntimeException("密码错误");
        }
        return u;
    }

    @Override
    public void saveUser(User u) {
        //1 调用Dao根据注册的登陆名获得用户对象
        User existU = ud.getUserByUsername(u.getUser_code());
        if(existU!=null){
            //2 如果获得到user对象,用户名已经存在,抛出异常
            throw new RuntimeException("用户名已经存在!");
        }
        //使用MD5对密码进行加密
//        u.setUser_password(MD5Utils.md5(u.getUser_password()));
        //3 调用Dao执行保存
        ud.save(u);
    }

    @Override
    public void delete(long l) {
        ud.delete(l);
    }

    @Override
    public void save(User user) {
        ud.save(user);
    }


}
