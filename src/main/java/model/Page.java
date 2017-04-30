package model;

import java.util.List;
public class Page {
    private int pageSize;//每页显示的记录数
    private int currentPage;//当前页数
    private int totalPage;//总的页数
    private int totalRecord;//总记录数
    private List<StudentInfo> dataList;//学生信息列表

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setDataList(List<StudentInfo> dataList) {
        this.dataList = dataList;
    }

    public List<StudentInfo> getDataList() {
        return dataList;
    }
    public Page(int pageSize,int currentPage,int totalPage,int totalRecord,List<StudentInfo> dataList){
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.totalPage = totalPage;
        this.totalRecord = totalRecord;
        this.dataList = dataList;
    }
    public Page(int pageSize,int currentPage,List<StudentInfo> source){
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.totalPage = (int)source.size()/pageSize;
        if(source.size()%pageSize!=0){
            this.totalPage++;
        }
        this.totalRecord = source.size();
        int fromIndex = (this.currentPage-1)*this.pageSize;
        int endIndex = this.currentPage*this.pageSize>source.size()?totalRecord:this.currentPage*this.pageSize;
        this.dataList = source.subList(fromIndex,endIndex);
    }
}

