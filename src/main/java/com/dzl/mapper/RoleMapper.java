package com.dzl.mapper;

import com.dzl.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 都忠良
 * @since 2022-07-28
 */
public interface RoleMapper extends BaseMapper<Role> {
@Select("select id from manage where flag=#{flag}")
    Integer selectByFlag(@Param("flag") String flag);
}
