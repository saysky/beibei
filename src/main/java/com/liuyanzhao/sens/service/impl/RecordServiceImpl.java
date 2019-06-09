package com.liuyanzhao.sens.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.Record;
import com.liuyanzhao.sens.mapper.RecordMapper;
import com.liuyanzhao.sens.service.RecordService;
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
public class RecordServiceImpl implements RecordService {


    @Autowired(required = false)
    private RecordMapper recordMapper;


    @Override
    public Record saveByRecord(Record record) {
        //2.修改
        if (record != null && record.getId() != null) {
            recordMapper.updateById(record);
        } else {
            recordMapper.insert(record);
        }
        return record;
    }
    

    @Override
    public Record findByRecordId(Long recordId) {
        return recordMapper.selectById(recordId);
    }

    @Override
    public List<Record> findAll() {
        return recordMapper.selectList(null);
    }

    @Override
    public Integer countFinishToday(Long userId) {
        return recordMapper.finishCountToday(userId);
    }

    @Override
    public Integer countReadToday(Long userId) {
        return recordMapper.readCountToday(userId);
    }

    @Override
    public Integer countFinish(Long userId) {
        return recordMapper.finishCount(userId);
    }


    @Override
    public void removeByRecordId(Long recordId) {
        recordMapper.deleteById(recordId);
    }




}
