package com.jcdg.system.mapper;

import java.util.List;
import com.jcdg.system.domain.Sm;

/**
 * 书目Mapper接口
 * 
 * @author ddd
 * @date 2024-03-25
 */
public interface SmMapper 
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
     * 删除书目
     * 
     * @param id 书目主键
     * @return 结果
     */
    public int deleteSmById(Long id);

    /**
     * 批量删除书目
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmByIds(Long[] ids);
}
