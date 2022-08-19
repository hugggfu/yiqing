package com.dzl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dzl.controller.dto.UserDTO;
import com.dzl.entity.Role;
import com.dzl.entity.User;
import com.dzl.mapper.UserMapper;
import com.dzl.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 都忠良
 * @since 2022-07-14
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {


}
