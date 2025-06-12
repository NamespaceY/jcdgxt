package com.jcdg.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.jcdg.system.domain.Sm;
import com.jcdg.system.service.ISmService;
import com.jcdg.common.utils.poi.ExcelUtil;
import com.jcdg.common.core.page.TableDataInfo;

/**
 * 书目Controller
 * 
 * @author ddd
 * @date 2024-03-25
 */
@RestController
@RequestMapping("/system/sm")
public class SmController extends BaseController
{
    @Autowired
    private ISmService smService;

    /**
     * 查询书目列表
     */
    @PreAuthorize("@ss.hasPermi('system:sm:list')")
    @GetMapping("/list")
    public TableDataInfo list(Sm sm)
    {
        startPage();
        List<Sm> list = smService.selectSmList(sm);
        return getDataTable(list);
    }

    @GetMapping("/listSm")
    public AjaxResult listSm(Sm sm) {
        List<Sm> list = smService.selectSmList(sm);
        return AjaxResult.success(list);
    }

    /**
     * 导出书目列表
     */
    @PreAuthorize("@ss.hasPermi('system:sm:export')")
    @Log(title = "书目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Sm sm)
    {
        List<Sm> list = smService.selectSmList(sm);
        ExcelUtil<Sm> util = new ExcelUtil<Sm>(Sm.class);
        util.exportExcel(response, list, "书目数据");
    }

    /**
     * 获取书目详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sm:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(smService.selectSmById(id));
    }

    /**
     * 新增书目
     */
    @PreAuthorize("@ss.hasPermi('system:sm:add')")
    @Log(title = "书目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Sm sm)
    {
        return toAjax(smService.insertSm(sm));
    }

    /**
     * 修改书目
     */
    @PreAuthorize("@ss.hasPermi('system:sm:edit')")
    @Log(title = "书目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Sm sm)
    {
        return toAjax(smService.updateSm(sm));
    }

    /**
     * 删除书目
     */
    @PreAuthorize("@ss.hasPermi('system:sm:remove')")
    @Log(title = "书目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(smService.deleteSmByIds(ids));
    }
}
