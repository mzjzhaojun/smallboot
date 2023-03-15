package com.zhengqing.wxmp.api;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zhengqing.common.base.constant.ServiceConstant;
import com.zhengqing.common.core.api.BaseController;
import com.zhengqing.common.core.custom.validator.common.UpdateGroup;
import com.zhengqing.wxmp.model.dto.WxMsgAutoReplyPageDTO;
import com.zhengqing.wxmp.model.dto.WxMsgAutoReplySaveDTO;
import com.zhengqing.wxmp.model.vo.WxMsgAutoReplyPageVO;
import com.zhengqing.wxmp.service.IWxMsgAutoReplyService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


/**
 * <p> 微信公众号-消息自动回复 接口 </p>
 *
 * @author zhengqingya
 * @description
 * @date 2023/03/15 18:30
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(ServiceConstant.SERVICE_API_PREFIX_WEB_WXMP + "/msgAutoReply")
@Api(tags = {"微信公众号-消息自动回复"})
public class WxMsgAutoReplyController extends BaseController {

    private final IWxMsgAutoReplyService wxMsgAutoReplyService;

    @GetMapping("page")
    @ApiOperation("分页列表")
    public IPage<WxMsgAutoReplyPageVO> page(@Validated @ModelAttribute WxMsgAutoReplyPageDTO params) {
        return this.wxMsgAutoReplyService.page(params);
    }

    @PostMapping("add")
    @ApiOperation("新增")
    public void add(@Validated @RequestBody WxMsgAutoReplySaveDTO params) {
        params.setId(null);
        this.wxMsgAutoReplyService.addOrUpdateData(params);
    }

    @PutMapping("update")
    @ApiOperation("更新")
    public void update(@Validated(UpdateGroup.class) @RequestBody WxMsgAutoReplySaveDTO params) {
        this.wxMsgAutoReplyService.addOrUpdateData(params);
    }

    @DeleteMapping("delete")
    @ApiOperation("删除")
    public void delete(@RequestParam Integer id) {
        this.wxMsgAutoReplyService.deleteData(id);
    }

}
