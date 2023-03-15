package com.zhengqing.wxmp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zhengqing.wxmp.entity.WxAccount;
import com.zhengqing.wxmp.model.dto.WxAccountPageDTO;
import com.zhengqing.wxmp.model.vo.WxAccountPageVO;
import org.apache.ibatis.annotations.Param;

/**
 * <p> 微信公众号-账号 Mapper </p>
 *
 * @author zhengqingya
 * @description
 * @date 2023/03/15 18:30
 */
public interface WxAccountMapper extends BaseMapper<WxAccount> {

    /**
     * 列表分页
     *
     * @param page   分页数据
     * @param filter 查询过滤参数
     * @return 查询结果
     * @author zhengqingya
     * @date 2023/03/15 18:30
     */
    IPage<WxAccountPageVO> selectDataPage(IPage page, @Param("filter") WxAccountPageDTO filter);

}
