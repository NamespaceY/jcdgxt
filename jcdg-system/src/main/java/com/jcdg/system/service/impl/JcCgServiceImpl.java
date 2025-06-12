package com.jcdg.system.service.impl;

import java.util.List;
import com.jcdg.common.utils.DateUtils;
import com.jcdg.system.domain.JcCg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jcdg.system.mapper.JcCgMapper;
import com.jcdg.system.service.IJcCgService;

/**
 * 采购单Service业务层处理
 * 
 * @author jcdg
 * @date 2024-03-31
 */
@Service
public class JcCgServiceImpl implements IJcCgService {

    @Autowired
    private JcCgMapper jcCgMapper;

    /**
     * 查询采购单
     * 
     * @param id 采购单主键
     * @return 采购单
     */
    @Override
    public JcCg selectJcCgById(Long id)
    {
        return jcCgMapper.selectJcCgById(id);
    }

    /**
     * 查询采购单列表
     * 
     * @param jcCg 采购单
     * @return 采购单
     */
    @Override
    public List<JcCg> selectJcCgList(JcCg jcCg)
    {
        return jcCgMapper.selectJcCgList(jcCg);
    }

    /**
     * 新增采购单
     * 
     * @param jcCg 采购单
     * @return 结果
     */
    @Override
    public int insertJcCg(JcCg jcCg)
    {
        jcCg.setCreateTime(DateUtils.getNowDate());
        return jcCgMapper.insertJcCg(jcCg);
    }

    /**
     * 修改采购单
     * 
     * @param jcCg 采购单
     * @return 结果
     */
    @Override
    public int updateJcCg(JcCg jcCg)
    {
        return jcCgMapper.updateJcCg(jcCg);
    }

    /**
     * 批量删除采购单
     * 
     * @param ids 需要删除的采购单主键
     * @return 结果
     */
    @Override
    public int deleteJcCgByIds(Long[] ids)
    {
        return jcCgMapper.deleteJcCgByIds(ids);
    }

    /**
     * 删除采购单信息
     * 
     * @param id 采购单主键
     * @return 结果
     */
    @Override
    public int deleteJcCgById(Long id)
    {
        return jcCgMapper.deleteJcCgById(id);
    }

    @Override
    public int pay(Long[] ids) {
        return jcCgMapper.pay(ids);
    }
}
