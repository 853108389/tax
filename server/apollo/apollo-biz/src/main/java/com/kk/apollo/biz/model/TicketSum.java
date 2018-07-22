package com.kk.apollo.biz.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class TicketSum {
    private String year;
    private String pass;
    private String nopass;
    private String passperc;//通过比例
    private String sumMoney;//总额
}