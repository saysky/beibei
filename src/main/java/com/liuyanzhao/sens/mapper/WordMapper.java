package com.liuyanzhao.sens.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.liuyanzhao.sens.entity.Word;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author liuyanzhao
 */
@Mapper
public interface WordMapper extends BaseMapper<Word> {

    /**
     * 查询所有
     *
     * @return 词汇列表
     */
    List<Word> findAll(@Param("keywords") String keywords, Pagination page);

    /**
     * 获得没有完成的首个词汇
     *
     * @param userId
     * @return
     */
    Word getNotFinishWord(Long userId);

    /**
     * 获得没有阅读的首个词汇
     * @param userId
     * @return
     */
    Word getNotReadWord(Long userId);

    /**
     * 获得随机的单词
     * @param limit
     * @return
     */
    List<Word> getRandomWords(Integer limit);

    /**
     * 获得下一个单词
     * @param wordId
     * @return
     */
    Word getNextWord(Long wordId);

}

