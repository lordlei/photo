package service;

import domain.Photo_events;
import org.hibernate.criterion.DetachedCriteria;
import utils.PageBean;

public interface EventsService {


    PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize);

    Photo_events getById(Long event_id);


    void update(Photo_events pe);

    void delete(long l);

    void save(Photo_events photo_events);
}
