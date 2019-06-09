package com.liuyanzhao.sens.web.controller.admin;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.StrangeWord;
import com.liuyanzhao.sens.entity.User;
import com.liuyanzhao.sens.entity.Word;
import com.liuyanzhao.sens.model.dto.JsonResult;
import com.liuyanzhao.sens.model.enums.ResultCodeEnum;
import com.liuyanzhao.sens.service.StrangeWordService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;


/**
 * <pre>
 *     后台生词管理控制器
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/strange")
@RequiresRoles("user")
public class StrangeWordController {

    @Autowired
    private StrangeWordService strangeWordService;

    /**
     * 查询所有生词并渲染strangeWord页面
     *
     * @return 模板路径admin/admin_strangeWord
     */
    @GetMapping
    public String strangeWords(@RequestParam(value = "page", defaultValue = "0") Integer page,
                                      @RequestParam(value = "size", defaultValue = "10") Integer size, Model model) {
        //生词列表
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();

        Page pageable = new Page(page, size);
        Page<Word> words = strangeWordService.findAll(user.getUserId(), pageable);
        model.addAttribute("words", words);
        return "admin/admin_strangeWord";
    }


    /**
     * 新增/修改生词
     *
     * @param wordId 单词ID
     * @return 重定向到/admin/strangeWord
     */
    @PostMapping(value = "/save")
    @ResponseBody
    public JsonResult saveStrangeWord(@RequestParam("wordId") Long wordId) {
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "请先登录！");
        }
        User user = (User) subject.getPrincipal();

        StrangeWord strangeWord = new StrangeWord();
        strangeWord.setUserId(user.getUserId());
        strangeWord.setWordId(wordId);
        strangeWord.setCreateTime(new Date());
        try {
            strangeWordService.saveByStrangeWord(strangeWord);
        } catch (Exception e) {
            log.error("收藏生词失败：{}", e.getMessage());
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "收藏失败");

        }
        return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), "收藏成功，在后台生词本可以查看");
    }

    /**
     * 删除生词
     *
     * @param id 生词Id
     * @return JsonResult
     */
    @PostMapping(value = "/remove")
    @ResponseBody
    public JsonResult delete(@RequestParam("id") Long id) {
        try {
            Subject subject = SecurityUtils.getSubject();
            User user = (User) subject.getPrincipal();
            strangeWordService.removeByStrangeWordId(id, user.getUserId());
        } catch (Exception e) {
            log.error("删除生词失败：{}", e.getMessage());
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "移除失败");
        }
        return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), "移除成功");
    }
}
