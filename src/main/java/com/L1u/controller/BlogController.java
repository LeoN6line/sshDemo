package com.L1u.controller;


import com.L1u.model.BlogEntity;
import com.L1u.model.UserEntity;
import com.L1u.repository.BlogRepository;
import com.L1u.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.logging.Logger;

@Controller
public class BlogController {
    private static Logger logger = Logger.getLogger(BlogController.class.getName());

    @Autowired
    BlogRepository blogRepository ;
    @Autowired
    UserRepository userRepository ;

//    查找到所有的博客
    @RequestMapping(value = "/admin/blogs",method = RequestMethod.GET)
    public String showBlogs(ModelMap modelMap){
        List<BlogEntity> blogEntityList = blogRepository.findAll();
        modelMap.addAttribute("blogList",blogEntityList);
        return "admin/blogs";

    }

//    添加blog
    @RequestMapping(value = "/admin/blogs/add",method = RequestMethod.GET)
    public String addBlog(ModelMap modelMap){
        List<UserEntity> userEntityList = userRepository.findAll();
        modelMap.addAttribute("userList",userEntityList);
        return "admin/addBlog";
    }

//    添加blog响应 重定向查看日志
    @RequestMapping(value = "/admin/blogs/addP",method = RequestMethod.POST)
    public String addBlogPost(@ModelAttribute("blog")BlogEntity blogEntity){
        System.out.println(blogEntity.getTitle());
        System.out.println(blogEntity.getUserByUserId().getNickname());

        blogRepository.saveAndFlush(blogEntity);
        return "redirect:/admin/blogs";
    }
//    查看详情blog
    @RequestMapping(value = "/admin/blogs/show/{id}",method = RequestMethod.GET)
    public String showBlog(@PathVariable("id")Integer blogId,ModelMap modelMap){
        BlogEntity blogEntity = blogRepository.findOne(blogId);
        modelMap.addAttribute("blog",blogEntity);
        return "admin/blogDetail";
    }

//    更新修改
    @RequestMapping(value = "/admin/blogs/update/{id}",method = RequestMethod.GET)
    public String updateBlog(@PathVariable("id")Integer blogId,ModelMap modelMap){
        BlogEntity blog = blogRepository.findOne(blogId);
        List<UserEntity> userList = userRepository.findAll();
        modelMap.addAttribute("blog", blog);
        modelMap.addAttribute("userList", userList);
        return "admin/updateBlog";
    }
//    更新修改响应
    @RequestMapping(value = "/admin/blogs/updateP",method = RequestMethod.POST)
    public String updatePost(@ModelAttribute("blog")BlogEntity blogEntity){
        blogRepository.updateBlog(blogEntity.getTitle(), blogEntity.getUserByUserId().getId(),blogEntity.getContent(),blogEntity.getPubDate(),blogEntity.getId());
        blogRepository.flush();
        return "redirect:/admin/blogs";
    }

//    删除
    @RequestMapping(value = "/admin/blogs/delete/{id}",method = RequestMethod.GET)
    public String deleteBlog(@PathVariable("id")Integer blogId){
        blogRepository.delete(blogId);
        blogRepository.flush();
        return "redirect:/admin/blogs";
    }
}
