package com.liuyanzhao.sens.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * 生词本
 * @author 言曌
 * @date 2019-06-06 22:56
 */

@Data
@TableName("sens_strange_word")
public class StrangeWord implements Serializable {

    private static final long serialVersionUID = 5091220066943292043L;

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long wordId;

    private Long userId;

    private Date createTime;

}
