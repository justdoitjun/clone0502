package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;


@Slf4j
@Controller
@RequestMapping("/cust")
public class CustController {
    //Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    @Autowired
    CustService custService;
    String dir = "cust/";
    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        //logger.info("---------");//로그 찍자
        Random r = new Random();
        int inx = r.nextInt(1000) + 1;
        log.info(inx+"");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir + "add");
        return "index";
    }
    @RequestMapping("/all")
    public String all(Model model) {
        List<Cust> list = new ArrayList<>();
        try {
            list = custService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("clist", list);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"all");
        return "index";
    }
    @RequestMapping("/get")
    public String get(Model model, String id) {
        Cust cust = new Cust("id01","pwd01", "James Lebron");
        model.addAttribute("gcust", cust);

        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir + "get");
        return "index";
    }
    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Cust> p;
        try {
            p = new PageInfo<>(custService.getPage(pageNo), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("target", "cust");
        model.addAttribute("cpage",p);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"allpage");
        return "index";
    }


}
