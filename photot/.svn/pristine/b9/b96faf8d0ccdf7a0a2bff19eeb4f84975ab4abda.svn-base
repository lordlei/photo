package service;

import domain.Customer;
import org.hibernate.criterion.DetachedCriteria;
import utils.PageBean;

public interface CustomerService {
    PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize);

    void save(Customer customer);
}
