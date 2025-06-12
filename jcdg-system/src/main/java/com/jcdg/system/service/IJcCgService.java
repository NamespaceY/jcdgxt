package com.jcdg.system.service;

import java.util.List;

import com.jcdg.system.domain.JcCg;

/**
 * 采购单Service接口
 * 
 * @author jcdg
 * @date 2024-03-31
 */
public interface IJcCgService {

    /**
     * 查询采购单
     * 
     * @param id 采购单主键
     * @return 采购单
     */
    public JcCg selectJcCgById(Long id);

    /**
     * 查询采购单列表
     * 
     * @param jcCg 采购单
     * @return 采购单集合
     */
    public List<JcCg> selectJcCgList(JcCg jcCg);

    /**
     * 新增采购单
     * 
     * @param jcCg 采购单
     * @return 结果
     */
    public int insertJcCg(JcCg jcCg);

    /**
     * 修改采购单
     * 
     * @param jcCg 采购单
     * @return 结果
     */
    public int updateJcCg(JcCg jcCg);

    /**
     * 批量删除采购单
     * 
     * @param ids 需要删除的采购单主键集合
     * @return 结果
     */
    public int deleteJcCgByIds(Long[] ids);

    /**
     * 删除采购单信息
     * 
     * @param id 采购单主键
     * @return 结果
     */
    public int deleteJcCgById(Long id);

    public int pay(Long[] ids);
}
