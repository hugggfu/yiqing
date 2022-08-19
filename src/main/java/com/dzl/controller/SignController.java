package com.dzl.controller;


import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dzl.common.Result;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.dzl.service.ISignService;
import com.dzl.entity.Sign;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 都忠良
 * @since 2022-08-18
 */
@RestController
@RequestMapping("/sign")
        public class SignController {

@Resource
private ISignService signService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Sign sign) {
        if (sign.getId() == null) {  // 新增打卡
            String today = DateUtil.today();
            QueryWrapper<Sign> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user", sign.getUser());
            queryWrapper.eq("time", today);
            Sign one = signService.getOne(queryWrapper);
            if (one != null) {  // 打过卡了
                return Result.error("-1", "您已打过卡");
            }
            sign.setTime(today);
        }
        signService.saveOrUpdate(sign);
        return Result.success();
    }


@DeleteMapping("/{id}")
public Result delete(@PathVariable Integer id) {
    signService.removeById(id);
        return Result.success();
        }

@PostMapping("/del/batch")
public Result deleteBatch(@RequestBody List<Integer> ids) {
    signService.removeByIds(ids);
        return Result.success();
        }

@GetMapping
public Result findAll() {
        return Result.success(signService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(signService.getById(id));
        }

@GetMapping("/page")
public Result findPage(@RequestParam Integer pageNum,
@RequestParam Integer pageSize) {
        QueryWrapper<Sign> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        return Result.success(signService.page(new Page<>(pageNum, pageSize), queryWrapper));
        }

        }
