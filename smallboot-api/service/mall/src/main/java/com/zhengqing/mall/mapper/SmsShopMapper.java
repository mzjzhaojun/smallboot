package com.zhengqing.mall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zhengqing.mall.entity.SmsShop;
import com.zhengqing.mall.model.dto.WebSmsShopDetailDTO;
import com.zhengqing.mall.model.dto.WebSmsShopPageDTO;
import com.zhengqing.mall.model.vo.WebSmsShopDetailVO;
import com.zhengqing.mall.model.vo.WebSmsShopPageVO;
import org.apache.ibatis.annotations.Param;

/**
 * <p> 商城-店铺信息 Mapper </p>
 *
 * @author zhengqingya
 * @description
 * @date 2023/09/13 09:51
 */
public interface SmsShopMapper extends BaseMapper<SmsShop> {

    /**
     * 列表分页
     *
     * @param page 分页数据
     * @param filter 查询过滤参数
     * @return 查询结果
     * @author zhengqingya
     * @date 2023/09/13 09:51
     */
    IPage<WebSmsShopPageVO> selectDataPage(IPage page, @Param("filter") WebSmsShopPageDTO filter);

    /**
     * 详情
     *
     * @param filter 查询过滤参数
     * @return 详情
     * @author zhengqingya
     * @date 2023/09/13 09:51
     */
     WebSmsShopDetailVO detail(@Param("filter") WebSmsShopDetailDTO filter);

}
