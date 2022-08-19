package com.dzl.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dzl.common.Constants;
import com.dzl.entity.Menu;
import com.dzl.entity.Role;
import com.dzl.exception.ServiceException;
import com.dzl.mapper.RoleMapper;
import com.dzl.mapper.RoleMenuMapper;
import com.dzl.service.IMenuService;
import com.dzl.service.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dzl.utils.TokenUtils;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 都忠良
 * @since 2022-07-28
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    private static final Log LOG = Log.get();
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private RoleMenuMapper roleMenuMapper;
    @Resource
    private IMenuService menuService;
    @Override
    public Role login(Role role) {
        Role one=getUserInfo(role);
            if (one != null) {
                //设置token
                String token = TokenUtils.genToken(one.getId().toString(), one.getPassword());
                role.setToken(token);
                String role1 = one.getRole();
                List<Menu> roleMenus = getRoleMenus(role1);
                role.setMenus(roleMenus);
                return role;
            } else {
                throw new ServiceException(Constants.CODE_600, "用户名或密码错误");
            }
    }

    @Override
    public Role register(Role role) {
        Role one = getUserInfo(role);
        if(one == null){
            one=new Role();
            BeanUtil.copyProperties(role, one, true);
            save(one);
        } else {
            throw new ServiceException(Constants.CODE_600, "用户已存在");
        }
        return one;
    }
    private Role getUserInfo(Role role) {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", role.getUsername());
        queryWrapper.eq("password", role.getPassword());
        Role one;
        try {
            one = getOne(queryWrapper); // 从数据库查询用户信息
        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500, "系统错误");
        }
        return one;
    }
    /**
     * 获取当前角色的菜单列表
     * @param roleFlag
     * @return
     */
    private List<Menu> getRoleMenus(String roleFlag) {
        Integer roleId = roleMapper.selectByFlag(roleFlag);
        //当前用户所有的菜单id集合
        List<Integer> menuIds = roleMenuMapper.selectByRoleId(roleId);
        //查出系统所有的菜单
        List<Menu> menus = menuService.findMenus("");
        //new一个最后筛选完成的list
        List<Menu> roleMenus=new ArrayList<>();
        //筛选当前用户的菜单
        for (Menu menu : menus) {
            if(menuIds.contains(menu.getId())){
                roleMenus.add(menu);
            }
            List<Menu> children = menu.getChildren();
            // removeIf()  移除 children 里面不在 menuIds集合中的 元素
            children.removeIf(child -> !menuIds.contains(child.getId()));
        }
      return roleMenus;
    }
}
