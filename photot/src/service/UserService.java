package service;

import domain.User;
import org.hibernate.criterion.DetachedCriteria;
import utils.PageBean;

public interface UserService {
    PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize);

    User getUserByCodePassword(User user);

    void save(User user);

    void saveUser(User u);

    void delete(long l);
}
