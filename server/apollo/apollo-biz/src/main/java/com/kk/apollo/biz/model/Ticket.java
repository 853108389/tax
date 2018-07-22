package com.kk.apollo.biz.model;

public class Ticket {
    private Integer id;

    private String tnumber;

    private String tmoney;

    private String tcode;

    private String tdate;

    private String tnopass;

    private String tpass;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTnumber() {
        return tnumber;
    }

    public void setTnumber(String tnumber) {
        this.tnumber = tnumber == null ? null : tnumber.trim();
    }

    public String getTmoney() {
        return tmoney;
    }

    public void setTmoney(String tmoney) {
        this.tmoney = tmoney == null ? null : tmoney.trim();
    }

    public String getTcode() {
        return tcode;
    }

    public void setTcode(String tcode) {
        this.tcode = tcode == null ? null : tcode.trim();
    }

    public String getTdate() {
        return tdate;
    }

    public void setTdate(String tdate) {
        this.tdate = tdate == null ? null : tdate.trim();
    }

    public String getTnopass() {
        return tnopass;
    }

    public void setTnopass(String tnopass) {
        this.tnopass = tnopass == null ? null : tnopass.trim();
    }

    public String getTpass() {
        return tpass;
    }

    public void setTpass(String tpass) {
        this.tpass = tpass == null ? null : tpass.trim();
    }
}