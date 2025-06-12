package com.jcdg.system.service.impl;

import java.util.List;
import com.jcdg.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jcdg.system.mapper.SmMapper;
import com.jcdg.system.domain.Sm;
import com.jcdg.system.service.ISmService;

/**
 * 书目Service业务层处理
 * 
 * @author ddd
 * @date 2024-03-25
 */
@Service
public class SmServiceImpl implements ISmService 
{
    @Autowired
    private SmMapper smMapper;

    /**
     * 查询书目
     * 
     * @param id 书目主键
     * @return 书目
     */
    @Override
    public Sm selectSmById(Long id)
    {
        return smMapper.selectSmById(id);
    }

    /**
     * 查询书目列表
     * 
     * @param sm 书目
     * @return 书目
     */
    @Override
    public List<Sm> selectSmList(Sm sm)
    {
        return smMapper.selectSmList(sm);
    }

    /**
     * 新增书目
     * 
     * @param sm 书目
     * @return 结果
     */
    @Override
    public int insertSm(Sm sm)
    {
        sm.setCreateTime(DateUtils.getNowDate());
        return smMapper.insertSm(sm);
    }

    /**
     * 修改书目
     * 
     * @param sm 书目
     * @return 结果
     */
    @Override
    public int updateSm(Sm sm)
    {
        sm.setUpdateTime(DateUtils.getNowDate());
        return smMapper.updateSm(sm);
    }

    /**
     * 批量删除书目
     * 
     * @param ids 需要删除的书目主键
     * @return 结果
     */
    @Override
    public int deleteSmByIds(Long[] ids)
    {
        return smMapper.deleteSmByIds(ids);
    }

    /**
     * 删除书目信息
     * 
     * @param id 书目主键
     * @return 结果
     */
    @Override
    public int deleteSmById(Long id)
    {
        return smMapper.deleteSmById(id);
    }
}
