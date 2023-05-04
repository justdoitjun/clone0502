package com.kbstar.frame;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public interface KBService<K, V> {
    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     *
     */
    @Transactional // 첫번쨰가 정상이어도, 두번째가 실패면 자동 롤백 시켜준다. 데이터 조작하는 함수에만 써준다.
    public void register(V v) throws Exception;
    @Transactional // 첫번쨰가 정상이어도, 두번째가 실패면 자동 롤백 시켜준다. 데이터 조작하는 함수에만 써준다.
    public void remove(K k) throws Exception;
    @Transactional // 첫번쨰가 정상이어도, 두번째가 실패면 자동 롤백 시켜준다. 데이터 조작하는 함수에만 써준다.
    public void modify(V v) throws Exception;
    @Transactional(readOnly = true)
    public V get(K k) throws Exception;
    @Transactional(readOnly = true)
    public List<V> get() throws Exception;
}