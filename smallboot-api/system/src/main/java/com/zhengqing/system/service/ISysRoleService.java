package com.zhengqing.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhengqing.system.entity.SysRole;
import com.zhengqing.system.model.dto.SysRoleListDTO;
import com.zhengqing.system.model.dto.SysRoleSaveDTO;
import com.zhengqing.system.model.vo.SysRoleAllPermissionDetailVO;
import com.zhengqing.system.model.vo.SysRoleListVO;
import com.zhengqing.system.model.vo.SysRolePermissionDetailVO;

import java.util.List;

/**
 * <p>
 * 系统管理 - 角色管理 服务类
 * </p>
 *
 * @author zhengqingya
 * @description
 * @date 2020/4/15 15:01
 */
public interface ISysRoleService extends IService<SysRole> {

    /**
     * 列表分页
     *
     * @param params:
     * @return 角色信息
     * @author zhengqingya
     * @date 2020/9/10 14:44
     */
    IPage<SysRoleListVO> listPage(SysRoleListDTO params);

    /**
     * 列表
     *
     * @param params: 查询参数
     * @return 角色信息
     * @author zhengqingya
     * @date 2020/9/10 14:45
     */
    List<SysRoleListVO> list(SysRoleListDTO params);

    /**
     * 新增或更新
     *
     * @param params: 提交参数
     * @return 角色id
     * @author zhengqingya
     * @date 2020/9/10 14:45
     */
    Integer addOrUpdateData(SysRoleSaveDTO params);

    /**
     * 根据角色ID获取角色信息详情（包含角色可访问的菜单ids）
     *
     * @param roleId: 角色id
     * @return 角色信息+菜单ids
     * @author zhengqingya
     * @date 2020/9/10 14:50
     */
    SysRolePermissionDetailVO detail(Integer roleId);

    /**
     * 根据角色ID获取角色信息详情（含角色基本信息+菜单信息+按钮信息）
     *
     * @param roleId 角色id
     * @return 角色权限具体详情信息
     * @author zhengqingya
     * @date 2020/9/11 16:16
     */
    SysRoleAllPermissionDetailVO permissionDetail(Integer roleId);

    /**
     * 根据角色id删除角色与关联菜单权限
     *
     * @param roleId: 角色id
     * @return void
     * @author zhengqingya
     * @date 2020/9/10 18:03
     */
    void deleteRoleAndRoleMenu(Integer roleId);

}
