package com.kk.apollo.biz.service.impl;

import com.kk.apollo.biz.dao.TicketDao;
import com.kk.apollo.biz.model.*;
import com.kk.apollo.biz.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/4/15.
 */
@Service
public class TicketServiceImpl implements TicketService {
    @Autowired
    TicketDao ticketDao;

    @Override
public boolean firstChecked(String tnumber) {
    Ticket ticket = findTicketByTnumber(tnumber);
    if (ticket == null) {
        return true;
    }
    return false;
}

    @Override
    public Ticket findTicketByTnumber(String tnumber) {
        return ticketDao.findTicketByTnumber(tnumber);
    }

    @Override
    public void insetTicket(Ticket ticket) {
        ticketDao.insert(ticket);
    }

    @Override
    public void updateTicket(Ticket findTicket) {
        ticketDao.updateByPrimaryKey(findTicket);
    }

    @Override
    public int findPass() {
        return  ticketDao.findTicketPass();
    }

    @Override
    public int findnoPass() {
        return ticketDao.findTickeyNopass();
    }

    @Override
    public List<Ticket> findByYears(String startYear, String endYear) {
        return ticketDao.findByYears(startYear,endYear);
    }

    @Override
    public TicketSum findSumByYear(String year) {
        return ticketDao.findSumByYear(year);
    }


}
