package com.dzl.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dzl.common.Constants;
import com.dzl.common.Result;
import com.dzl.entity.User;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.dzl.service.IRoleService;
import com.dzl.entity.Role;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 都忠良
 * @since 2022-07-28
 */
@RestController
@RequestMapping("/role")
        public class RoleController {

@Resource
private IRoleService roleService;
        @PostMapping
        public boolean save(@RequestBody Role role) {
                return roleService.saveOrUpdate(role);
        }
        @GetMapping("/username/{username}")
        public Result findOne(@PathVariable String username) {
                QueryWrapper<Role> queryWrapper=new QueryWrapper<>();
                queryWrapper.eq("username",username);
                return Result.success(roleService.getOne(queryWrapper));
        }
        @PostMapping("/login")
        public Result login(@RequestBody Role role) {
                String username = role.getUsername();
                String password = role.getPassword();
                if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) {
                        return Result.error(Constants.CODE_400,"参数错误");
                }
                return Result.success( roleService.login(role));
        }
        @PostMapping("/register")
        public Result register(@RequestBody Role role){
                String username = role.getUsername();
                String password = role.getPassword();
                if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) {
                        return Result.error(Constants.CODE_400,"参数错误");
                }
                return Result.success( roleService.register(role));
        }
        @DeleteMapping("/{id}")
        public Result delete(@PathVariable Integer id){
                roleService.removeById(id);
                return Result.success();
        }
        @PostMapping("/del/batch")
        public Result deleteBatch(@RequestBody List<Integer> ids) {
                roleService.removeByIds(ids);
                return Result.success();
        }
        @GetMapping
        public Result findAll() {
                return Result.success(roleService.list());
        }

        @GetMapping("/{id}")
        public Result findOne(@PathVariable Integer id) {
                return Result.success(roleService.getById(id));
        }

        @GetMapping("/page")
        public Result findPage(@RequestParam Integer pageNum,
                               @RequestParam Integer pageSize,
                               @RequestParam(defaultValue = "") String username,
                               @RequestParam(defaultValue = "") String password) {
                QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
                queryWrapper.orderByDesc("id");
                if (!"".equals(username)) {
                        queryWrapper.like("username", username);
                }
                if (!"".equals(password)) {
                        queryWrapper.like("password", password);
                }
                return Result.success(roleService.page(new Page<>(pageNum, pageSize), queryWrapper));
        }


}

