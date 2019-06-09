package com.liuyanzhao.sens.web.controller.admin;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.Feedback;
import com.liuyanzhao.sens.entity.User;
import com.liuyanzhao.sens.model.dto.JsonResult;
import com.liuyanzhao.sens.model.enums.ResultCodeEnum;
import com.liuyanzhao.sens.service.FeedbackService;
import com.liuyanzhao.sens.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * <pre>
 *     后台反馈管理控制器
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/feedback")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private UserService userService;

    /**
     * 查询所有反馈并渲染feedback页面
     *
     * @return 模板路径admin/admin_feedback
     */
    @GetMapping
    @RequiresRoles("admin")
    public String feedbacks(@RequestParam(value = "page", defaultValue = "0") Integer page,
                            @RequestParam(value = "size", defaultValue = "10") Integer size,Model model) {
        //反馈列表
        Page pageable = new Page(page, size);
        Page<Feedback> feedbacks = feedbackService.findAll(pageable);
        feedbacks.getRecords().forEach(feedback -> feedback.setUser(userService.findByUserId(feedback.getUserId())));
        model.addAttribute("feedbacks", feedbacks);
        return "admin/admin_feedback";
    }


    /**
     * 删除反馈
     *
     * @param feedbackId 反馈Id
     * @return JsonResult
     */
    @PostMapping(value = "/remove")
    @ResponseBody
    @RequiresRoles("admin")
    public JsonResult delete(@RequestParam("id") Long feedbackId) {
        try {
            feedbackService.removeByFeedbackId(feedbackId);
        } catch (Exception e) {
            log.error("删除反馈失败：{}", e.getMessage());
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "删除失败");
        }
        return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), "删除成功");
    }

    /**
     * 添加反馈
     *
     * @param content 内容
     * @return JsonResult
     */
    @PostMapping(value = "/save")
    @ResponseBody
    @RequiresRoles("user")
    public JsonResult insert(@RequestParam("content") String content) {
        Feedback feedback = new Feedback();
        feedback.setContent(content);
        feedback.setCreateTime(new Date());
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        feedback.setUserId(user.getUserId());
        try {
            feedbackService.saveByFeedback(feedback);
        } catch (Exception e) {
            log.error("提交反馈失败：{}", e.getMessage());
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "提交失败");
        }
        return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), "提交成功");
    }

    
}
