package com.zhengqing.system.model.dto;

import com.zhengqing.common.base.model.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * <p>
 * 系统管理 - 角色管理查询参数
 * </p>
 *
 * @author zhengqingya
 * @description
 * @date 2020/4/15 16:35
 */
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel("角色管理查询参数")
public class SysRoleBaseDTO extends BaseDTO {

    @ApiModelProperty(value = "角色名称")
    private String name;

    @ApiModelProperty("排除指定角色id下级的数据")
    private Integer excludeRoleId;

}
