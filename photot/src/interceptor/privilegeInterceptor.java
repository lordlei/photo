package interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import domain.Admin;
import domain.User;

import java.util.Map;

public class privilegeInterceptor extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        Admin admin = (Admin) session.get("admin");
        if(admin!=null){
            return actionInvocation.invoke();
        }else{
            return "toLogin";
        }
    }
}
