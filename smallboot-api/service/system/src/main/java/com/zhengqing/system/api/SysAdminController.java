package com.zhengqing.system.api;

import com.zhengqing.common.base.constant.ServiceConstant;
import com.zhengqing.common.core.api.BaseController;
import com.zhengqing.common.db.mapper.MyBaseMapper;
import com.zhengqing.system.model.vo.SysRoleRePermListVO;
import com.zhengqing.system.service.ISysDictService;
import com.zhengqing.system.service.ISysPermissionBusinessService;
import com.zhengqing.system.service.ISysPermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 管理员api
 * </p>
 *
 * @author zhengqingya
 * @description
 * @date 2019/8/19 13:49
 */
@RestController
@RequestMapping(ServiceConstant.SERVICE_API_PREFIX_WEB_SYSTEM + "/admin")
@Api(tags = "管理员api")
@RequiredArgsConstructor
public class SysAdminController extends BaseController {

    private final ISysPermissionService sysPermissionService;
    private final ISysPermissionBusinessService sysPermissionBusinessService;
    private final MyBaseMapper myBaseMapper;
    private final ISysDictService sysDictService;

    @ApiOperation("获取角色权限映射数据")
    @GetMapping("listRoleRePerm")
    public List<SysRoleRePermListVO> listRoleRePerm() {
        return this.sysPermissionService.listRoleRePerm();
    }

    @ApiOperation("刷新Redis缓存中的角色菜单权限")
    @GetMapping("refreshRedisPerm")
    public void refreshRedisPerm() {
        this.sysPermissionBusinessService.refreshRedisPerm();
    }

    /**
     * http://127.0.0.1:20010/initDb
     */
    @ApiOperation("初始化DB(谨慎操作)")
    @GetMapping("initDb")
    public String initDb() {
//        String initDbSql = "DROP DATABASE IF EXISTS `smallboot`; " +
//                "CREATE DATABASE `smallboot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci; ";
//        String initSql = "USE `smallboot`; " + MyFileUtil.readFileContent(ProjectConstant.PROJECT_ROOT_DIRECTORY + "/doc/sql/smallboot.sql");
//        this.myBaseMapper.execSql(initDbSql);
//        this.myBaseMapper.execSql(initSql);
        return "OK";
    }


}
