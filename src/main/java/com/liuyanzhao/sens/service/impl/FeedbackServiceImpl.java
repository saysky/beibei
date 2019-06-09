package com.liuyanzhao.sens.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.Feedback;
import com.liuyanzhao.sens.mapper.FeedbackMapper;
import com.liuyanzhao.sens.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <pre>
 *     词汇业务逻辑实现类
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
@Service
public class FeedbackServiceImpl implements FeedbackService {


    @Autowired(required = false)
    private FeedbackMapper feedbackMapper;


    @Override
    public Feedback saveByFeedback(Feedback feedback) {
        //2.修改
        if (feedback != null && feedback.getId() != null) {
            feedbackMapper.updateById(feedback);
        } else {
            feedbackMapper.insert(feedback);
        }
        return feedback;
    }


    @Override
    public Feedback findByFeedbackId(Long feedbackId) {
        return feedbackMapper.selectById(feedbackId);
    }

    @Override
    public List<Feedback> findAll() {
        return feedbackMapper.selectList(null);
    }


    @Override
    public void removeByFeedbackId(Long feedbackId) {
        feedbackMapper.deleteById(feedbackId);
    }


    @Override
    public Page<Feedback> findAll(Page<Feedback> page) {
        return page.setRecords(feedbackMapper.findAll(page));
    }

    @Override
    public Integer getCount() {
        return feedbackMapper.selectCount(null);
    }


}
