package service;

import dao.EventsDao;
import domain.Photo_events;
import domain.User;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import utils.PageBean;

import java.util.List;

@Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
public class EventsServiceImpl implements EventsService {
    private EventsDao eventsDao;

    @Override
    public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
        //        调用Dao查询总记录数

        Integer totalCount=eventsDao.getTotalCount(dc);
//      创建pageBean对象
        PageBean pageBean = new PageBean(currentPage, totalCount, pageSize);
//        调用Dao查询分页列表数据
        List<Photo_events> list=eventsDao.getPageList(dc, pageBean.getStart(), pageBean.getPageSize());
////
        pageBean.setList(list);

        return pageBean;
    }

    @Override
    public Photo_events getById(Long event_id) {
        Photo_events photo_events = eventsDao.getById(event_id);
        return photo_events;
    }

    @Override
    public void update(Photo_events pe) {
        eventsDao.update(pe);
    }

    @Override
    public void delete(long l) {
        eventsDao.delete(l);
    }

    @Override
    public void save(Photo_events photo_events) {
        eventsDao.save(photo_events);
    }

    public void setEventsDao(EventsDao eventsDao) {
        this.eventsDao = eventsDao;
    }
}
