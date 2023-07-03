package com.Kim.blog.repository;

import com.Kim.blog.model.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface BoardRepository extends JpaRepository<Board, Integer> {

    @Modifying
    @Query("update Board b set b.count = b.count + 1 where b.id = :id")
    void updateHit(Integer id);
}
