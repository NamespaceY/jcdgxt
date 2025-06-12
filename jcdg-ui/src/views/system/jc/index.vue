<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="书目id" prop="smId">
        <el-input
          v-model="queryParams.smId"
          placeholder="请输入书目id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
      <el-form-item label="教材名称" prop="jcMc">
        <el-input
          v-model="queryParams.jcMc"
          placeholder="请输入教材名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:jc:add']"
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
          v-hasPermi="['system:jc:edit']"
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
          v-hasPermi="['system:jc:remove']"
        >删除</el-button>
      </el-col>
<!--      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:jc:export']"
        >导出</el-button>
      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="jcList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="书目名称" align="center" prop="smmc" />
      <el-table-column label="教材名称" align="center" prop="jcMc" />
      <el-table-column label="教材简介" align="center" prop="jcJj" />
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
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:jc:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:jc:remove']">删除</el-button>
          <el-button size="mini" type="text" icon="el-icon-share" @click="handleSelect(scope.row)" v-hasPermi="['system:jcSelect:add']"
            :disabled="scope.row.isSelected == 1">选定教材</el-button>
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

    <!-- 添加或修改教材对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <!--<el-form-item label="书目id" prop="smId">
          <el-input v-model="form.smId" placeholder="请输入书目id" />
        </el-form-item>-->
          <el-form-item label="书目" prop="smId">
            <el-select v-model="form.smId" placeholder="请选择书目">
              <el-option
                v-for="item in smOptions"
                :key="item.id"
                :label="item.smmc"
                :value="item.id"
              ></el-option>
            </el-select>
          </el-form-item>
        <el-form-item label="教材名称" prop="jcMc">
          <el-input v-model="form.jcMc" placeholder="请输入教材名称" />
        </el-form-item>
        <el-form-item label="教材简介" prop="jcJj">
          <el-input v-model="form.jcJj" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="教材封面" prop="img">
          <el-upload class="avatar-uploader" :http-request="httpRequest" accept=".jpg,.jpeg,.png,.gif" action="lei" :show-file-list="false"
                     :before-upload="beforeAvatarUpload">
            <img v-if="form.img" :src="form.img" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            <span class="delSpan" @click.stop="delImg" v-if="form.img">
                <i class="el-icon-delete"></i>
              </span>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listJc, getJc, delJc, addJc, updateJc, listSm, uploadFile, selectJc} from "@/api/system/jc";
export default {
  name: "Jc",
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
      // 教材表格数据
      jcList: [],
      // 书目选项
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        smId: null,
        jcMc: null,
        jcJj: null,
        img: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      smOptions: [],
    };
  },
  created() {
    this.getList();
    this.getSm();
  },
  methods: {
    /** 查询教材列表 */
    getList() {
      this.loading = true;
      listJc(this.queryParams).then(response => {
        this.jcList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    //书目
    getSm() {
      listSm().then(response => {
        this.smOptions = response.data;
      });
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        smId: null,
        jcMc: null,
        jcJj: null,
        img: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.title = "添加教材";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getJc(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改教材";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateJc(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addJc(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除教材编号为"' + ids + '"的数据项？').then(function() {
        return delJc(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleSelect(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认选择教材编号为"' + ids + '"的数据项？').then(function() {
        return selectJc(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("选择成功");
      }).catch(() => {});
    },
    //上传图片
    httpRequest(item) {
      let formData = new FormData();
      formData.append('file', item.file);
      uploadFile(formData).then(response => {
        if (response.code == 200) {
          var url = "http://localhost:8080/" + response.data;
          console.info("url="+url);
          this.form.img = url;
        } else {
          this.$modal.msgError('response.msg')
        }
      });
    },
    //限制图片大小
    beforeAvatarUpload(file) {
      const isLt2M = file.size / 1024 / 1024 < 3;
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 3MB!');
      }
      return isLt2M;
    },
    //删除图片
    delImg() {
      this.form.supplierLogo = ''
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/jc/export', {
        ...this.queryParams
      }, `jc_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

<style scoped>
.avatar-uploader ::v-deep .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 150px;
  height: 160px;
  line-height: 160px;
  text-align: center;
}

.avatar {
  width: 150px;
  height: 160px;
  display: block;
}

.delSpan {
  width: 30px;
  height: 30px;
  display: block;
  position: absolute;
  top: 0;
  right: 0;
  cursor: pointer;
}

.delSpan i {
  font-size: 20px;
}

.showImg {
  display: block;
  max-width: 50px;
  max-height: 60px;
  margin: 0 auto;
}

.imgStyle {
  max-width: 350px;
  max-height: 449px;
  margin: auto;
  display: block;
}

.imgBox img {
  display: block;
  max-width: 250px;
  max-height: 300px;
}

::v-deep .el-dialog .center {
  max-height: 650px;
  overflow: auto;
}
</style>

