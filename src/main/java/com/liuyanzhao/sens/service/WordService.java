package com.liuyanzhao.sens.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.Word;

import java.util.List;

/**
 * <pre>
 *     词汇逻辑接口
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
public interface WordService {

    /**
     * 新增/修改词汇
     *
     * @param word word
     * @return Word
     */
    Word saveByWord(Word word);

    /**
     * 根据编号删除
     *
     * @param wordId wordId
     * @return Word
     */
    void removeByWordId(Long wordId);

    /**
     * 根据编号查询单个权限
     *
     * @param wordId wordId
     * @return Word
     */
    Word findByWordId(Long wordId);


    /**
     * 获得所有的词汇
     *
     * @return 词汇列表
     */
    List<Word> findAll();

    /**
     * 分页获取所有词汇
     *
     * @param page 分页信息
     * @return 词汇列表
     */
    Page<Word> findAll(String keywords, Page<Word> page);

    /**
     * 统计总数
     * @return
     */
    Integer getCount();

    /**
     * 获得当前需要背诵的词汇
     *
     * @param userId
     * @return
     */
    Word getNotFinishWord(Long userId);

    /**
     * 获得当前需要学习的词汇
     *
     * @param userId
     * @return
     */
    Word getNotReadWord(Long userId);

    /**
     * 获得随机三个单词
     * @return
     */
    List<Word> getRandomThreeWords();

    /**
     * 下一个
     * @param wordId
     * @return
     */
    Word getNextWord(Long wordId);

}
