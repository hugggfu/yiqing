package com.dzl.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("dict")
@Data
public class Dict {
    private String name;
    private String value;
    private String type;
}
