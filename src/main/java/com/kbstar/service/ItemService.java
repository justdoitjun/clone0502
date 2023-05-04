package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Item;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService implements KBService<Integer, Item> {
    @Autowired
    ItemMapper mapper;
    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     *
     * @param item
     */
    @Override
    public void register(Item item) throws Exception {
        mapper.insert(item);
    }
    /**
     * @param integer
     * @throws Exception
     */
    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    /**
     * @param item
     * @throws Exception
     */
    @Override
    public void modify(Item item) throws Exception {
        mapper.update(item);
    }

    /**
     * @param integer
     * @return
     * @throws Exception
     */
    @Override
    public Item get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    /**
     * @return
     * @throws Exception
     */
    @Override
    public List<Item> get() throws Exception {
        return mapper.selectall();
    }
    public Page<Item> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5); // 3: 한화면에 출력되는 개수
        return mapper.getpage();
    }
}
