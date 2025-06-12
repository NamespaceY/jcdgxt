package com.jcdg.system.service;

import java.util.List;

import com.jcdg.system.domain.JcSelect;

/**
 * 教材选择Service接口
 * 
 * @author jcdg
 * @date 2024-03-30
 */
public interface IJcSelectService {

    /**
     * 查询教材选择
     * 
     * @param id 教材选择主键
     * @return 教材选择
     */
    public JcSelect selectJcSelectById(Long id);

    /**
     * 查询教材选择列表
     * 
     * @param jcSelect 教材选择
     * @return 教材选择集合
     */
    public List<JcSelect> selectJcSelectList(JcSelect jcSelect);

    /**
     * 新增教材选择
     * 
     * @param jcSelect 教材选择
     * @return 结果
     */
    public int insertJcSelect(JcSelect jcSelect);

    /**
     * 修改教材选择
     * 
     * @param jcSelect 教材选择
     * @return 结果
     */
    public int updateJcSelect(JcSelect jcSelect);

    /**
     * 批量删除教材选择
     * 
     * @param ids 需要删除的教材选择主键集合
     * @return 结果
     */
    public int deleteJcSelectByIds(Long[] ids);

    /**
     * 删除教材选择信息
     * 
     * @param id 教材选择主键
     * @return 结果
     */
    public int deleteJcSelectById(Long id);

    public List<JcSelect> selectJcSelectByJcId(Long jcId);

    public int auditJcSelect(JcSelect jcSelect);
}
