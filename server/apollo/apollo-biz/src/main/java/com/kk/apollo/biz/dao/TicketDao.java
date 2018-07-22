package com.kk.apollo.biz.dao;

import com.kk.apollo.biz.model.Ticket;
import com.kk.apollo.biz.model.TicketExample;
import java.util.List;

import com.kk.apollo.biz.model.TicketSum;
import org.apache.ibatis.annotations.Param;

public interface TicketDao {
    int countByExample(TicketExample example);

    int deleteByExample(TicketExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Ticket record);

    int insertSelective(Ticket record);

    List<Ticket> selectByExample(TicketExample example);

    Ticket selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Ticket record, @Param("example") TicketExample example);

    int updateByExample(@Param("record") Ticket record, @Param("example") TicketExample example);

    int updateByPrimaryKeySelective(Ticket record);

    int updateByPrimaryKey(Ticket record);

    Ticket findTicketByTnumber(String tnumber);

    int findTicketPass();

    int findTickeyNopass();

    List<Ticket> findByYears(String startYear, String endYear);

    TicketSum findSumByYear(String year);
}