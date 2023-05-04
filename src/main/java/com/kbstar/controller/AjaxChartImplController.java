package com.kbstar.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.Random;

@RestController
public class AjaxChartImplController {
    //{'category':[], 'data':[]}
    @RequestMapping("/chart02")
    public Object chart02(){
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray1 = new JSONArray();
        for(int i=2011; i<=2023 ; i++){
            jsonArray1.add(i);
        }


        JSONArray jsonArray2 = new JSONArray();
        for(int i=1; i<=12;i++){
            Random r = new Random();
            int cnt = r.nextInt(1000) + 1;
            jsonArray2.add(cnt);
        }

        jsonObject.put("category", jsonArray1);
        jsonObject.put("data", jsonArray2);
        return jsonObject;
    }

    @RequestMapping("/chart0301")
    public Object chart0301(){
        JSONArray jsonOuterArray = new JSONArray();
        for(int i=1; i<=5; i++){
            Random r = new Random();
            int num = r.nextInt(10) + 1;
            JSONArray jsonInnerArray = new JSONArray();
            jsonInnerArray.add("data:" + num);
            jsonInnerArray.add(num);
            jsonOuterArray.add(jsonInnerArray);
        }
        return jsonOuterArray;
    }

    @RequestMapping("/chart0302")
    public Object chart0302(){
        JSONArray jsonArray = new JSONArray();
        for(int i=1; i<=100 ; i++){
            Random r = new Random();
            double num = Math.floor(r.nextDouble()*10)/10.0;
            jsonArray.add(num);
        }
        return jsonArray;
    }

    @RequestMapping("/chart0303")
    public Object chart0303(){
        JSONArray jsonOuterArray = new JSONArray();
        for(int i=1; i<=500 ; i++){
          JSONArray jsonInnerArray = new JSONArray();
          Random r = new Random();
          int num1 = r.nextInt(10) + 1;
          double num2 = r.nextDouble();
          jsonInnerArray.add(num1);
          jsonInnerArray.add(num2);
          jsonOuterArray.add(jsonInnerArray);
        }
        return jsonOuterArray;
    }

    @RequestMapping("/chart0501")
    public Object chart0501(String year){
        JSONArray jsonArray = new JSONArray();
        for(int i=1; i<=100; i++){
            Random r = new Random();
            int num = r.nextInt(100) + 1;
            jsonArray.add(num);
        }
        return jsonArray;
    }// DB 가 없으니깐 대충 흐름만 봐. 그냥 저 3가지는 안된다고 보낼 생각임.
}
