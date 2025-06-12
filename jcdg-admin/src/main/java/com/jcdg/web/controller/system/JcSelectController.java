package com.jcdg.web.controller.system;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.jcdg.common.utils.SecurityUtils;
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
import com.jcdg.system.domain.JcSelect;
import com.jcdg.system.service.IJcSelectService;
import com.jcdg.common.utils.poi.ExcelUtil;
import com.jcdg.common.core.page.TableDataInfo;

/**
 * 教材选择Controller
 * 
 * @author jcdg
 * @date 2024-03-30
 */
@RestController
@RequestMapping("/system/jcSelect")
public class JcSelectController extends BaseController {

    @Autowired
    private IJcSelectService jcSelectService;

    /**
     * 查询教材选择列表
     */
    @PreAuthorize("@ss.hasPermi('system:jcSelect:list')")
    @GetMapping("/list")
    public TableDataInfo list(JcSelect jcSelect)
    {
        startPage();
        List<JcSelect> list = jcSelectService.selectJcSelectList(jcSelect);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('system:jcSelect:listAudit')")
    @GetMapping("/listAudit")
    public TableDataInfo listAudit(JcSelect jcSelect) {
        startPage();
        jcSelect.setAuditStatus(1l);
        List<JcSelect> list = jcSelectService.selectJcSelectList(jcSelect);
        return getDataTable(list);
    }

    /**
     * 导出教材选择列表
     */
    @PreAuthorize("@ss.hasPermi('system:jcSelect:export')")
    @Log(title = "教材选择", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, JcSelect jcSelect)
    {
        List<JcSelect> list = jcSelectService.selectJcSelectList(jcSelect);
        ExcelUtil<JcSelect> util = new ExcelUtil<JcSelect>(JcSelect.class);
        util.exportExcel(response, list, "教材选择数据");
    }

    /**
     * 获取教材选择详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jcSelect:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jcSelectService.selectJcSelectById(id));
    }

    /**
     * 新增教材选择
     */
    @PreAuthorize("@ss.hasPermi('system:jcSelect:add')")
    @Log(title = "教材选择", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody JcSelect jcSelect) {
        jcSelect.setCreateBy(SecurityUtils.getUsername());
        return toAjax(jcSelectService.insertJcSelect(jcSelect));
    }

    /**
     * 修改教材选择
     */
    @PreAuthorize("@ss.hasPermi('system:jcSelect:edit')")
    @Log(title = "教材选择", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody JcSelect jcSelect)
    {
        return toAjax(jcSelectService.updateJcSelect(jcSelect));
    }

    /**
     * 删除教材选择
     */
    @PreAuthorize("@ss.hasPermi('system:jcSelect:remove')")
    @Log(title = "教材选择", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jcSelectService.deleteJcSelectByIds(ids));
    }

    @PreAuthorize("@ss.hasPermi('system:jcSelect:audit')")
    @Log(title = "教材审核", businessType = BusinessType.UPDATE)
    @PostMapping("audit")
    public AjaxResult audit(@RequestBody JcSelect jcSelect) {
        jcSelect.setAuditBy(SecurityUtils.getUsername());
        jcSelect.setAuditTime(new Date());
         return toAjax(jcSelectService.auditJcSelect(jcSelect));
    }
}
