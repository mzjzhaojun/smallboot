package com.zhengqing.system.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import com.zhengqing.common.db.constant.MybatisConstant;
import com.zhengqing.system.entity.SysDept;
import com.zhengqing.system.mapper.SysDeptMapper;
import com.zhengqing.system.model.dto.SysDeptSaveDTO;
import com.zhengqing.system.model.dto.SysDeptTreeDTO;
import com.zhengqing.system.model.vo.SysDeptTreeVO;
import com.zhengqing.system.service.ISysDeptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p> 系统管理-部门 服务实现类 </p>
 *
 * @author zhengqingya
 * @description
 * @date 2023/10/09 18:10
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements ISysDeptService {

    private final SysDeptMapper sysDeptMapper;

    @Override
    public List<SysDeptTreeVO> tree(SysDeptTreeDTO params) {
        List<SysDeptTreeVO> list = this.sysDeptMapper.selectDataList(params);
        if (CollUtil.isEmpty(list)) {
            return Lists.newArrayList();
        }
        Integer firstParentId = list.stream().map(SysDeptTreeVO::getParentId).min(Integer::compareTo).get();
        return this.recurveDept(firstParentId, list, params.getExcludeDeptId());
    }

    /**
     * 递归部门
     *
     * @param parentId      父id
     * @param allList       所有部门
     * @param excludeDeptId 排除指定部门id下级的数据
     * @return 菜单树列表
     * @author zhengqingya
     * @date 2020/9/10 20:56
     */
    private List<SysDeptTreeVO> recurveDept(Integer parentId, List<SysDeptTreeVO> allList, Integer excludeDeptId) {
        if (parentId.equals(excludeDeptId)) {
            return Lists.newArrayList();
        }
        // 存放子集合
        List<SysDeptTreeVO> childList = allList.stream().filter(e -> e.getParentId().equals(parentId)).collect(Collectors.toList());
        // 递归
        childList.forEach(item -> {
            item.setChildren(this.recurveDept(item.getId(), allList, excludeDeptId));
            item.handleData();
        });
        return childList;
    }

    @Override
    public List<Integer> getChildDeptIdList(Integer deptId) {
        return this.recurveDeptId(deptId, this.list(), Lists.newArrayList());
    }

    /**
     * 递归部门
     *
     * @param parentId   父id
     * @param allList    所有部门
     * @param deptIdList 最终结果
     * @return 菜单树列表
     * @author zhengqingya
     * @date 2020/9/10 20:56
     */
    private List<Integer> recurveDeptId(Integer parentId, List<SysDept> allList, List<Integer> deptIdList) {
        deptIdList.add(parentId);
        List<SysDept> childList = allList.stream().filter(e -> e.getParentId().equals(parentId)).collect(Collectors.toList());
        if (CollUtil.isEmpty(childList)) {
            return deptIdList;
        }
        for (SysDept item : childList) {
            this.recurveDeptId(item.getId(), allList, deptIdList);
        }
        return deptIdList;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addOrUpdateData(SysDeptSaveDTO params) {
        Integer id = params.getId();
        String name = params.getName();
        // 校验名称是否重复
        SysDept sysDeptOld = this.sysDeptMapper.selectOne(new LambdaQueryWrapper<SysDept>().eq(SysDept::getName, name).last(MybatisConstant.LIMIT_ONE));
        Assert.isTrue(sysDeptOld == null || sysDeptOld.getId().equals(id), "名称重复，请重新输入！");


        SysDept.builder()
                .id(id)
                .parentId(params.getParentId())
                .name(name)
                .sort(params.getSort())
                .leaderUserId(params.getLeaderUserId())
                .phone(params.getPhone())
                .email(params.getEmail())
                .status(params.getStatus())
                .expireTime(params.getExpireTime())
                .provinceName(params.getProvinceName())
                .cityName(params.getCityName())
                .areaName(params.getAreaName())
                .address(params.getAddress())
                .remark(params.getRemark())
                .userNum(params.getUserNum())
                .build()
                .insertOrUpdate();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteData(Integer id) {
        this.sysDeptMapper.deleteById(id);
    }

}
