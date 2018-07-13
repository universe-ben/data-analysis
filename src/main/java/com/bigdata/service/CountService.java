package com.bigdata.service;

import com.bigdata.model.Count_new;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CountService {
    List<Count_new> select();
    List<Count_new> select1();
}
