package com.liuyanzhao.sens.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.liuyanzhao.sens.entity.Record;

import java.util.List;

/**
 * <pre>
 *     词汇逻辑接口
 * </pre>
 *
 * @author : saysky
 * @date : 2019/6/6
 */
public interface RecordService {

    /**
     * 新增/修改词汇
     *
     * @param record record
     * @return Record
     */
    Record saveByRecord(Record record);

    /**
     * 根据编号删除
     *
     * @param recordId recordId
     * @return Record
     */
    void removeByRecordId(Long recordId);

    /**
     * 根据编号查询单个权限
     *
     * @param recordId recordId
     * @return Record
     */
    Record findByRecordId(Long recordId);


    /**
     * 获得所有的词汇
     *
     * @return 词汇列表
     */
    List<Record> findAll();

    /**
     * 当天完成的数量
     * @return
     */
    Integer countFinishToday(Long userId);

    /**
     * 当天阅读的数量
     * @return
     */
    Integer countReadToday(Long userId);

    /**
     * 所有完成的数量
     * @return
     */
    Integer countFinish(Long userId);

}
