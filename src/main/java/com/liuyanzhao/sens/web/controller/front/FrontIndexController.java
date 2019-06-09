package com.liuyanzhao.sens.web.controller.front;

import cn.hutool.http.HtmlUtil;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.base.Strings;
import com.liuyanzhao.sens.entity.*;
import com.liuyanzhao.sens.model.dto.JsonResult;
import com.liuyanzhao.sens.model.dto.SensConst;
import com.liuyanzhao.sens.model.enums.*;
import com.liuyanzhao.sens.service.*;
import com.liuyanzhao.sens.web.controller.core.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * <pre>
 *     前台首页控制器
 * </pre>
 *
 * @author : saysky
 * @date : 2018/4/26
 */
@Slf4j
@Controller
public class FrontIndexController extends BaseController {

    @Autowired
    private WordService wordService;

    @Autowired
    private RecordService recordService;

    @Autowired
    private UserService userService;


    @GetMapping(value = {"/", "/word"})
    public String index(@RequestParam(value = "keywords", required = false) String keywords,
                        @RequestParam(value = "page", defaultValue = "0") Integer page,
                        @RequestParam(value = "size", defaultValue = "20") Integer size, Model model) {
        if(keywords != null) {
            keywords = keywords.trim();
        }
        Page pageable = new Page(page, size);
        Page<Word> words = wordService.findAll(keywords, pageable);
        model.addAttribute("words", words);
        return this.render("index");
    }


    /**
     * 背诵页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "/bei")
    public String statistics(Model model) {
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
            return "redirect:/admin/login";

        }
        User user = (User) subject.getPrincipal();
        Integer planToday = user.getPlanCount();
        Integer readCount = recordService.countReadToday(user.getUserId());
        Integer finishToday = recordService.countFinishToday(user.getUserId());
        model.addAttribute("planToday", planToday);
        model.addAttribute("readCount", readCount);
        model.addAttribute("finishToday", finishToday);
        return this.render("statistics");
    }

    /**
     * 确认是否认识页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "/bei/read")
    public String read(Model model) {
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
            return "redirect:/admin/login";

        }
        User user = (User) subject.getPrincipal();

        //获得词汇
        Word word = wordService.getNotReadWord(user.getUserId());
        Integer readCount = recordService.countReadToday(user.getUserId());
        model.addAttribute("word", word);
        model.addAttribute("readCount", readCount);
        Integer planToday = user.getPlanCount();
        model.addAttribute("planToday", planToday);
        Integer finishToday = recordService.countFinishToday(user.getUserId());
        model.addAttribute("finishToday", finishToday);
        return this.render("read");
    }

    /**
     * 记录是否认识
     *
     * @return JsonResult
     */
    @PostMapping(value = "/bei/record")
    @ResponseBody
    public JsonResult record(@RequestParam("wordId") Long wordId,
                             @RequestParam("status") Integer status) {
        Word word = wordService.findByWordId(wordId);
        if (word == null) {
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "词汇不存在");
        }

        if (status != 0 && status != 1) {
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "状态不合法");
        }

        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();

        Record record = new Record();
        record.setUserId(user.getUserId());
        record.setStatus(status);
        record.setWordId(wordId);
        record.setCreateTime(new Date());
        try {
            recordService.saveByRecord(record);
        } catch (Exception e) {
            log.error("删除反馈失败：{}", e.getMessage());
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "删除失败");
        }
        return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), "删除成功");
    }

    /**
     * 词汇详情页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "/detail")
    public String detail(@RequestParam("id") Long id,
                         Model model) {
        //获得词汇
        Word word = wordService.findByWordId(id);
        if (word == null) {
            return this.renderNotFound();
        }
        if (word.getEnSentence() != null) {
            word.setEnSentence(word.getEnSentence().replace(word.getEnName(), "<span class='vocab'>" + word.getEnName() + "</span>"));
        }
        model.addAttribute("word", word);

        //下一个
        Word nextWord = wordService.getNextWord(word.getId());
        if (nextWord != null) {
            model.addAttribute("nextWord", nextWord);
        }
        return this.render("detail");
    }

    /**
     * 词汇详情页
     *
     * @param model
     * @return
     */
    @GetMapping(value = "/bei/detail")
    public String detail2(@RequestParam("id") Long id,
                          Model model) {
        //获得词汇
        Word word = wordService.findByWordId(id);
        if (word == null) {
            return this.renderNotFound();
        }
        if (word.getEnSentence() != null) {
            word.setEnSentence(word.getEnSentence().replace(word.getEnName(), "<span class='vocab'>" + word.getEnName() + "</span>"));
        }
        model.addAttribute("word", word);
        return this.render("bei_detail");
    }

    /**
     * 复习页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "/review")
    public String review(Model model) {
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
            return "redirect:/admin/login";

        }
        User user = (User) subject.getPrincipal();

        //获得词汇
        Word word = wordService.getNotFinishWord(user.getUserId());
        Integer planToday = user.getPlanCount();
        Integer finishToday = recordService.countFinishToday(user.getUserId());
        Integer readCount = recordService.countReadToday(user.getUserId());
        model.addAttribute("finishCount", finishToday);
        model.addAttribute("readCount", readCount);
        model.addAttribute("planToday", planToday);

        model.addAttribute("word", word);
        //获得随机的三个单词
        List<Word> words = wordService.getRandomThreeWords();
        Integer random = new Random().nextInt(words.size());
        words.add(random, word);

        model.addAttribute("words", words);
        return this.render("review");
    }

    /**
     * 背诵页面
     *
     * @param model
     * @return
     */
    @GetMapping(value = "/feedback")
    public String feedback(Model model) {
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
            return "redirect:/admin/login";

        }
        return this.render("feedback");
    }


}
