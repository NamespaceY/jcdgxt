package com.jcdg.system.service;

import java.util.List;
import com.jcdg.system.domain.Sm;

/**
 * 书目Service接口
 * 
 * @author ddd
 * @date 2024-03-25
 */
public interface ISmService 
{
    /**
     * 查询书目
     * 
     * @param id 书目主键
     * @return 书目
     */
    public Sm selectSmById(Long id);

    /**
     * 查询书目列表
     * 
     * @param sm 书目
     * @return 书目集合
     */
    public List<Sm> selectSmList(Sm sm);

    /**
     * 新增书目
     * 
     * @param sm 书目
     * @return 结果
     */
    public int insertSm(Sm sm);

    /**
     * 修改书目
     * 
     * @param sm 书目
     * @return 结果
     */
    public int updateSm(Sm sm);

    /**
     * 批量删除书目
     * 
     * @param ids 需要删除的书目主键集合
     * @return 结果
     */
    public int deleteSmByIds(Long[] ids);

    /**
     * 删除书目信息
     * 
     * @param id 书目主键
     * @return 结果
     */
    public int deleteSmById(Long id);
}
