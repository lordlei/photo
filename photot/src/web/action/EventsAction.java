package web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import domain.Admin;
import domain.Photo_events;
import domain.User;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import service.EventsService;
import utils.PageBean;

public class EventsAction extends ActionSupport implements ModelDriven<Photo_events> {
    private Photo_events photo_events=new Photo_events();
    private Integer currentPage;
    private Integer pageSize;
    private EventsService eventsService;
    private String[] check_id;
    private String[] event_ids;



//列表
    public String list() throws Exception {
        //封装离线查询对象
        DetachedCriteria dc = DetachedCriteria.forClass(Photo_events.class);
        //判断并封装参数
       if(StringUtils.isNotBlank(photo_events.getEvent_detail())){
           dc.add(Restrictions.like("event_detail", "%"+photo_events.getEvent_detail()+"%"));
        }
        //1 调用Service查询分页数据(PageBean)
        PageBean pb = eventsService.getPageBean(dc,currentPage,pageSize);

        //2 将PageBean放入request域,转发到列表页面显示
        ActionContext.getContext().put("pageBean", pb);

        return "list";
    }
//审核
    public String check() throws Exception {
        Photo_events pe=eventsService.getById(photo_events.getEvent_id());
        pe.setEvent_check("1");
        eventsService.update(pe);
        return "toList";
    }
//    统一审核
    public String checks() throws Exception {
        if (check_id != null) {
            for (String check : check_id) {
                Photo_events pe=eventsService.getById(Long.parseLong(check));
                pe.setEvent_check("1");
                eventsService.update(pe);
            }
        }
    return "toList";
}
//按钮进入回复
    public String replyButton() throws Exception {
        if (check_id != null) {
            for (String check : check_id) {
                Photo_events pe=eventsService.getById(Long.parseLong(check));

                ActionContext.getContext().put("events",pe);
            }
        }
        return "reply";
    }
//进入回复
    public String reply() throws Exception {
        Photo_events pe=eventsService.getById(photo_events.getEvent_id());

        ActionContext.getContext().put("events",pe);

        return "reply";

}
//接收评论
    public String setComment() throws Exception {
        Photo_events pe=eventsService.getById(photo_events.getEvent_id());

        pe.setEvent_comment(photo_events.getEvent_comment());
        eventsService.update(pe);
        return "toList";



    }
//    删除事件
    public String delete() throws Exception {
        if (check_id != null) {
            for (String check : check_id) {
                eventsService.delete(Long.parseLong(check));
            }
        }
        return "toList";

    }
//添加事件
    public String adds() throws Exception {
        eventsService.save(photo_events);
        return "toHome";
    }




    public String[] getEvent_ids() {
        return event_ids;
    }

    public void setEvent_ids(String[] event_ids) {
        this.event_ids = event_ids;
    }

    public String[] getCheck_id() {
        return check_id;
    }

    public void setCheck_id(String[] check_id) {
        this.check_id = check_id;
    }

    @Override
    public Photo_events getModel() {
        return photo_events;
    }

    public void setEventsService(EventsService eventsService) {
        this.eventsService = eventsService;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
