package com.dzl.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.models.auth.In;
import lombok.Data;

@TableName("role_menu")
@Data
public class RoleMenu {

    private Integer roleId;
    private Integer menuId;
}
