package dao;

import domain.Admin;
import domain.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;

public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao  {
    @Override
    public Admin getUserByUsername(String admin_code) {
        //        HQL
        return getHibernateTemplate().execute(new HibernateCallback<Admin>(){
            @Override
            public Admin doInHibernate(Session session) throws HibernateException {
                String hql = "from Admin where Admin_code=?";
                Query query = session.createQuery(hql);
                query.setParameter(0, admin_code);
                Admin admin = (Admin) query.uniqueResult();
                return admin;
            }
        });
    }
}
