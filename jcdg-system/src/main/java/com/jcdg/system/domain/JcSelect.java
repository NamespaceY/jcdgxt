package com.jcdg.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jcdg.common.annotation.Excel;
import com.jcdg.common.core.domain.BaseEntity;
import org.springframework.data.annotation.Transient;

/**
 * 教材选择对象 t_jc_select
 * 
 * @author jcdg
 * @date 2024-03-30
 */
public class JcSelect extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 教材ID */
    @Excel(name = "教材ID")
    private Long jcId;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private Long auditStatus;

    /** 审核人 */
    @Excel(name = "审核人")
    private String auditBy;

    @Transient
    @Excel(name = "教材名称")
    private String jcmc;

    @Transient
    @Excel(name = "教材封面")
    private String img;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date auditTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setJcId(Long jcId) 
    {
        this.jcId = jcId;
    }

    public Long getJcId() 
    {
        return jcId;
    }
    public void setAuditStatus(Long auditStatus) 
    {
        this.auditStatus = auditStatus;
    }

    public Long getAuditStatus() 
    {
        return auditStatus;
    }
    public void setAuditBy(String auditBy) 
    {
        this.auditBy = auditBy;
    }

    public String getAuditBy() 
    {
        return auditBy;
    }
    public void setAuditTime(Date auditTime) 
    {
        this.auditTime = auditTime;
    }

    public Date getAuditTime() 
    {
        return auditTime;
    }

    public String getJcmc() {
        return jcmc;
    }

    public void setJcmc(String jcmc) {
        this.jcmc = jcmc;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "JcSelect{" +
                "id=" + id +
                ", jcId=" + jcId +
                ", auditStatus=" + auditStatus +
                ", auditBy='" + auditBy + '\'' +
                ", jcmc='" + jcmc + '\'' +
                ", img='" + img + '\'' +
                ", auditTime=" + auditTime +
                '}';
    }
}
