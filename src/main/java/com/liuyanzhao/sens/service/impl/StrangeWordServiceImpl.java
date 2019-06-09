package com.liuyanzhao.sens.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.StrangeWord;
import com.liuyanzhao.sens.entity.Word;
import com.liuyanzhao.sens.mapper.StrangeWordMapper;
import com.liuyanzhao.sens.service.StrangeWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 *     词汇业务逻辑实现类
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
@Service
public class StrangeWordServiceImpl implements StrangeWordService {


    @Autowired(required = false)
    private StrangeWordMapper strangeWordMapper;


    @Override
    public StrangeWord saveByStrangeWord(StrangeWord strangeWord) {
        if (strangeWord != null && strangeWord.getId() != null) {
            strangeWordMapper.updateById(strangeWord);
        } else {
            //判断是否存在
            Map<String, Object> map = new HashMap<>(2);
            map.put("user_id", strangeWord.getUserId());
            map.put("word_id", strangeWord.getWordId());
            List<StrangeWord> strangeWords = strangeWordMapper.selectByMap(map);
            if (strangeWords == null || strangeWords.size() == 0) {
                strangeWordMapper.insert(strangeWord);
            }
        }
        return strangeWord;
    }


    @Override
    public StrangeWord findByStrangeWordId(Long strangeWordId) {
        return strangeWordMapper.selectById(strangeWordId);
    }

    @Override
    public List<StrangeWord> findAll() {
        return strangeWordMapper.selectList(null);
    }


    @Override
    public void removeByStrangeWordId(Long wordId, Long userId) {
        Map<String, Object> map = new HashMap<>(2);
        map.put("wordId", wordId);
        map.put("userId", userId);
        strangeWordMapper.deleteByMap(map);
    }


    @Override
    public Page<Word> findAll(Long userId, Page<Word> page) {
        return page.setRecords(strangeWordMapper.findAll(userId, page));
    }


}
