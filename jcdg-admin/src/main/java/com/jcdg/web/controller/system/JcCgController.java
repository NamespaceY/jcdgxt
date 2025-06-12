package com.jcdg.web.controller.system;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.jcdg.common.utils.SecurityUtils;
import com.jcdg.system.domain.JcSelect;
import com.jcdg.system.service.IJcSelectService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.jcdg.common.annotation.Log;
import com.jcdg.common.core.controller.BaseController;
import com.jcdg.common.core.domain.AjaxResult;
import com.jcdg.common.enums.BusinessType;
import com.jcdg.system.domain.JcCg;
import com.jcdg.system.service.IJcCgService;
import com.jcdg.common.utils.poi.ExcelUtil;
import com.jcdg.common.core.page.TableDataInfo;

/**
 * 采购单Controller
 * 
 * @author jcdg
 * @date 2024-03-31
 */
@RestController
@RequestMapping("/system/jcCg")
public class JcCgController extends BaseController {

    @Autowired
    private IJcCgService jcCgService;
    @Autowired
    private IJcSelectService jcSelectService;

    /**
     * 查询采购单列表
     */
    @PreAuthorize("@ss.hasPermi('system:cgd:list')")
    @GetMapping("/list")
    public TableDataInfo list(JcCg jcCg) {
        startPage();
        List<JcCg> list = jcCgService.selectJcCgList(jcCg);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('system:mycgd:list')")
    @GetMapping("/listMy")
    public TableDataInfo listMy(JcCg jcCg) {
        startPage();
        List<JcCg> list = jcCgService.selectJcCgList(jcCg);
        return getDataTable(list);
    }

    /**
     * 导出采购单列表
     */
    @PreAuthorize("@ss.hasPermi('system:jcCg:export')")
    @Log(title = "采购单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, JcCg jcCg)
    {
        List<JcCg> list = jcCgService.selectJcCgList(jcCg);
        ExcelUtil<JcCg> util = new ExcelUtil<JcCg>(JcCg.class);
        util.exportExcel(response, list, "采购单数据");
    }

    /**
     * 获取采购单详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jcCg:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jcCgService.selectJcCgById(id));
    }

    /**
     * 新增采购单
     */
    @PreAuthorize("@ss.hasPermi('system:jcCg:add')")
    @Log(title = "采购单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody JcCg jcCg) {
        Long selectId = jcCg.getId();
        jcCg.setId(null);
        JcSelect jcSelect = jcSelectService.selectJcSelectById(selectId);
        jcCg.setJcId(jcSelect.getJcId());
        jcCg.setCreateBy(SecurityUtils.getUsername());
        jcCg.setCreateTime(new Date());
        return toAjax(jcCgService.insertJcCg(jcCg));
    }

    /**
     * 修改采购单
     */
    @PreAuthorize("@ss.hasPermi('system:jcCg:edit')")
    @Log(title = "采购单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody JcCg jcCg)
    {
        return toAjax(jcCgService.updateJcCg(jcCg));
    }

    /**
     * 删除采购单
     */
    @PreAuthorize("@ss.hasPermi('system:jcCg:remove')")
    @Log(title = "采购单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jcCgService.deleteJcCgByIds(ids));
    }

    @PreAuthorize("@ss.hasPermi('system:jcCg:pay')")
    @GetMapping(value = "/pay/{ids}")
    public AjaxResult pay(@PathVariable Long[] ids) {
        return success(jcCgService.pay(ids));
    }

}
