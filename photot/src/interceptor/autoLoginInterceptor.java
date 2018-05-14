package interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import domain.Admin;
import org.apache.struts2.ServletActionContext;
import service.AdminService;
import service.AdminServiceImpl;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class autoLoginInterceptor extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String, Object> session = ActionContext.getContext().getSession();
        String Admin_code=null;
        String Admin_password=null;

        Cookie[] cookies = request.getCookies();
        if (cookies!=null){
        for (Cookie cookie:cookies) {
            if("Admin_code".equals(cookie.getName())){
                Admin_code=cookie.getValue();
            }
            if("Admin_password".equals(cookie.getName())){
                Admin_password=cookie.getValue();
            }
        }
            if (Admin_password != null && Admin_code != null) {
                AdminService adminService=new AdminServiceImpl();
                Admin admin=new Admin();
                admin.setAdmin_code(Admin_code);
                admin.setAdmin_password(Admin_password);

                Admin admin1 = adminService.getUserByCodePassword(admin);
                session.put("admin", admin1);
            }
        }

        return actionInvocation.invoke();
    }
}
