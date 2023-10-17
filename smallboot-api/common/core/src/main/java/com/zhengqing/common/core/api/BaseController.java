package com.zhengqing.common.core.api;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.extra.servlet.ServletUtil;
import com.zhengqing.common.base.context.JwtUserContext;
import com.zhengqing.common.base.context.SysUserContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * Controller基类
 * </p>
 *
 * @author zhengqingya
 * @description
 * @date 2019/8/17 0017 19:53
 */
@Slf4j
@RestController
//@Api(tags = "base接口")
public class BaseController {

    /**
     * 获取当前登录人ID
     *
     * @return 当前登录人ID
     * @author zhengqingya
     * @date 2020/8/30 15:41
     */
    protected Integer appGetCurrentUserId() {
        return SysUserContext.getUserId();
    }

    /**
     * 获取当前登录人关联的部门ID
     *
     * @return 部门ID
     * @author zhengqingya
     * @date 2020/8/30 15:41
     */
    protected Integer getCurrentUserReDeptId() {
        return JwtUserContext.get().getDeptId();
    }

    /**
     * 是否自动填充关联部门值 -- 用于过滤数据
     *
     * @return true:是 false:否
     * @author zhengqingya
     * @date 2020/8/30 15:41
     */
    protected boolean isFillDeptId() {
        return this.getCurrentUserReDeptId() != null;
    }


    /**
     * 获取小程序商户id
     *
     * @return 商户id
     * @author zhengqingya
     * @date 2020/8/30 15:41
     */
    protected Integer getMiniMerchantId() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String merchantId = ServletUtil.getHeader(request, "MERCHANT_ID", CharsetUtil.UTF_8);
        Assert.notBlank(merchantId, "小程序商户ID丢失！");
        return Integer.valueOf(merchantId);
    }

}
