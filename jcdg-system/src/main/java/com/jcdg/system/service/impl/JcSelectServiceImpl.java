package com.jcdg.system.service.impl;

import java.util.List;
import com.jcdg.common.utils.DateUtils;
import com.jcdg.system.domain.JcSelect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jcdg.system.mapper.JcSelectMapper;
import com.jcdg.system.service.IJcSelectService;

/**
 * 教材选择Service业务层处理
 * 
 * @author jcdg
 * @date 2024-03-30
 */
@Service
public class JcSelectServiceImpl implements IJcSelectService {

    @Autowired
    private JcSelectMapper jcSelectMapper;

    /**
     * 查询教材选择
     * 
     * @param id 教材选择主键
     * @return 教材选择
     */
    @Override
    public JcSelect selectJcSelectById(Long id)
    {
        return jcSelectMapper.selectJcSelectById(id);
    }

    /**
     * 查询教材选择列表
     * 
     * @param jcSelect 教材选择
     * @return 教材选择
     */
    @Override
    public List<JcSelect> selectJcSelectList(JcSelect jcSelect)
    {
        return jcSelectMapper.selectJcSelectList(jcSelect);
    }

    /**
     * 新增教材选择
     * 
     * @param jcSelect 教材选择
     * @return 结果
     */
    @Override
    public int insertJcSelect(JcSelect jcSelect) {
        jcSelect.setCreateTime(DateUtils.getNowDate());
        return jcSelectMapper.insertJcSelect(jcSelect);
    }

    /**
     * 修改教材选择
     * 
     * @param jcSelect 教材选择
     * @return 结果
     */
    @Override
    public int updateJcSelect(JcSelect jcSelect)
    {
        return jcSelectMapper.updateJcSelect(jcSelect);
    }

    /**
     * 批量删除教材选择
     * 
     * @param ids 需要删除的教材选择主键
     * @return 结果
     */
    @Override
    public int deleteJcSelectByIds(Long[] ids)
    {
        return jcSelectMapper.deleteJcSelectByIds(ids);
    }

    /**
     * 删除教材选择信息
     * 
     * @param id 教材选择主键
     * @return 结果
     */
    @Override
    public int deleteJcSelectById(Long id)
    {
        return jcSelectMapper.deleteJcSelectById(id);
    }

    @Override
    public List<JcSelect> selectJcSelectByJcId(Long jcId) {
        return jcSelectMapper.selectJcSelectByJcId(jcId);
    }

    @Override
    public int auditJcSelect(JcSelect jcSelect) {
        return jcSelectMapper.auditJcSelect(jcSelect);
    }
}
