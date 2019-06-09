package com.liuyanzhao.sens.web.controller.admin;

import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.base.Strings;
import com.liuyanzhao.sens.entity.*;
import com.liuyanzhao.sens.model.dto.JsonResult;
import com.liuyanzhao.sens.model.dto.LogsRecord;
import com.liuyanzhao.sens.model.dto.SensConst;
import com.liuyanzhao.sens.model.dto.UserToken;
import com.liuyanzhao.sens.model.enums.*;
import com.liuyanzhao.sens.service.*;
import com.liuyanzhao.sens.utils.LocaleMessageUtil;
import com.liuyanzhao.sens.utils.Md5Util;
import com.liuyanzhao.sens.utils.Response;
import com.liuyanzhao.sens.web.controller.core.BaseController;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.HtmlUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.lang.management.*;
import java.util.*;

/**
 * <pre>
 *     后台首页控制器
 * </pre>
 *
 * @author : saysky
 * @date : 2017/12/5
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private WordService wordService;

    @Autowired
    private RecordService recordService;

    @Autowired
    private LogService logService;

    @Autowired
    private UserRoleRefService userRoleRefService;


    @Autowired(required = false)
    private HttpServletRequest request;


    @Autowired
    private AttachmentService attachmentService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private LocaleMessageUtil localeMessageUtil;

    /**
     * 请求后台页面
     *
     * @param model model
     * @return 模板路径admin/admin_index
     */
    @GetMapping(value = {"", "/index"})
    public String index(Model model) {

        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        if (subject.hasRole("admin")) {
            model.addAttribute("userCount", userService.getCount());
            model.addAttribute("attachmentCount", attachmentService.getCount());
            model.addAttribute("wordCount", feedbackService.getCount());
            model.addAttribute("feedbackCount", feedbackService.getCount());
        } else {
            model.addAttribute("finishToday", recordService.countFinishToday(user.getUserId()));
            model.addAttribute("planToday", user.getPlanCount());
            model.addAttribute("finishAll", recordService.countFinish(user.getUserId()));
            model.addAttribute("wordAll", wordService.getCount());
        }
        return "admin/admin_index";
    }

    /**
     * 处理跳转到登录页的请求
     *
     * @return 模板路径admin/admin_login
     */
    @GetMapping(value = "/login")
    public String login() {
        Subject subject = SecurityUtils.getSubject();
        //如果已经登录，跳转到后台首页
        if (subject.isAuthenticated()) {
            return "redirect:/admin";
        }
        return "admin/admin_login";
    }

    /**
     * 验证登录信息
     *
     * @param loginName 登录名：邮箱／用户名
     * @param loginPwd  loginPwd 密码
     * @return JsonResult JsonResult
     */
    @PostMapping(value = "/getLogin")
    @ResponseBody
    public JsonResult getLogin(@ModelAttribute("loginName") String loginName,
                               @ModelAttribute("loginPwd") String loginPwd) {

        Subject subject = SecurityUtils.getSubject();
        UserToken token = new UserToken(loginName, loginPwd, LoginType.NORMAL.getDesc());
        try {
            subject.login(token);
            if (subject.isAuthenticated()) {
                //登录成功，修改登录错误次数为0
                User user = (User) subject.getPrincipal();
                userService.updateUserLoginNormal(user);

                logService.saveByLog(new Log(LogsRecord.LOGIN, LogsRecord.LOGIN_SUCCESS + "[" + user.getUserName() + "]", ServletUtil.getClientIP(request), DateUtil.date()));
                return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), localeMessageUtil.getMessage("code.admin.login.success"));
            }
        } catch (UnknownAccountException e) {
            log.info("UnknownAccountException -- > 账号不存在：");
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.login.user.not.found"));
        } catch (IncorrectCredentialsException e) {
            //更新失败次数
            User user;
            if (Validator.isEmail(loginName)) {
                user = userService.findByEmail(loginName);
            } else {
                user = userService.findByUserName(loginName);
            }
            if (user != null) {
                Integer errorCount = userService.updateUserLoginError(user);
                //超过五次禁用账户
                if (errorCount >= CommonParamsEnum.FIVE.getValue()) {
                    userService.updateUserLoginEnable(user, TrueFalseEnum.FALSE.getDesc());
                }
                logService.saveByLog(
                        new Log(
                                LogsRecord.LOGIN,
//                                LogsRecord.LOGIN_ERROR + "[" + HtmlUtil.escape(loginName) + "," + HtmlUtil.escape(loginPwd) + "]",
                                LogsRecord.LOGIN_ERROR + "[" + HtmlUtil.escape(loginName) + "]",
                                ServletUtil.getClientIP(request),
                                DateUtil.date()
                        )
                );
                Object[] args = {(5 - errorCount) > 0 ? (5 - errorCount) : 0};
                return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.login.failed", args));
            }
        } catch (LockedAccountException e) {
            log.info("LockedAccountException -- > 账号被锁定");
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), e.getMessage());
        } catch (Exception e) {
            log.info(e.getMessage());
        }
        return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.common.query-failed"));
    }

    /**
     * 处理跳转到登录页的请求
     *
     * @return 模板路径admin/admin_login
     */
    @GetMapping(value = "/register")
    public String register() {
        Subject subject = SecurityUtils.getSubject();
        //如果已经登录，跳转到后台首页
        if (subject.isAuthenticated()) {
            return "redirect:/admin";
        }
        return "admin/admin_register";
    }


    /**
     * 验证注册信息
     *
     * @param userName  用户名
     * @param userEmail 邮箱
     * @return JsonResult JsonResult
     */
    @PostMapping(value = "/getRegister")
    @ResponseBody
    public JsonResult getRegister(@ModelAttribute("userName") String userName,
                                  @ModelAttribute("userPass") String userPass,
                                  @ModelAttribute("userEmail") String userEmail) {
        if (StringUtils.equals(SensConst.OPTIONS.get(BlogPropertiesEnum.OPEN_REGISTER.getProp()), TrueFalseEnum.FALSE.getDesc())) {
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.register.close"));
        }
        //1.检查用户名
        User checkUser = userService.findByUserName(userName);
        if (checkUser != null) {
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.user.user-name-exist"));
        }
        //2.检查用户名
        User checkEmail = userService.findByEmail(userEmail);
        if (checkEmail != null) {
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.user.user-email-exist"));
        }
        //3.创建用户
        User user = new User();
        user.setUserName(userName);
        user.setUserDisplayName(userName);
        user.setUserEmail(userEmail);
        user.setLoginEnable(TrueFalseEnum.TRUE.getDesc());
        user.setLoginError(0);
        user.setUserPass(userPass);
        user.setUserAvatar("/static/images/avatar/" + RandomUtils.nextInt(1, 41) + ".jpeg");
        user.setStatus(UserStatusEnum.NORMAL.getCode());
        Response<User> response = userService.saveByUser(user);
        if (!response.isSuccess()) {
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), response.getMessage());
        }

        //4.关联角色
        String defaultRole = SensConst.OPTIONS.get(BlogPropertiesEnum.DEFAULT_REGISTER_ROLE.getProp());
        Role role = null;
        if (!Strings.isNullOrEmpty(defaultRole)) {
            role = roleService.findByRoleName(defaultRole);
        }
        if (role == null) {
            role = roleService.findByRoleName(RoleEnum.USER.getDesc());
        }
        if (role != null) {
            userRoleRefService.saveByUserRoleRef(new UserRoleRef(user.getUserId(), role.getId()));
        }

        logService.saveByLog(new Log(LogsRecord.REGISTER, user.getUserName(), ServletUtil.getClientIP(request), DateUtil.date()));
        return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), localeMessageUtil.getMessage("code.admin.register.success"));
    }

    /**
     * 处理跳转忘记密码的请求
     *
     * @return 模板路径admin/admin_login
     */
    @GetMapping(value = "/forget")
    public String forget() {
        Subject subject = SecurityUtils.getSubject();
        //如果已经登录，跳转到后台首页
        if (subject.isAuthenticated()) {
            return "redirect:/admin";
        }
        return "admin/admin_forget";
    }

    /**
     * 处理忘记密码
     *
     * @param userName  用户名
     * @param userEmail 邮箱
     * @return JsonResult
     */
    @PostMapping(value = "/getForget")
    @ResponseBody
    public JsonResult getForget(@ModelAttribute("userName") String userName,
                                @ModelAttribute("userEmail") String userEmail) {

        try {
            User user = userService.findByUserName(userName);
            if (user != null && Objects.equals(user.getUserEmail(), userEmail)) {
                //验证成功，将密码由邮件方法发送给对方
                //1.修改密码
                String password = RandomStringUtils.randomNumeric(8);
                userService.updatePassword(user.getUserId(), Md5Util.toMd5(password, "sens", 10));
                //2.发送邮件
                if (StringUtils.equals(SensConst.OPTIONS.get(BlogPropertiesEnum.SMTP_EMAIL_ENABLE.getProp()), TrueFalseEnum.TRUE.getDesc())) {
                    Map<String, Object> map = new HashMap<>(8);
                    map.put("blogTitle", SensConst.OPTIONS.get(BlogPropertiesEnum.BLOG_TITLE.getProp()));
                    map.put("blogUrl", SensConst.OPTIONS.get(BlogPropertiesEnum.BLOG_URL.getProp()));
                    map.put("password", password);
                } else {
                    return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.smtp-not-enable"));
                }
            } else {
                return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.forget.username-email-invalid"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), localeMessageUtil.getMessage("code.admin.common.operation-failed"));
        }
        return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), localeMessageUtil.getMessage("code.admin.forget.password-send-mailbox"));
    }

    /**
     * 退出登录
     *
     * @return 重定向到/admin/login
     */
    @GetMapping(value = "/logOut")
    public String logOut() {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        subject.logout();

        logService.saveByLog(new Log(LogsRecord.LOGOUT, user.getUserName(), ServletUtil.getClientIP(request), DateUtil.date()));
        log.info("用户[{}]退出登录", user.getUserName());
        return "redirect:/admin/login";
    }


}
