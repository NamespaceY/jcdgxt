package com.jcdg.system.service.impl;

import java.util.List;
import com.jcdg.common.utils.DateUtils;
import com.jcdg.common.utils.SecurityUtils;
import com.jcdg.system.domain.Jc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jcdg.system.mapper.JcMapper;
import com.jcdg.system.service.IJcService;

/**
 * 教材Service业务层处理
 * 
 * @author jcdg
 * @date 2024-03-26
 */
@Service
public class JcServiceImpl implements IJcService 
{
    @Autowired
    private JcMapper jcMapper;

    /**
     * 查询教材
     * 
     * @param id 教材主键
     * @return 教材
     */
    @Override
    public Jc selectJcById(Long id)
    {
        return jcMapper.selectJcById(id);
    }

    /**
     * 查询教材列表
     * 
     * @param jc 教材
     * @return 教材
     */
    @Override
    public List<Jc> selectJcList(Jc jc)
    {
        return jcMapper.selectJcList(jc);
    }

    /**
     * 新增教材
     * 
     * @param jc 教材
     * @return 结果
     */
    @Override
    public int insertJc(Jc jc) {
        jc.setCreateBy(SecurityUtils.getUsername());
        jc.setCreateTime(DateUtils.getNowDate());
        return jcMapper.insertJc(jc);
    }

    /**
     * 修改教材
     * 
     * @param jc 教材
     * @return 结果
     */
    @Override
    public int updateJc(Jc jc) {
        jc.setUpdateBy(SecurityUtils.getUsername());
        jc.setUpdateTime(DateUtils.getNowDate());
        return jcMapper.updateJc(jc);
    }

    /**
     * 批量删除教材
     * 
     * @param ids 需要删除的教材主键
     * @return 结果
     */
    @Override
    public int deleteJcByIds(Long[] ids)
    {
        return jcMapper.deleteJcByIds(ids);
    }

    /**
     * 删除教材信息
     * 
     * @param id 教材主键
     * @return 结果
     */
    @Override
    public int deleteJcById(Long id)
    {
        return jcMapper.deleteJcById(id);
    }

    @Override
    public int auditJc(Jc jc) {
        return jcMapper.auditJc(jc);
    }


}
