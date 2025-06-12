package com.jcdg.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.jcdg.common.config.JcdgConfig;
import com.jcdg.common.core.domain.R;
import com.jcdg.common.utils.file.FileUploadUtils;
import com.jcdg.common.utils.file.MimeTypeUtils;
import com.jcdg.system.domain.JcSelect;
import com.jcdg.system.service.IJcSelectService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.jcdg.common.annotation.Log;
import com.jcdg.common.core.controller.BaseController;
import com.jcdg.common.core.domain.AjaxResult;
import com.jcdg.common.enums.BusinessType;
import com.jcdg.system.domain.Jc;
import com.jcdg.system.service.IJcService;
import com.jcdg.common.utils.poi.ExcelUtil;
import com.jcdg.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 教材Controller
 * 
 * @author jcdg
 * @date 2024-03-26
 */
@RestController
@RequestMapping("/system/jc")
public class JcController extends BaseController {

    @Autowired
    private IJcService jcService;
    @Autowired
    private IJcSelectService jcSelectService;

    /**
     * 查询教材列表
     */
    @PreAuthorize("@ss.hasPermi('system:jc:list')")
    @GetMapping("/list")
    public TableDataInfo list(Jc jc) {
        startPage();
        List<Jc> list = jcService.selectJcList(jc);
        if(list!=null){
            for(int i=0;i<list.size();i++){
                Long jcId = list.get(i).getId();
                List<JcSelect> list1 = jcSelectService.selectJcSelectByJcId(jcId);
                if(list1!=null && list1.size()>0){
                    list.get(i).setIsSelected(1);
                }
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出教材列表
     */
    @PreAuthorize("@ss.hasPermi('system:jc:export')")
    @Log(title = "教材", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Jc jc)
    {
        List<Jc> list = jcService.selectJcList(jc);
        ExcelUtil<Jc> util = new ExcelUtil<Jc>(Jc.class);
        util.exportExcel(response, list, "教材数据");
    }

    /**
     * 获取教材详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jc:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jcService.selectJcById(id));
    }

    /**
     * 新增教材
     */
    @PreAuthorize("@ss.hasPermi('system:jc:add')")
    @Log(title = "教材", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Jc jc)
    {
        return toAjax(jcService.insertJc(jc));
    }

    /**
     * 修改教材
     */
    @PreAuthorize("@ss.hasPermi('system:jc:edit')")
    @Log(title = "教材", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Jc jc)
    {
        return toAjax(jcService.updateJc(jc));
    }

    /**
     * 删除教材
     */
    @PreAuthorize("@ss.hasPermi('system:jc:remove')")
    @Log(title = "教材", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jcService.deleteJcByIds(ids));
    }

    /**
     * 头像上传
     */
    @PostMapping("/uploadImg")
    public R<String> uploadImg(MultipartFile file) throws Exception {
        AjaxResult ajax = new AjaxResult();
        String imgUrl = null;
        if (!file.isEmpty()) {
            imgUrl = FileUploadUtils.upload(JcdgConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
        }
        return R.ok(imgUrl);
    }

    @PreAuthorize("@ss.hasPermi('system:jc:audit')")
    @PostMapping("audit")
    public AjaxResult audit(@RequestBody Jc jc) {
        return toAjax(jcService.auditJc(jc));
    }
}
