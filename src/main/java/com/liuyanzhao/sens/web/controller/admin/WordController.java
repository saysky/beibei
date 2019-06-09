package com.liuyanzhao.sens.web.controller.admin;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.Word;
import com.liuyanzhao.sens.model.dto.JsonResult;
import com.liuyanzhao.sens.model.enums.ResultCodeEnum;
import com.liuyanzhao.sens.service.WordService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * <pre>
 *     后台词汇管理控制器
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/word")
@RequiresRoles("admin")
public class WordController {

    @Autowired
    private WordService wordService;

    /**
     * 查询所有词汇并渲染word页面
     *
     * @return 模板路径admin/admin_word
     */
    @GetMapping
    public String words(@RequestParam(value = "page", defaultValue = "0") Integer page,
                        @RequestParam(value = "size", defaultValue = "10") Integer size, Model model) {
        //词汇列表
        Page pageable = new Page(page, size);
        Page<Word> words = wordService.findAll(null,pageable);
        model.addAttribute("words", words);
        return "admin/admin_word";
    }


    /**
     * 新增/修改词汇
     *
     * @param word word对象
     * @return 重定向到/admin/word
     */
    @PostMapping(value = "/save")
    public String saveWord(@ModelAttribute Word word) {
        try {
            wordService.saveByWord(word);
        } catch (Exception e) {
            log.error("修改词汇失败：{}", e.getMessage());
        }
        return "redirect:/admin/word";
    }

    /**
     * 删除词汇
     *
     * @param wordId 词汇Id
     * @return JsonResult
     */
    @PostMapping(value = "/remove")
    @ResponseBody
    public JsonResult delete(@RequestParam("id") Long wordId) {
        try {
            wordService.removeByWordId(wordId);
        } catch (Exception e) {
            log.error("删除词汇失败：{}", e.getMessage());
            return new JsonResult(ResultCodeEnum.FAIL.getCode(), "删除失败");
        }
        return new JsonResult(ResultCodeEnum.SUCCESS.getCode(), "删除成功");
    }


    /**
     * 跳转到修改页面
     *
     * @param wordId wordId
     * @param model  model
     * @return 模板路径admin/admin_word
     */
    @GetMapping(value = "/edit")
    public String toEditWord(Model model,
                             @RequestParam("id") Long wordId,
                             @RequestParam(value = "page", defaultValue = "0") Integer page,
                             @RequestParam(value = "size", defaultValue = "10") Integer size) {
        //词汇列表
        Page pageable = new Page(page, size);
        Page<Word> words = wordService.findAll(null,pageable);
        model.addAttribute("words", words);

        //更新的词汇
        Word word = wordService.findByWordId(wordId);
        model.addAttribute("updateWord", word);
        return "admin/admin_word";
    }
}
