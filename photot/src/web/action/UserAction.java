package web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import domain.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import service.UserService;
import utils.PageBean;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserAction extends ActionSupport implements ModelDriven<User> {
    private User u=new User();
    private UserService userService;
    private String autoLogin;
    private String checkCode;

    private Integer currentPage;
    private Integer pageSize;
    private String[] check_id;


    public void setUserService(UserService userService) {
        this.userService = userService;
    }


//    登录
    public String login() throws Exception {

//        //            使用MD5加密
//        u.setUser_password(MD5Utils.md5(u.getUser_password()));
       User user = userService.getUserByCodePassword(u);

      /*  String session_checkCode = (String) ServletActionContext.getContext().getSession().get("checkCode");

        if (!session_checkCode.equals(checkCode)){
            throw new RuntimeException("验证码不正确");
        }


        if (autoLogin!=null){
            Cookie cookie_code = new Cookie("user_code", user.getUser_code());
            Cookie cookie_password = new Cookie("user_password", user.getUser_password());
            cookie_code.setMaxAge(60*60);
            cookie_password.setMaxAge(60*60);

            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();


            cookie_code.setPath(request.getContextPath());
            cookie_password.setPath(request.getContextPath());

            response.addCookie(cookie_code);
            response.addCookie(cookie_password);
        }
         */
        ActionContext.getContext().getSession().put("user", user);
        return "toHome";
    }
    //注销
    public String cancelLogin() throws Exception {
//        清除session中的用户
        ActionContext.getContext().getSession().clear();

//        清除Cookie中的自动登录
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Cookie cookie_code = new Cookie("user_code", null);
        Cookie cookie_password = new Cookie("user_password", null);
        cookie_code.setMaxAge(0);
        cookie_password.setMaxAge(0);

        cookie_code.setPath(request.getContextPath());
        cookie_password.setPath(request.getContextPath());
        response.addCookie(cookie_code);
        response.addCookie(cookie_password);


        return "toLogin";
    }
//    分页
    public String list() throws Exception {
            //封装离线查询对象
            DetachedCriteria dc = DetachedCriteria.forClass(User.class);
            //判断并封装参数
            if(StringUtils.isNotBlank(u.getUser_name())){
                dc.add(Restrictions.like("user_name", "%"+u.getUser_name()+"%"));
            }
            //1 调用Service查询分页数据(PageBean)
            PageBean pb = userService.getPageBean(dc,currentPage,pageSize);

            //2 将PageBean放入request域,转发到列表页面显示
            ActionContext.getContext().put("pageBean", pb);

            return "list";
        }

    //    分页
    public String lists() throws Exception {
        //封装离线查询对象
        DetachedCriteria dc = DetachedCriteria.forClass(User.class);
        //判断并封装参数
        if(StringUtils.isNotBlank(u.getUser_name())){
            dc.add(Restrictions.like("user_name", "%"+u.getUser_name()+"%"));
        }
        //1 调用Service查询分页数据(PageBean)
        PageBean pb = userService.getPageBean(dc,currentPage,pageSize);

        //2 将PageBean放入request域,转发到列表页面显示
        ActionContext.getContext().put("pageBean", pb);

        return "lists";
    }
//        添加
    public String adminAdd() throws Exception {
        userService.save(u);
       return "toList";
}
//       删除
    public String delete() throws Exception {
        if (check_id != null) {
            for (String check : check_id) {
                userService.delete(Long.parseLong(check));
            }
        }
        return "toList";

    }








    @Override
    public User getModel() {
        return u;
    }

    public String getAutoLogin() {
        return autoLogin;
    }

    public void setAutoLogin(String autoLogin) {
        this.autoLogin = autoLogin;
    }

    public String getCheckCode() {
        return checkCode;
    }

    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String[] getCheck_id() {
        return check_id;
    }

    public void setCheck_id(String[] check_id) {
        this.check_id = check_id;
    }
}


