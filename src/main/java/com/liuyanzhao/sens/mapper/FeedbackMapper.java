package com.liuyanzhao.sens.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.liuyanzhao.sens.entity.Feedback;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/**
 * @author liuyanzhao
 */
@Mapper
public interface FeedbackMapper extends BaseMapper<Feedback> {

    /**
     * 查询所有
     *
     * @return 用户列表
     */
    List<Feedback> findAll(Pagination page);

}

