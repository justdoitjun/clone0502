package com.kbstar.service;

import com.kbstar.dto.Adm;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.AdmMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdmService implements KBService<String, Adm> {

    @Autowired
    AdmMapper mapper;

    /**
     * @param adm
     * @throws Exception
     */
    @Override
    public void register(Adm adm) throws Exception {
        mapper.insert(adm);
    }

    /**
     * @param s
     * @throws Exception
     */
    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    /**
     * @param adm
     * @throws Exception
     */
    @Override
    public void modify(Adm adm) throws Exception {
        mapper.update(adm);
    }

    /**
     * @param s
     * @return
     * @throws Exception
     */
    @Override
    public Adm get(String s) throws Exception {
        return mapper.select(s);
    }

    /**
     * @return
     * @throws Exception
     */
    @Override
    public List<Adm> get() throws Exception {
        return mapper.selectall();
    }
}
