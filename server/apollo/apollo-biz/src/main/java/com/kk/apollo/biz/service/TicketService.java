package com.kk.apollo.biz.service;

import com.kk.apollo.biz.model.Ticket;
import com.kk.apollo.biz.model.TicketSum;

import java.util.List;

/**
 * Created by Administrator on 2017/4/15.
 */
public interface TicketService {

    public boolean firstChecked(String tnumber);

    public Ticket findTicketByTnumber(String tnumber);

    public void insetTicket(Ticket ticket);

    void updateTicket(Ticket findTicket);

    int findPass();

    int findnoPass();

    List<Ticket> findByYears(String startYear, String endYear);

    TicketSum findSumByYear(String year);
}
