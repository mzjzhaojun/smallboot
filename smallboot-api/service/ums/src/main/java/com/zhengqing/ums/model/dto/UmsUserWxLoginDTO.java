package com.zhengqing.ums.model.dto;

import com.zhengqing.common.base.model.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.SuperBuilder;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 用户信息-微信小程序登录参数
 * </p>
 *
 * @author zhengqingya
 * @description
 * @date 2020/4/15 10:48
 */
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel
public class UmsUserWxLoginDTO extends BaseDTO {

    @NotNull
    @ApiModelProperty("消息密文")
    private String encryptedData;

    @NotNull
    @ApiModelProperty("加密算法的初始向量")
    private String iv;

    @NotNull
    @ApiModelProperty("动态令牌")
    private String code;

//    @NotNull
//    @ApiModelProperty("敏感信息加密数据")
//    private String rawData;

//    @NotNull
//    @ApiModelProperty("签名信息")
//    private String signature;

    @ApiModelProperty("用户信息")
    private WxUserInfo userInfo;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class WxUserInfo {
        @ApiModelProperty("昵称")
        private String nickName;

        @ApiModelProperty("头像")
        private String avatarUrl;
    }

}