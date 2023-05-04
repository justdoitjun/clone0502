package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Cust;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CustMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CustService implements KBService<String, Cust> {
    @Autowired
    CustMapper mapper;


    @Override
    public void register(Cust cust) throws Exception {
        mapper.insert(cust);
        //mapper.insert(cust);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        mapper.update(cust);
    }

    @Override
    public Cust get(String k) throws Exception {
        return mapper.select(k);
    }

    @Override
    public List<Cust> get() throws Exception {
        return mapper.selectall();
    }
    public Page<Cust> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5); // 3: 한화면에 출력되는 개수
        return mapper.getpage();
    }
}
