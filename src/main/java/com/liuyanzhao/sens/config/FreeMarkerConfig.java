package com.liuyanzhao.sens.config;

import com.jagregory.shiro.freemarker.ShiroTags;
import com.liuyanzhao.sens.service.OptionsService;
import com.liuyanzhao.sens.service.UserService;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * <pre>
 *     FreeMarker配置
 * </pre>
 *
 * @author : saysky
 * @date : 2018/4/26
 */
@Slf4j
@Configuration
public class FreeMarkerConfig{

    @Autowired
    private freemarker.template.Configuration configuration;

    @Autowired
    private OptionsService optionsService;

    @Autowired
    private UserService userService;


    @PostConstruct
    public void setSharedVariable() {
        try {
            //shiro
            configuration.setSharedVariable("shiro", new ShiroTags());
            configuration.setNumberFormat("#");

            //自定义标签
            configuration.setSharedVariable("options", optionsService.findAllOptions());
        } catch (TemplateModelException e) {
            log.error("自定义标签加载失败：{}", e.getMessage());
        }
    }


}
