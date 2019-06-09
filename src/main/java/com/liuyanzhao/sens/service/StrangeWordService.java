package com.liuyanzhao.sens.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.StrangeWord;
import com.liuyanzhao.sens.entity.Word;

import java.util.List;

/**
 * <pre>
 *     生词逻辑接口
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
public interface StrangeWordService {

    /**
     * 新增/修改生词
     *
     * @param strangeWord strangeWord
     * @return StrangeWord
     */
    StrangeWord saveByStrangeWord(StrangeWord strangeWord);

    /**
     * 根据编号删除
     *
     * @return StrangeWord
     */
    void removeByStrangeWordId(Long wordId, Long userId);



    /**
     * 根据编号查询单个权限
     *
     * @param strangeWordId strangeWordId
     * @return StrangeWord
     */
    StrangeWord findByStrangeWordId(Long strangeWordId);


    /**
     * 获得所有的生词
     *
     * @return 生词列表
     */
    List<StrangeWord> findAll();


    /**
     * 获得某个用户的生词
     * @param page
     * @return
     */
    Page<Word> findAll(Long userId, Page<Word> page);

}
