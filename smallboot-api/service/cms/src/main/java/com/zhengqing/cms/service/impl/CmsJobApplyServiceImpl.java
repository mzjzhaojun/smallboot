package com.zhengqing.cms.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhengqing.cms.entity.CmsJobApply;
import com.zhengqing.cms.mapper.CmsJobApplyMapper;
import com.zhengqing.cms.model.dto.CmsJobApplyPageDTO;
import com.zhengqing.cms.model.dto.CmsJobApplySaveDTO;
import com.zhengqing.cms.model.vo.CmsJobApplyPageVO;
import com.zhengqing.cms.model.vo.CmsJobBaseVO;
import com.zhengqing.cms.service.ICmsJobApplyService;
import com.zhengqing.cms.service.ICmsJobService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p> 内容管理-职位申请 服务实现类 </p>
 *
 * @author zhengqingya
 * @description
 * @date 2023/10/10 18:11
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CmsJobApplyServiceImpl extends ServiceImpl<CmsJobApplyMapper, CmsJobApply> implements ICmsJobApplyService {

    private final CmsJobApplyMapper cmsJobApplyMapper;
    private final ICmsJobService iCmsJobService;

    @Override
    public IPage<CmsJobApplyPageVO> page(CmsJobApplyPageDTO params) {
        IPage<CmsJobApplyPageVO> result = this.cmsJobApplyMapper.selectDataPage(new Page<>(), params);
        List<CmsJobApplyPageVO> list = result.getRecords();
        if (CollUtil.isEmpty(list)) {
            return result;
        }
        List<Integer> jobIdList = list.stream().map(CmsJobApplyPageVO::getJobId).collect(Collectors.toList());
        Map<Integer, CmsJobBaseVO> jobMap = this.iCmsJobService.map(jobIdList);
        list.forEach(e -> {
            e.setJobObj(jobMap.get(e.getJobId()));
            e.handleData();
        });
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addOrUpdateData(CmsJobApplySaveDTO params) {
        CmsJobApply.builder()
                .id(params.getId())
                .jobId(params.getJobId())
                .status(params.getStatus())
                .contact(params.getContact())
                .contactPhone(params.getContactPhone())
                .remark(params.getRemark())
                .build()
                .insertOrUpdate();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteData(Integer id) {
        this.cmsJobApplyMapper.deleteById(id);
    }

}
