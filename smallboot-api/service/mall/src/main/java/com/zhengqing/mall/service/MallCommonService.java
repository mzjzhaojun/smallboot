package com.zhengqing.mall.service;

import com.zhengqing.mall.common.model.bo.PmsSpuBuyNumInfoBO;
import com.zhengqing.mall.common.model.vo.MallFileVO;
import com.zhengqing.mall.common.model.vo.MallTabConditionListVO;
import com.zhengqing.mall.common.model.vo.PmsSkuVO;
import com.zhengqing.system.enums.SysDictTypeEnum;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p> 商城-common 服务类 </p>
 *
 * @author zhengqingya
 * @description
 * @date 2021/8/30 19:19
 */
public interface MallCommonService {

    /**
     * 上传文件
     *
     * @param file: 文件
     * @return 文件信息
     * @author zhengqingya
     * @date 2021/6/24 9:47
     */
    MallFileVO uploadFile(MultipartFile file);

    /**
     * 查询自动收货毫秒
     *
     * @return 自动收货毫秒
     * @author zhengqingya
     * @date 2021/12/10 16:26
     */
    long getAutoReceiptMillisecond();

    /**
     * 查询自动收货时间
     *
     * @return 自动收货时间
     * @author zhengqingya
     * @date 2021/12/10 16:26
     */
    Date getAutoReceiptTime();

    /**
     * 处理tab数据
     *
     * @param tabDataList  tab数据
     * @param dictTypeEnum 字典类型枚举
     * @return 处理过后的tab数据
     * @author zhengqingya
     * @date 2021/8/30 19:20
     */
    List<MallTabConditionListVO> getTabDataList(List<MallTabConditionListVO> tabDataList, SysDictTypeEnum dictTypeEnum);

    /**
     * 初始化普通商品所需数据
     *
     * @return void
     * @author zhengqingya
     * @date 2021/11/25 17:31
     */
    void initData();

    /**
     * 校验此人是否限购
     *
     * @param skuBuyInfoList       商品sku-本次购买参数
     * @param skuInfoMap           商品sku-信息
     * @param skuBuyHistoryInfoMap 商品sku-历史购买记录
     * @return void
     * @author zhengqingya
     * @date 2021/12/29 20:02
     */
    void checkSkuLimit(List<PmsSpuBuyNumInfoBO> skuBuyInfoList,
                       Map<String, PmsSkuVO> skuInfoMap,
                       Map<String, Integer> skuBuyHistoryInfoMap);

}
