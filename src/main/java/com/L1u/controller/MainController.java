package com.L1u.controller;


import com.L1u.model.BlogEntity;
import com.L1u.model.UserEntity;
import com.L1u.repository.BlogRepository;
import com.L1u.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

@Controller
public class MainController {
    private static Logger logger = Logger.getLogger(MainController.class);
    //自动专配数据库接口，不需要再写原始的Connection来操作数据库
    @Autowired
    UserRepository userRepository;

    @Autowired
    BlogRepository blogRepository;


    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        return "index2";
    }
    @RequestMapping(value = "/index2",method = RequestMethod.GET)
    public String index2(){
        return "index2";
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index3(){
        return "index";
    }
    @RequestMapping(value = "/admin/users",method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap){
        //查询表中所有的记录
        List<UserEntity> userEntityList = userRepository.findAll();

        //将所有的记录传递给要返回的jsp页面，放在userList中
        modelMap.addAttribute("userList",userEntityList);
        //返回pages目录下的admin/users.jsp页面
        return "admin/users";
    }

    @RequestMapping(value = "/admin/users/add",method = RequestMethod.GET)
        public String addUser(){
        return "admin/addUser";
    }

    @RequestMapping(value = "/admin/users/addP",method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user")UserEntity userEntity){
        // 注意此处，post请求传递过来的是一个UserEntity对象，里面包含了该用户的信息
        // 通过@ModelAttribute()注解可以获取传递过来的'user'，并创建这个对象

        // 数据库中添加一个用户，该步暂时不会刷新缓存
        //userRepository.save(userEntity);

        // 数据库中添加一个用户，并立即刷新缓存
        userRepository.saveAndFlush(userEntity);

        return "redirect:/admin/users";
    }

    @RequestMapping(value = "/admin/users/show/{id}",method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer userId,ModelMap modelMap){

//       通过userId查找表示的用户
        UserEntity userEntity = userRepository.findOne(userId);

        modelMap.addAttribute("user",userEntity);
        return "admin/userDetail";
    }
    @RequestMapping(value = "/admin/users/update/{id}",method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer userId,ModelMap modelMap){

       //获取userId的用户
        UserEntity userEntity = userRepository.findOne(userId);

        modelMap.addAttribute("user",userEntity);
        return "admin/updateUser";
    }

    @RequestMapping(value = "/admin/users/updateP",method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("user")UserEntity userEntity){

        //更新用户信息
        userRepository.updateUser(userEntity.getNickname(),userEntity.getFirstName(),
                userEntity.getLastName(),userEntity.getPassword(),userEntity.getId());
        userRepository.flush();
        return "redirect:/admin/users";
    }
    @RequestMapping(value = "/admin/users/delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id")Integer userId){
        userRepository.delete(userId);
        userRepository.flush();
        return "redirect:/admin/users";
    }
    @RequestMapping(value = "/login2",method = RequestMethod.GET)
    public String login2(ModelMap modelMap){
        UserEntity userEntity = userRepository.findOne(2);
        List<BlogEntity> blogEntityList = blogRepository.findAll();
        Map<Integer,String> desc = new HashMap<Integer, String>(); //200字描述
        for(BlogEntity blog:blogEntityList){
            if (blog.getContent().length()>200){
                 desc.put(blog.getId(),blog.getContent().substring(0,203)+"...");
            }else{
                 desc.put(blog.getId(),blog.getContent());
            }
        }
        Map<String,List<BlogEntity>> map = toThree(blogEntityList);

        modelMap.addAttribute("user",userEntity);
        modelMap.addAttribute("blogs1",map.get("blogs1"));
        modelMap.addAttribute("blogs2",map.get("blogs2"));
        modelMap.addAttribute("blogs3",map.get("blogs3"));
        modelMap.addAttribute("desc",desc);
        return "index2";
    }
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(value = "/loginAction",method = RequestMethod.POST)
        public String loginAction(@RequestParam("nickname")String nickName,@RequestParam("password")String password,ModelMap modelMap){
            List<UserEntity> userEntityList = userRepository.findByNickname(nickName);
            int userId = userEntityList.get(0).getId();
//            logger.error("Nickname:"+nickName);
//            logger.error("Password:"+password);
//            logger.error("userEntityList.size():"+userEntityList.size());
//            logger.error("password:"+userEntityList.get(0).getPassword());
            if(userEntityList.size()>0) {
                if(userEntityList.get(0).getPassword().equals(password)){
                    modelMap.addAttribute("user",userEntityList.get(0));
                    List<BlogEntity> blogEntityList = blogRepository.findAll();
                    Map<Integer,String> desc = new HashMap<Integer, String>(); //200字描述
                    logger.error("blogEntityList.size:"+blogEntityList.size());
                    if(blogEntityList.size()>0) {
                        for(BlogEntity blog:blogEntityList){
                            if (blog.getContent().length()>200){
                                desc.put(blog.getId(),blog.getContent().substring(0,203)+"...");
                            }else{
                                desc.put(blog.getId(),blog.getContent());
                            }
                        }

                        Map<String, List<BlogEntity>> map = toThree(blogEntityList);
                        modelMap.addAttribute("blogs1", map.get("blogs1"));
                        modelMap.addAttribute("blogs2", map.get("blogs2"));
                        modelMap.addAttribute("blogs3", map.get("blogs3"));
                        modelMap.addAttribute("desc",desc);
                    }
                    return "index2";}
                    return "redirect:/login";
            }else{
                return "redirect:/login";}
        }


        private Map<String,List<BlogEntity>> toThree(List<BlogEntity> blogEntityList){
            List<BlogEntity> blogs1 = new ArrayList<BlogEntity>();
            List<BlogEntity> blogs2 = new ArrayList<BlogEntity>();
            List<BlogEntity> blogs3 = new ArrayList<BlogEntity>();
            int max = blogEntityList.size()/3;
            System.out.println(max);
            for(int i = 0 ; i <= max; i++){
                if(3*i<blogEntityList.size())
                    blogs1.add(blogEntityList.get(3*i));
                if(3*i+1<blogEntityList.size())
                    blogs2.add(blogEntityList.get(3*i+1));
                if(3*i+2<blogEntityList.size())
                    blogs3.add(blogEntityList.get(3*i+2));
            }
            Map<String,List<BlogEntity>> map = new HashMap<>();
            map.put("blogs1",blogs1);
            map.put("blogs2",blogs2);
            map.put("blogs3",blogs3);
    return map;

    }
    }


