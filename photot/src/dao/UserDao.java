package dao;

import domain.User;

public interface UserDao extends BaseDao<User> {
    User getUserByUsername(String username);

    void save(User user);
}
