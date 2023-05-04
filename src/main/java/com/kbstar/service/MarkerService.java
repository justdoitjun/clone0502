package com.kbstar.service;


import com.kbstar.dto.Marker;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.MarkerMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class MarkerService implements KBService<String, Marker> {
    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     *
     * @param marker
     */

    @Autowired
    MarkerMapper mapper;

    @Override
    public void register(Marker marker) throws Exception {
        mapper.insert(marker);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Marker marker) throws Exception {
        mapper.update(marker);
    }

    @Override
    public Marker get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Marker> get() throws Exception {
        return mapper.selectall();
    }
}
