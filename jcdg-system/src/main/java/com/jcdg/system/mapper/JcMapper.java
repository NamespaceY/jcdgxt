package com.jcdg.system.mapper;

import java.util.List;

import com.jcdg.system.domain.Jc;

/**
 * 教材Mapper接口
 * 
 * @author jcdg
 * @date 2024-03-26
 */
public interface JcMapper 
{
    /**
     * 查询教材
     * 
     * @param id 教材主键
     * @return 教材
     */
    public Jc selectJcById(Long id);

    /**
     * 查询教材列表
     * 
     * @param jc 教材
     * @return 教材集合
     */
    public List<Jc> selectJcList(Jc jc);

    /**
     * 新增教材
     * 
     * @param jc 教材
     * @return 结果
     */
    public int insertJc(Jc jc);

    /**
     * 修改教材
     * 
     * @param jc 教材
     * @return 结果
     */
    public int updateJc(Jc jc);

    /**
     * 删除教材
     * 
     * @param id 教材主键
     * @return 结果
     */
    public int deleteJcById(Long id);

    /**
     * 批量删除教材
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteJcByIds(Long[] ids);

    public int auditJc(Jc jc);

}
