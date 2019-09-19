package edu.seu.service;

import edu.seu.base.CodeEnum;
import edu.seu.base.PageInfo;
import edu.seu.base.Pagination;
import edu.seu.dao.LoginTicketDAO;
import edu.seu.dao.AdminDao;
import edu.seu.exceptions.COIPFDIExceptions;
import edu.seu.model.AdminHolder;
import edu.seu.model.LoginTicket;
import edu.seu.model.Admin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

@Service
public class AdminService {
    @Autowired
    private AdminDao adminDao;

    @Autowired
    private LoginTicketDAO loginTicketDAO;

    @Autowired
    private AdminHolder adminHolder;

    public void register(Admin admin, String oldEmail, String codeCaptcha, String emailCaptcha,
                           String oldCodeCaptcha, String oldEmailCaptcha) throws COIPFDIExceptions {
        checkBeforeRegister(admin, oldEmail, codeCaptcha, emailCaptcha, oldCodeCaptcha, oldEmailCaptcha);

        adminDao.persist(admin);

    }

    public String login(String nameEmail, String password, String codeCaptcha, String oldCodeCaptcha) throws COIPFDIExceptions {
        checkBeforeLogin(nameEmail, password, codeCaptcha, oldCodeCaptcha);

        Admin old1 = adminDao.selectByName(nameEmail);
        Admin old2 = adminDao.selectByEmail(nameEmail);
        Admin old = old1 != null ? old1 : old2;
        if (old == null) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "该用户名/邮箱尚未注册！(或由于管理员人数限制已被拒绝申请)");
        }
        if (!StringUtils.equals(old.getPassword(), password)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "密码错误！");
        }
        if (old.getApprovalPending() == true){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR,"您申请的管理员账户暂未被审核通过，请等待！");
        }
        return addLoginTicket(old.getId());
    }

    private void checkBeforeRegister(Admin admin, String oldEmail, String codeCaptcha, String emailCaptcha,
                                     String oldCodeCaptcha, String oldEmailCaptcha) throws COIPFDIExceptions {
        if (StringUtils.isBlank(admin.getName())) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "用户名不能为空！");
        }
        if (StringUtils.isBlank(admin.getPassword())) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "密码不能为空！");
        }
        if (StringUtils.isBlank(admin.getEmail()) || !EmailService.isMail(admin.getEmail())) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "邮箱格式错误！");
        }
        if (!StringUtils.equals(codeCaptcha, oldCodeCaptcha)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "验证码错误！");
        }
        if (!StringUtils.equals(admin.getEmail(), oldEmail)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "邮箱已更换，需要重新发送验证码！");
        }
        if (!StringUtils.equals(emailCaptcha, oldEmailCaptcha)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "邮箱验证码错误！");
        }
        Admin old = adminDao.selectByName(admin.getName());
        if (old != null) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "该用户名已被注册！");
        }
        old = adminDao.selectByEmail(admin.getEmail());
        if (old != null) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "该邮箱已被注册！");
        }

    }

    private void checkBeforeLogin(String nameEmail, String password, String codeCaptcha, String oldCodeCaptcha) throws COIPFDIExceptions {

        if (StringUtils.isBlank(nameEmail)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "用户名/邮箱不能为空！");
        }
        if (StringUtils.isBlank(password)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "密码不能为空！");
        }
        if (!StringUtils.equals(codeCaptcha, oldCodeCaptcha)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "验证码错误！");
        }
    }

    public void checkBeforeEmailCaptcha(String email, String codeCaptcha, String oldCodeCaptcha) throws COIPFDIExceptions {
        if (StringUtils.isBlank(email) || !EmailService.isMail(email)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "邮箱格式错误！");
        }
        if (!StringUtils.equals(codeCaptcha, oldCodeCaptcha)) {
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "验证码错误！");
        }
    }

    private String addLoginTicket(int userId) {
        LoginTicket ticket = new LoginTicket();
        ticket.setUserId(userId);
        Date date = new Date();
        // 一天过期
        date.setTime(date.getTime() + 3600*24*1000);
        ticket.setExpireTime(new Timestamp(date.getTime()));
        ticket.setStatus(0);
        ticket.setTicket(UUID.randomUUID().toString().replaceAll("-", ""));
        loginTicketDAO.persist(ticket);
        return ticket.getTicket();
    }

    public void logout(String ticket) {
        loginTicketDAO.updateStatus(ticket,1);
    }

    public void modifyPassword(String email, String newPassword, String confirmPassword, String codeCaptcha, String oldCodeCaptcha) throws COIPFDIExceptions {
        checkBeforeModifyPassword(email, newPassword, confirmPassword, codeCaptcha, oldCodeCaptcha);

        adminDao.updatePassword(email, newPassword);
    }

    private void checkBeforeModifyPassword(String email,String newPassword, String confirmPassword,
                                           String codeCaptcha, String oldCodeCaptcha) throws COIPFDIExceptions {

        if(StringUtils.isEmpty(email)){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "邮箱不能为空！");
        }
        if(!StringUtils.equals(newPassword, confirmPassword)){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "输入密码不一致！");
        }
        if(!StringUtils.equals(codeCaptcha, oldCodeCaptcha)){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "验证码错误");
        }
    }

    // 验证找回密码页
    public void checkBeforeFindPassword(String codeCaptcha, String oldCodeCaptcha, String emailCaptcha, String oldEmailCaptcha) throws COIPFDIExceptions {
        if(!StringUtils.equals(codeCaptcha, oldCodeCaptcha)){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "验证码错误!");
        }
        if(!StringUtils.equals(emailCaptcha, oldEmailCaptcha)){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "邮箱验证码错误!");
        }
    }

    public void checkEmail(String email) throws COIPFDIExceptions {
        Admin admin = adminDao.selectByEmail(email);
        if(admin == null){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "该邮箱尚未注册！");
        }
    }

    public void updatePassword(String oldPassword, String newPassword, String codeCaptcha,
                               String oldCodeCaptcha, String ticket) throws COIPFDIExceptions {
        Admin admin = adminHolder.getAdmin();
        if(!StringUtils.equals(admin.getPassword(), oldPassword)){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "旧密码输入有误");
        }
        if(!StringUtils.equals(codeCaptcha, oldCodeCaptcha)){
            throw new COIPFDIExceptions(CodeEnum.USER_ERROR, "验证码错误!");
        }
        adminDao.updatePassword(admin.getEmail(), newPassword);
        logout(ticket);
    }

    //分页
    public Pagination<Admin> queryAllAdmin(Integer page) {

        if (page == null) {
            page = 1;
        }
        Integer totalRow = adminDao.countAllAdmin();
        PageInfo pageInfo = new PageInfo(totalRow, page);
        List<Admin> adminList = adminDao.selectAllAdmin(pageInfo.getBeginIndex(), pageInfo.getEndIndex());
        return new Pagination<Admin>(adminList, pageInfo);
    }

    //查询所有未经批准的管理员申请以供展示
    public Pagination<Admin> queryNonAdmin(Integer page) {
        if (page == null) {
            page = 1;
        }
        Integer totalRow = adminDao.countAllNonAdmin();
        PageInfo pageInfo = new PageInfo(totalRow, page);
        List<Admin> adminList = adminDao.selectAllNonAdmin(pageInfo.getBeginIndex(), pageInfo.getEndIndex());
        return new Pagination<Admin>(adminList, pageInfo);
    }

    //处理管理员申请(true表approval,false表disapproval)
    public void dealAdminApp(int id,boolean approval){
        if(approval == true ){
            adminDao.updateApprovalState(id);
        }else{
            adminDao.deleteAdminApplication(id);
        }
    }

}
