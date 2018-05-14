package domain;

public class Photo_events {
    private Long event_id;

    private String event_time;
    private String event_detail;
    private String event_place;
    private String event_check;
    private String event_image;
    private String event_comment;


    private Category event_category;
    private User event_user;


    public Long getEvent_id() {
        return event_id;
    }

    public void setEvent_id(Long event_id) {
        this.event_id = event_id;
    }

    public String getEvent_time() {
        return event_time;
    }

    public void setEvent_time(String event_time) {
        this.event_time = event_time;
    }

    public String getEvent_detail() {
        return event_detail;
    }

    public void setEvent_detail(String event_detail) {
        this.event_detail = event_detail;
    }

    public String getEvent_place() {
        return event_place;
    }

    public void setEvent_place(String event_place) {
        this.event_place = event_place;
    }

    public String getEvent_check() {
        return event_check;
    }

    public void setEvent_check(String event_check) {
        this.event_check = event_check;
    }

    public Category getEvent_category() {
        return event_category;
    }

    public void setEvent_category(Category event_category) {
        this.event_category = event_category;
    }

    public User getEvent_user() {
        return event_user;
    }

    public void setEvent_user(User event_user) {
        this.event_user = event_user;
    }

    public String getEvent_image() {
        return event_image;
    }

    public void setEvent_image(String event_image) {
        this.event_image = event_image;
    }

    public String getEvent_comment() {
        return event_comment;
    }

    public void setEvent_comment(String event_comment) {
        this.event_comment = event_comment;
    }
}
