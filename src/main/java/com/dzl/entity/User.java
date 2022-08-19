package com.dzl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * <p>
 *
 * </p>
 *
 * @author 都忠良
 * @since 2022-07-14
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
  public class User implements Serializable {

    private static final long serialVersionUID = 1L;

      /**
     * 编号
     */
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      /**
     * 姓名
     */
      private String name;

      /**
     * 电话
     */
      private String phone;

      /**
     * 地址
     */
      private String address;

      /**
     * 状态
     */
      private String state;

      /**
     * 确诊时间
     */
      private String time;

      /**
     * 创建时间
     */
      private Date createTime;


}
