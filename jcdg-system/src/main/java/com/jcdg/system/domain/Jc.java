package com.jcdg.system.domain;

import com.jcdg.common.annotation.Excel;
import com.jcdg.common.core.domain.BaseEntity;
import org.springframework.data.annotation.Transient;

/**
 * 教材对象 t_jc
 * 
 * @author jcdg
 * @date 2024-03-26
 */
public class Jc extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 书目id */
    @Excel(name = "书目id")
    private Long smId;

    /** 教材名称 */
    @Excel(name = "教材名称")
    private String jcMc;

    /** 教材简介 */
    @Excel(name = "教材简介")
    private String jcJj;

    /** 图片 */
    @Excel(name = "图片")
    private String img;

    @Transient
    private String smmc;

    @Transient
    private Integer isSelected;

    private Integer auditStatus;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSmId(Long smId) 
    {
        this.smId = smId;
    }

    public Long getSmId() 
    {
        return smId;
    }
    public void setJcMc(String jcMc) 
    {
        this.jcMc = jcMc;
    }

    public String getJcMc() 
    {
        return jcMc;
    }
    public void setJcJj(String jcJj) 
    {
        this.jcJj = jcJj;
    }

    public String getJcJj() 
    {
        return jcJj;
    }
    public void setImg(String img) 
    {
        this.img = img;
    }

    public String getImg() 
    {
        return img;
    }

    public Integer getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(Integer auditStatus) {
        this.auditStatus = auditStatus;
    }

    public Integer getIsSelected() {
        return isSelected;
    }

    public void setIsSelected(Integer isSelected) {
        this.isSelected = isSelected;
    }

    public String getSmmc() {
        return smmc;
    }

    public void setSmmc(String smmc) {
        this.smmc = smmc;
    }

    @Override
    public String toString() {
        return "Jc{" +
                "id=" + id +
                ", smId=" + smId +
                ", jcMc='" + jcMc + '\'' +
                ", jcJj='" + jcJj + '\'' +
                ", img='" + img + '\'' +
                ", smmc='" + smmc + '\'' +
                ", isSelected=" + isSelected +
                ", auditStatus=" + auditStatus +
                '}';
    }
}
