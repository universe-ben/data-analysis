package com.bigdata.dao;

import com.bigdata.model.Count_new;

import java.util.List;

public interface CountDao {
    List<Count_new> select();
    List<Count_new> select1();
}
