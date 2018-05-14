package web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import domain.Admin;
import domain.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import service.AdminService;
import service.UserService;
import utils.PageBean;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class AdminAction extends ActionSupport implements ModelDriven<Admin> {
    private Admin a=new Admin();
    private AdminService adminService;
    private String autoLogin;
    private String checkCode;
    private String new_Admin_password;

    private String photoFileName;
    private String photoContentType;
    private File photo;




    //    登录
    public String login() throws Exception {
        if(a.getAdmin_phone()==null){



//        //            使用MD5加密
//        u.setUser_password(MD5Utils.md5(u.getUser_password()));
        Admin admin = adminService.getUserByCodePassword(a);

      /*  String session_checkCode = (String) ServletActionContext.getContext().getSession().get("checkCode");

        if (!session_checkCode.equals(checkCode)){
            throw new RuntimeException("验证码不正确");
        }
        */

        if (autoLogin!=null){
            Cookie cookie_code = new Cookie("Admin_code", admin.getAdmin_code());
            Cookie cookie_password = new Cookie("Admin_password", admin.getAdmin_password());
            cookie_code.setMaxAge(60*60);
            cookie_password.setMaxAge(60*60);

            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();


            cookie_code.setPath(request.getContextPath());
            cookie_password.setPath(request.getContextPath());

            response.addCookie(cookie_code);
            response.addCookie(cookie_password);
        }

        ActionContext.getContext().getSession().put("admin", admin);
        return "toHome";
//        注册
        }else {
            if(photo!=null){
                InputStream is=new FileInputStream(photo);
                String images = "/images";
                String realPath = ServletActionContext.getServletContext().getRealPath(images);
                OutputStream os=new FileOutputStream(realPath+"\\"+photoFileName);
                byte buffer[]=new byte[1024];
                int cnt=0;
                while((cnt=is.read(buffer))>0){
                    os.write(buffer, 0, cnt);
                }
            String admin_photo="images/"+photoFileName;
//            Admin_photo=realPath+"\\"+photoFileName;
//            Admin_photo=Admin_photo.replaceAll("\\\\","/");
                a.setAdmin_photo(admin_photo);
                os.close();
                is.close();
            }
            adminService.save(a);
            return "toLogin";
        }
    }

    //注销
    public String cancelLogin() throws Exception {
//        清除session中的用户
        ActionContext.getContext().getSession().clear();

/*        清除Cookie中的自动登录
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
        */


        return "toLogin";
    }

    //获取个人资料
    public String getAdmin() throws Exception {
        return "toPersonal";
    }

    //    修改信息
    public String update() throws Exception {
        String Admin_photo=null;
//            System.out.println("文件名称:"+photoFileName);
//            System.out.println("文件类型:"+photoContentType);
//            //将上传文件保存到指定位置
//            photo.renameTo(new File("E:/迅雷影音/haha.jpg"));
//        文件上传
        if(photo!=null){
            InputStream is=new FileInputStream(photo);
            String images = "/images";
            String realPath = ServletActionContext.getServletContext().getRealPath(images);
            OutputStream os=new FileOutputStream(realPath+"\\"+photoFileName);
            byte buffer[]=new byte[1024];
            int cnt=0;
            while((cnt=is.read(buffer))>0){
                os.write(buffer, 0, cnt);
            }
            Admin_photo="images/"+photoFileName;
//            Admin_photo=realPath+"\\"+photoFileName;
//            Admin_photo=Admin_photo.replaceAll("\\\\","/");
            os.close();
            is.close();
        }
//        更新Admin
        adminService.update(a,Admin_photo);
//        再把更新过后的Admin放入 Session域中
        Admin admin=adminService.getById(a.getAdmin_id());
        ActionContext.getContext().getSession().put("admin", admin);

        return "toHome";
    }
    //    修改密码
    public String updateCode() throws Exception {
        adminService.updateCode(a,checkCode,new_Admin_password);
        return "toLogin";
    }



    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @Override
    public Admin getModel() {
        return a;
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

    public String getNew_Admin_password() {
        return new_Admin_password;
    }

    public void setNew_Admin_password(String new_Admin_password) {
        this.new_Admin_password = new_Admin_password;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }

    public String getPhotoContentType() {
        return photoContentType;
    }

    public void setPhotoContentType(String photoContentType) {
        this.photoContentType = photoContentType;
    }

    public File getPhoto() {
        return photo;
    }

    public void setPhoto(File photo) {
        this.photo = photo;
    }
}


