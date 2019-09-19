package edu.seu.model;

public class QueryResult {
    private Integer id;
    private Integer userID;        //上传者ID
    private String userName;      //上传者用户名
    private String type;          //园区类型
    private Double goal;          //目标层得分
    private Boolean isPassed;     //是否通过上传申请
    private String feedback;      //反馈信息

    public QueryResult(){

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getGoal() {
        return goal;
    }

    public void setGoal(Double goal) {
        this.goal = goal;
    }

    public Boolean getResult() {
        return isPassed;
    }

    public void setResult(Boolean result) {
        this.isPassed = result;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
