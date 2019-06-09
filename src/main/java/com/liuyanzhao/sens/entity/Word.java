package com.liuyanzhao.sens.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * 词汇
 * @author 言曌
 * @date 2019-06-06 22:51
 */

@Data
@TableName("sens_word")
public class Word implements Serializable {

    private static final long serialVersionUID = -2571815432301283172L;

    @TableId(type = IdType.AUTO)
    private Long id;

    private String enName;

    private String cnName;

    private String enSentence;

    private String cnSentence;

    private String img;

    private Date createTime;

}