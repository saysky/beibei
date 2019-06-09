package com.liuyanzhao.sens.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.liuyanzhao.sens.entity.StrangeWord;
import com.liuyanzhao.sens.entity.Word;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author liuyanzhao
 */
@Mapper
public interface StrangeWordMapper extends BaseMapper<StrangeWord> {

    /**
     * 查询所有
     *
     * @return 词汇列表
     */
    List<Word> findAll(@Param("userId") Long userId, Pagination page);
}

