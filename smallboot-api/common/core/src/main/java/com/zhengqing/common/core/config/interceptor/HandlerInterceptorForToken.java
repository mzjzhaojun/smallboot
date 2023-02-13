package com.zhengqing.common.core.config.interceptor;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.json.JSONUtil;
import com.google.common.collect.Lists;
import com.zhengqing.common.base.constant.AppConstant;
import com.zhengqing.common.base.constant.SecurityConstant;
import com.zhengqing.common.base.context.JwtUserContext;
import com.zhengqing.common.base.context.SysUserContext;
import com.zhengqing.common.base.context.UmsUserContext;
import com.zhengqing.common.base.enums.ApiResultCodeEnum;
import com.zhengqing.common.base.exception.MyException;
import com.zhengqing.common.base.model.bo.JwtUserBO;
import com.zhengqing.common.core.config.WebAppConfig;
import com.zhengqing.common.redis.util.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * <p> 拦截器 -- token用户信息 </p>
 *
 * @author zhengqingya
 * @description 注册使用参考 {@link WebAppConfig}
 * @date 2022/1/10 16:28
 */
public class HandlerInterceptorForToken implements HandlerInterceptor {

    /**
     * 在业务处理器处理请求之前被调用。预处理，可以进行编码、安全控制、权限校验等处理
     * {@link com.zhengqing.gateway.filter.AuthFilter#filter }
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader(AppConstant.REQUEST_HEADER_TOKEN);
        if (StringUtils.isBlank(token)) {
            return true;
        }
        JwtUserBO jwtUserBO = JSONUtil.toBean(StpUtil.getLoginId().toString(), JwtUserBO.class);

        // 校验权限
        this.checkPermission(request, jwtUserBO);

        JwtUserContext.set(jwtUserBO);
        switch (jwtUserBO.getAuthSourceEnum()) {
            case B:
                SysUserContext.setUserId(Integer.valueOf(jwtUserBO.getUserId()));
                SysUserContext.setUsername(jwtUserBO.getUserName());
                break;
            case C:
                UmsUserContext.setUserId(Long.valueOf(jwtUserBO.getUserId()));
                UmsUserContext.setUsername(jwtUserBO.getUserName());
                break;
            default:
                break;
        }
        return true;
    }

    /**
     * 校验权限
     *
     * @param request   请求
     * @param jwtUserBO 用户信息
     * @return void
     * @author zhengqingya
     * @date 2023/2/13 15:52
     */
    private void checkPermission(HttpServletRequest request, JwtUserBO jwtUserBO) {
        String method = request.getMethod();
        String path = request.getRequestURI();
        // "GET:/web/api/user/*"
        String restfulPath = method + ":" + path;

        /**
         * URL鉴权
         * [URL-角色集合]
         * [{'key':'GET:/web/api/user/*','value':['ADMIN','TEST']},...]
         */
        Map<Object, Object> urlPermReRoleMap = RedisUtil.hGetAll(SecurityConstant.URL_PERM_RE_ROLES);

        // 根据请求路径获取有访问权限的角色列表
        List<String> authorizedRoleList = Lists.newLinkedList();
        // 是否需要鉴权，默认未设置拦截规则不需鉴权
        boolean isCheck = false;
        PathMatcher pathMatcher = new AntPathMatcher();
        for (Map.Entry<Object, Object> permRoles : urlPermReRoleMap.entrySet()) {
            String perm = (String) permRoles.getKey();
            if (pathMatcher.match(perm, restfulPath)) {
                List<String> roleCodeList = JSONUtil.toList((String) permRoles.getValue(), String.class);
                authorizedRoleList.addAll(roleCodeList);
                isCheck = true;
            }
        }

        if (!isCheck) {
            return;
        }

        if (CollectionUtil.isNotEmpty(authorizedRoleList)) {
            List<String> roleCodeList = jwtUserBO.getRoleCodeList();
            for (String roleCodeItem : roleCodeList) {
                if (authorizedRoleList.contains(roleCodeItem)) {
                    return;
                }
            }
        }
        throw new MyException(ApiResultCodeEnum.UN_LOGIN.getCode(), "无操作权限");
    }

    /**
     * 在业务处理器处理请求执行完成后，生成视图之前执行。
     * 后处理（调用了Service并返回ModelAndView，但未进行页面渲染），有机会修改ModelAndView
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    /**
     * 在DispatcherServlet完全处理完请求后被调用，可用于清理资源等。返回处理（已经渲染了页面）
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
        SysUserContext.remove();
        UmsUserContext.remove();
        JwtUserContext.remove();
    }

}
