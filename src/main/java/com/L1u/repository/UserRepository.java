package com.L1u.repository;

import com.L1u.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserEntity,Integer> {

    @Modifying  //说明该方法时修改操作
    @Transactional  //说明该方法是事务性方法
    //定义查询
    //@Param注解用于提取参数
    @Query("update UserEntity us set us.nickname =:qNickname,us.firstName =:qFirstname,us.lastName =:qLastname,us.password =:qPassword,us.id =:qId")
     void updateUser(@Param("qNickname")String nickname,@Param("qFirstname")String firstName,@Param("qLastname")String lastname,@Param("qPassword")String password,@Param("qId")Integer id);
     List<UserEntity> findByNickname(@Param("qNickname")String nickname);
}
