package com.liuyanzhao.sens.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.liuyanzhao.sens.entity.Record;
import org.apache.ibatis.annotations.Mapper;


/**
 * @author liuyanzhao
 */
@Mapper
public interface RecordMapper extends BaseMapper<Record> {

    Integer finishCountToday(Long userId);

    Integer readCountToday(Long userId);

    Integer finishCount(Long userId);
}

