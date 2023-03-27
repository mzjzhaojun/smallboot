package com.zhengqing.mall.config.mybatis.handler;

import com.zhengqing.common.db.config.mybatis.handler.DbJsonTypeHandler;
import com.zhengqing.mall.web.model.bo.WebPmsAttrBO;

/**
 * <p> 自定义类型处理器 </p>
 *
 * @author zhengqingya
 * @description 属性
 * @date 2022/6/6 11:26
 */
public class MallListAttrTypeHandler extends DbJsonTypeHandler {

    public MallListAttrTypeHandler(Class<?> type) {
        super(type, WebPmsAttrBO.class);
    }

}