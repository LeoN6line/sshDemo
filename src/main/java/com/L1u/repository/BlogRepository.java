package com.L1u.repository;

import com.L1u.model.BlogEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.repository.query.Param;
import java.util.Date;
import java.util.List;

public interface BlogRepository  extends JpaRepository<BlogEntity,Integer>{
    @Modifying
    @Transactional
    @Query("update BlogEntity blog set blog.title=:qTitle, blog.userByUserId.id=:qUserId," +
            " blog.content=:qContent, blog.pubDate=:qPubDate where blog.id=:qId")
    void updateBlog(@Param("qTitle") String title, @Param("qUserId") Integer userId, @Param("qContent") String content,
                    @Param("qPubDate") Date pubDate, @Param("qId") Integer id);
    List<BlogEntity> findByUserByUserId(@Param("qUserId") Integer userId);
}
