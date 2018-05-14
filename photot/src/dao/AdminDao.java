package dao;

import domain.Admin;

public interface AdminDao extends BaseDao<Admin> {
    Admin getUserByUsername(String admin_code);
}
