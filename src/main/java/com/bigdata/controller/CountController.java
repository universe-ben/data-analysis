/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: CountController
 * Author:   aa806
 * Date:     2018/4/14 15:51
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.bigdata.controller;

import com.alibaba.fastjson.JSONArray;
import com.bigdata.model.Count_new;
import com.bigdata.service.CountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.TreeMap;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author aa806
 * @create 2018/4/14
 * @since 1.0.0
 */
@Controller
@RequestMapping(value = "/count",produces="text/html;charset=UTF-8")
public class CountController {
    @Resource
    private CountService countService;

    @RequestMapping("/select")
    public void select(HttpServletResponse response, HttpServletRequest request) throws IOException {
       request.setCharacterEncoding("UTF-8");
       List<Count_new> list=countService.select();
       TreeMap<String, Integer> map = null;
        if(list!=null && list.size()>0){
            map = new TreeMap<String, Integer>();
            for (int i = 0; i < list.size(); i++) {
                map.put(String.valueOf(list.get(i).getProvince()), Integer.parseInt(String.valueOf(list.get(i).getValuexx())));
            }
        }
        String jsonString = JSONArray.toJSONString(map);
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(jsonString);
        response.getWriter().flush();
        response.getWriter().close();
    }

    @RequestMapping("/select1")
    public void select1(HttpServletResponse response, HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        List<Count_new> list=countService.select1();
        TreeMap<String, Integer> map = null;
        if(list!=null && list.size()>0){
            map = new TreeMap<String, Integer>();
            for (int i = 0; i < list.size(); i++) {
                map.put(String.valueOf(list.get(i).getProvince()), Integer.parseInt(String.valueOf(list.get(i).getValuexx())));
            }
        }
        String jsonString = JSONArray.toJSONString(map);
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(jsonString);
        response.getWriter().flush();
        response.getWriter().close();
    }

}