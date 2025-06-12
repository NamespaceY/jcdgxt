package com.jcdg.system;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jcdg.common.annotation.Excel;
import com.jcdg.common.core.domain.BaseEntity;

/**
 * 采购单对象 t_jc_cg
 * 
 * @author jcdg
 * @date 2024-03-31
 */
public class JcCg extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 教材ID */
    @Excel(name = "教材ID")
    private Long jcId;

    /** 采购数量  */
    @Excel(name = "采购数量 ")
    private Long count;

    /** 是否支付 */
    @Excel(name = "是否支付")
    private Long isPay;

    /** 付款时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "付款时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

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
    public void setCount(Long count) 
    {
        this.count = count;
    }

    public Long getCount() 
    {
        return count;
    }
    public void setIsPay(Long isPay) 
    {
        this.isPay = isPay;
    }

    public Long getIsPay() 
    {
        return isPay;
    }
    public void setPayTime(Date payTime) 
    {
        this.payTime = payTime;
    }

    public Date getPayTime() 
    {
        return payTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("jcId", getJcId())
            .append("count", getCount())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("isPay", getIsPay())
            .append("payTime", getPayTime())
            .toString();
    }
}
