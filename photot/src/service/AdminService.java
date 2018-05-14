package service;

import domain.Admin;

public interface AdminService {
    Admin getUserByCodePassword(Admin a);

    void update(Admin a, String admin_photo);

    Admin getById(Long admin_id);

    void updateCode(Admin a, String checkCode, String new_Admin_password);


    void save(Admin a);

}
