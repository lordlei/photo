package utils;

import java.util.List;

public class PageBean {
//    当前页数
    private Integer currentPage;
//    总记录数
    private Integer totalCount;
//    每页显示条数
    private Integer pageSize;
//    总页数
    private Integer totalPage;
//    sdfs
//    分页列表数据
    private List list;

    public Integer getCurrentPage() {
        return currentPage;
    }
    public PageBean(Integer currentPage, Integer totalCount, Integer pageSize) {
        this.currentPage = currentPage;

        this.totalCount = totalCount;

        this.pageSize = pageSize;

        if(this.currentPage==null){
//          如果页面没有指定显示哪一页,显示第一页
            this.currentPage=1;
        }

        if(this.pageSize==null){
//            如果每页显示条数没有指定,默认每页显示3条
            this.pageSize = 5;
        }
//          计算总页数
        totalPage = (this.totalCount + this.pageSize - 1) / this.pageSize;

//        判断当前页数是否超出范围
        //不能小于1
        if(this.currentPage<1){
            this.currentPage=1;
        }
        //不能大于总页数
        if(this.currentPage>totalPage){
            this.currentPage=totalPage;
        }
    }

    public Integer getStart(){
        return (this.currentPage-1)*this.pageSize;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

}