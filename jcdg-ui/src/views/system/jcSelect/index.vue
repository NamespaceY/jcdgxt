<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="教材ID" prop="jcId">
        <el-input
          v-model="queryParams.jcId"
          placeholder="请输入教材ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核人" prop="auditBy">
        <el-input
          v-model="queryParams.auditBy"
          placeholder="请输入审核人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核时间" prop="auditTime">
        <el-date-picker clearable
          v-model="queryParams.auditTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择审核时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
<!--    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:jcSelect:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:jcSelect:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:jcSelect:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:jcSelect:export']"
        >导出</el-button>
      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="jcSelectList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="主键ID" align="center" prop="id" />-->
      <el-table-column label="教材名称" align="center" prop="jcmc" />
      <el-table-column label="教材封面" align="center" prop="img" width="90">
        <template slot-scope="scope">
          <div>
            <div v-if="scope.row.img" >
              <el-popover placement="right" max-width="350" trigger="hover">
                <div class="imgBox">
                  <img :src="scope.row.img" alt="" />
                </div>
                <p slot="reference" class="hoverStyle cursor">
                  <img class="showImg" :src="scope.row.img" alt="" />
                </p>
              </el-popover>
            </div>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="课程负责人" align="center" prop="createBy" />
      <el-table-column label="审核状态" align="center" prop="deptAudit">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.audit_status" :value="scope.row.auditStatus" />
        </template>
      </el-table-column>
      <el-table-column label="审核人" align="center" prop="auditBy" />
      <el-table-column label="审核时间" align="center" prop="auditTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
<!--          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:jcSelect:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:jcSelect:remove']">删除</el-button>-->
          <el-button size="mini" type="text" icon="el-icon-s-check" @click="handleAudit(scope.row)" v-hasPermi="['system:jcSelect:audit']"
                     :disabled="null != scope.row.auditStatus" >审核</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改教材选择对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="教材ID" prop="jcId">
          <el-input v-model="form.jcId" placeholder="请输入教材ID" />
        </el-form-item>
        <el-form-item label="审核人" prop="auditBy">
          <el-input v-model="form.auditBy" placeholder="请输入审核人" />
        </el-form-item>
        <el-form-item label="审核时间" prop="auditTime">
          <el-date-picker clearable
            v-model="form.auditTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择审核时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog title="审核招聘信息" :visible.sync="openAuditStatus" width="700px" append-to-body
               :close-on-click-modal="false">
      <el-form ref="auditForm" :model="auditForm" label-width="110px">
        <el-form-item label="审核状态" prop="auditStatus">
          <el-radio-group v-model="auditForm.auditStatus">
            <el-radio v-for="dict in auditStatusList" :key="dict.value" :label="dict.value">{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审核备注" prop="auditRemark">
          <el-input v-model="auditForm.auditRemark" :rows="8" type="textarea" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitAuditStatus">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listJcSelect, getJcSelect, delJcSelect, addJcSelect, updateJcSelect, audit } from "@/api/system/jcSelect";

export default {
  name: "JcSelect",
  dicts: ['audit_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 教材选择表格数据
      jcSelectList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        jcId: null,
        auditStatus: null,
        auditBy: null,
        auditTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      openAuditStatus: false,
      auditForm: {},
      auditStatusList: []
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询教材选择列表 */
    getList() {
      this.loading = true;
      listJcSelect(this.queryParams).then(response => {
        this.jcSelectList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.openAuditStatus = false
      //this.openDetails = false
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        jcId: null,
        createBy: null,
        createTime: null,
        auditStatus: null,
        auditBy: null,
        auditTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加教材选择";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getJcSelect(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改教材选择";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateJcSelect(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addJcSelect(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除教材选择编号为"' + ids + '"的数据项？').then(function() {
        return delJcSelect(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    // 打开审核
    handleAudit(row) {
      this.auditForm = {
        id: row.id,
        auditRemark: row.auditRemark,
        auditStatus: null,
      }
      if (row.auditStatus == null) {
        this.auditForm.auditStatus = '1'
      } else {
        this.auditForm.auditStatus = row.auditStatus
      }
      if (this.auditStatusList.length == 0) {
        this.setRadio()
      }
      this.openAuditStatus = true
    },
    setRadio() {
      this.dict.type.audit_status.forEach(item => {
        if (item.value != '0' && item.value != '3') {
          this.auditStatusList.push(item)
        }
      })
    },
    submitAuditStatus() {
      audit(this.auditForm).then(response => {
        this.$modal.msgSuccess("修改成功");
        this.cancel();
        this.getList();
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/jcSelect/export', {
        ...this.queryParams
      }, `jcSelect_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
