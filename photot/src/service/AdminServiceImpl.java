package service;

import com.opensymphony.xwork2.ActionContext;
import dao.AdminDao;
import domain.Admin;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao;
    @Override
    public Admin getUserByCodePassword(Admin a) {
        Admin admin = adminDao.getUserByUsername(a.getAdmin_code());
        if(admin==null){
            throw new RuntimeException("该用户名不存在");
        }
        if(!admin.getAdmin_password().equals(a.getAdmin_password())){
            throw new RuntimeException("密码错误");
        }
        return admin;
    }

    @Override
    public void update(Admin a, String admin_photo) {
        Admin admin=adminDao.getById(a.getAdmin_id());
        if (admin_photo!=null&&!admin_photo.equals("")){
            admin.setAdmin_photo(admin_photo);
        }
        admin.setAdmin_name(a.getAdmin_name());
        admin.setAdmin_mobile(a.getAdmin_mobile());
        admin.setAdmin_phone(a.getAdmin_phone());
        admin.setAdmin_section(a.getAdmin_section());
        admin.setAdmin_job(a.getAdmin_job());
        adminDao.update(admin);
    }

    @Override
    public Admin getById(Long admin_id) {
        Admin admin = adminDao.getById(admin_id);

        return admin;
    }

    @Override
    public void updateCode(Admin a, String c, String new_Admin_password) {
        Admin admin = (Admin) ActionContext.getContext().getSession().get("admin");
        String checkCode=(String) ActionContext.getContext().getSession().get("checkCode");
        if (!admin.getAdmin_password().equals(a.getAdmin_password())){
            throw new ArithmeticException("密码不正确");
        }
        if (!checkCode.equals(c)){
            throw new ArithmeticException("验证码不正确");
        }
        admin.setAdmin_password(new_Admin_password);
        adminDao.update(admin);
    }

    @Override
    public void save(Admin a) {
        adminDao.save(a);
    }

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }
}
