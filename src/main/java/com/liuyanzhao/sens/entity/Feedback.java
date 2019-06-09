package com.liuyanzhao.sens.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 言曌
 * @date 2019-06-06 22:59
 */

@Data
@TableName("sens_feedback")
public class Feedback implements Serializable {

    private static final long serialVersionUID = 5091220066943292011L;

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long userId;

    private String content;

    private Date createTime;

    /**
     * 发表用户 多对一
     */
    @TableField(exist = false)
    private User user;

}
