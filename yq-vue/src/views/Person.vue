<template>
<el-card style="width: 500px">
  <el-form label-width="80px" size="small">
    <el-form-item label="用户名">
      <el-input v-model="form.username" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="密码">
      <el-input v-model="form.password" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button @click="fanhui">返回</el-button>
      <el-button type="primary" @click="save">确 定</el-button>
    </el-form-item>
  </el-form>
</el-card>
</template>

<script>
export default {
  name: "Person",
  data(){
    return{
      form:{},
      user:localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}

    }
  },
  created() {
    this.request.get("/role/username/" +this.user.username).then(res=>{
      if(res.code=='200'){
        this.form=res.data;
      }

    })
  },
  methods:{
    save() {
      this.request.post("/role", this.form).then(res => {
        if (res) {
          this.$message.success("保存成功")

        } else {
          this.$message.error("保存失败")
        }
      })
    },
    fanhui(){
      this.$router.push("/home")
    }
  }
}
</script>

<style scoped>

</style>
