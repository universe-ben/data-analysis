/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: CountServiceImpl
 * Author:   aa806
 * Date:     2018/4/14 15:52
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.bigdata.service.impl;

import com.bigdata.dao.CountDao;
import com.bigdata.model.Count_new;
import com.bigdata.service.CountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author aa806
 * @create 2018/4/14
 * @since 1.0.0
 */
@Service("CountService")
public class CountServiceImpl implements CountService{
    @Autowired
    private CountDao countDao;
    @Override
    public List<Count_new> select() {
       return countDao.select();
    }

    @Override
    public List<Count_new> select1() {
        return countDao.select1();
    }
}