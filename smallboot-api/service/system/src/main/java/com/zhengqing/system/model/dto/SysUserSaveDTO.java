package com.zhengqing.system.model.dto;

import com.zhengqing.common.core.custom.fieldrepeat.FieldRepeatValidator;
import com.zhengqing.common.core.custom.validator.common.UpdateGroup;
import com.zhengqing.common.core.enums.UserSexEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * <p>
 * 保存用户参数
 * </p>
 *
 * @author zhengqingya
 * @description
 * @date 2020/9/10 11:15
 */
@Data
@ApiModel("保存用户参数")
@FieldRepeatValidator(tableName = "t_sys_user", idDbName = "user_id", fieldNames = "username",
        dbFieldNames = {"username"}, message = "账号重复，请重新输入账号！")
public class SysUserSaveDTO {

    @ApiModelProperty(value = "主键ID groups:标识在更新的时候才能验证非空")
    @NotNull(message = "用户id不能为空", groups = {UpdateGroup.class})
    private Integer userId;

    @ApiModelProperty(value = "账号")
    @NotBlank(message = "账号不能为空")
    @Length(max = 100, message = "账号不能超过100个字符")
    @Pattern(regexp = "^[\\u4E00-\\u9FA5A-Za-z0-9\\*]*$", message = "账号限制：最多100字符，包含文字、字母和数字")
    private String username;

    @ApiModelProperty(value = "昵称")
    @NotBlank(message = "昵称不能为空")
    @Pattern(regexp = "^[\\u4E00-\\u9FA5A-Za-z0-9\\*]*$", message = "账号限制：最多100字符，包含文字、字母和数字")
    private String nickname;

    /**
     * {@link UserSexEnum}
     */
    @ApiModelProperty(value = "性别")
    private Byte sex;

    @ApiModelProperty(value = "手机号码")
    // @NotBlank(message = "手机号不能为空")
    // @Pattern(regexp = "^[1][3,4,5,6,7,8,9][0-9]{9}$", message = "手机号格式有误")
    private String phone;

    @ApiModelProperty(value = "邮箱")
    // @NotBlank(message = "联系邮箱不能为空")
    // @Email(message = "邮箱格式不对")
    private String email;

    @ApiModelProperty(value = "头像")
    private String avatarUrl;

}
