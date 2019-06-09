package com.liuyanzhao.sens.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.Feedback;

import java.util.List;

/**
 * <pre>
 *     反馈逻辑接口
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
public interface FeedbackService {

    /**
     * 新增/修改词汇
     *
     * @param feedback feedback
     * @return Feedback
     */
    Feedback saveByFeedback(Feedback feedback);

    /**
     * 根据编号删除
     *
     * @param feedbackId feedbackId
     * @return Feedback
     */
    void removeByFeedbackId(Long feedbackId);

    /**
     * 根据编号查询单个权限
     *
     * @param feedbackId feedbackId
     * @return Feedback
     */
    Feedback findByFeedbackId(Long feedbackId);


    /**
     * 获得所有的词汇
     *
     * @return 词汇列表
     */
    List<Feedback> findAll();

    /**
     * 分页获取所有词汇
     *
     * @param page 分页信息
     * @return 词汇列表
     */
    Page<Feedback> findAll(Page<Feedback> page);

    Integer getCount();

}
