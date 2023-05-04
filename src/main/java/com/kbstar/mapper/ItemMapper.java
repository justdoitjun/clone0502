package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Item;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ItemMapper extends KBMapper<Integer, Item> {
    Page<Item> getpage() throws Exception;
    //독특한 것은 Page라는 객체에 담는다. Page는 pom.xml에 선언 담음.
}
