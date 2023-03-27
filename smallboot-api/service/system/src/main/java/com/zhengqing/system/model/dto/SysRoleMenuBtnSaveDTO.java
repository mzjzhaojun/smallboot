package com.zhengqing.system.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * <p>
 * 角色关联菜单ids提交参数
 * </p>
 *
 * @author zhengqingya
 * @description
 * @date 2020/9/10 18:48
 */
@Data
@ApiModel("角色关联菜单ids提交参数")
public class SysRoleMenuBtnSaveDTO {

    @NotNull(message = "角色Id不能为空！")
    @ApiModelProperty(value = "角色Id")
    private Integer roleId;

    @NotNull(message = "菜单id不能为空！")
    @ApiModelProperty(value = "菜单ID")
    private Integer menuId;

    @ApiModelProperty(value = "菜单下按钮权限id")
    private List<Integer> permissionIdList;

}
