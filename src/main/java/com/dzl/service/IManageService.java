package com.dzl.service;

import com.dzl.entity.Manage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 都忠良
 * @since 2022-08-03
 */
public interface IManageService extends IService<Manage> {

    void setRoleMenu(Integer roleId, List<Integer> menuIds);

    List<Integer> getRoleMenu(Integer roleId);
}
