package com.dzl.service;

import com.dzl.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 都忠良
 * @since 2022-07-28
 */
public interface IRoleService extends IService<Role> {

    Role login(Role role);
    Role register(Role role);
}
