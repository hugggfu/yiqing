package com.dzl.service;

import com.dzl.entity.Menu;
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
public interface IMenuService extends IService<Menu> {

    List<Menu> findMenus(String name);
}
