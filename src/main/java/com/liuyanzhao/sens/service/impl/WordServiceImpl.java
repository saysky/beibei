package com.liuyanzhao.sens.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.Word;
import com.liuyanzhao.sens.mapper.WordMapper;
import com.liuyanzhao.sens.service.WordService;
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
public class WordServiceImpl implements WordService {


    @Autowired(required = false)
    private WordMapper wordMapper;


    @Override
    public Word saveByWord(Word word) {
        //2.修改
        if (word != null && word.getId() != null) {
            wordMapper.updateById(word);
        } else {
            wordMapper.insert(word);
        }
        return word;
    }


    @Override
    public Word findByWordId(Long wordId) {
        return wordMapper.selectById(wordId);
    }

    @Override
    public List<Word> findAll() {
        return wordMapper.selectList(null);
    }


    @Override
    public void removeByWordId(Long wordId) {
        wordMapper.deleteById(wordId);
    }


    @Override
    public Page<Word> findAll(String keywords, Page<Word> page) {
        return page.setRecords(wordMapper.findAll(keywords, page));
    }

    @Override
    public Integer getCount() {
        return wordMapper.selectCount(null);
    }

    @Override
    public Word getNotFinishWord(Long userId) {
        return wordMapper.getNotFinishWord(userId);
    }

    @Override
    public Word getNotReadWord(Long userId) {
        return wordMapper.getNotReadWord(userId);
    }

    @Override
    public List<Word> getRandomThreeWords() {
        return wordMapper.getRandomWords(3);
    }

    @Override
    public Word getNextWord(Long wordId) {
        return wordMapper.getNextWord(wordId);
    }


}
