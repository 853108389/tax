package com.kk.apollo.controller;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

import com.kk.apollo.biz.model.Ticket;
import com.kk.apollo.biz.model.TicketSum;
import com.kk.apollo.biz.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.awt.image.BufferedImage;
import java.io.*;

import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.google.zxing.EncodeHintType;

import com.google.zxing.Result;
import sun.misc.BASE64Decoder;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/15.
 */
@Controller
@RequestMapping("/ticket")
public class TicketController {

    @Autowired
    TicketService ticketService;

    @RequestMapping("findSumByYear")
    public String findSumByYear(HttpServletRequest request,Model model){
        String year = request.getParameter("year");

        TicketSum ticketSum =  ticketService.findSumByYear(year);
        if (ticketSum != null) {
            ticketSum.setYear(year);
            int pass =Integer.parseInt(ticketSum.getPass());
            int nopass = Integer.parseInt(ticketSum.getNopass());
            Double passperc = 1.00*pass/(nopass + pass);
            ticketSum.setPassperc(passperc.toString());
        }
        model.addAttribute("ticketSum",ticketSum);
        return "count";
    }
    @RequestMapping("findByYears")
    public String findByYears(HttpServletRequest request,Model model){
        String startYear = request.getParameter("startYear");
        String endYear = request.getParameter("endYear");

        List<Ticket> tickets = ticketService.findByYears(startYear,endYear);
        model.addAttribute("tickets",tickets);
        return "search";
    }

    @RequestMapping("insert")
    public String insert(HttpServletRequest request) {
        //没加时间正则和表单验证
        String tnumer = request.getParameter("tnumer");
        String tmoney = request.getParameter("tmoney");
        String tcode = request.getParameter("tcode");
        String tdate = request.getParameter("tdate");
        System.out.println(tnumer);
        System.out.println(tmoney);
        System.out.println(tcode);
        System.out.println(tdate);
        if (tmoney == "" || tcode == "" || tdate == "") {
            //需要重新输入
            return "redirect:index";
        }

        Ticket findTicket = ticketService.findTicketByTnumber(tnumer);
        if (findTicket != null) {
            //发票不是第一次录入
            if (findTicket.getTcode().equals(tcode) && findTicket.getTdate().equals(tdate) && findTicket.getTmoney().equals(tmoney)) {
                //数据相同 验证成功
                Integer pass = Integer.parseInt(findTicket.getTpass()) + 1;
                findTicket.setTpass(pass.toString());
            } else {
                //验证失败
                Integer pass = Integer.parseInt(findTicket.getTnopass())+ 1 ;
                findTicket.setTnopass(pass.toString());
            }
            ticketService.updateTicket(findTicket);
        } else {
//            发票第一次录入
                Ticket ticket = new Ticket();
                ticket.setTnumber(tnumer);
                ticket.setTmoney(tmoney);
                ticket.setTcode(tcode);
                ticket.setTdate(tdate);
                ticket.setTpass("0");
                ticket.setTnopass("0");
                ticketService.insetTicket(ticket);
        }
        return "redirect:index";
    }

    @RequestMapping("toCount")
    public String toCount() {
        return "count";
    }

    @RequestMapping("toQdvideo")
    public String toQdvideo() {
        return "qdvideo";
    }

    @RequestMapping("toSearch")
    public String toSearch() {
        return "search";
    }

    @RequestMapping("toTable")
    public String toTable() {
        return "table";
    }

    @RequestMapping("toIndex")
    public String toIndex(Model model) {
        int pass = ticketService.findPass();
        int nopass = ticketService.findnoPass();
        model.addAttribute("pass",pass);
        model.addAttribute("nopass",nopass);
        return "index";
    }

    //解码
    @RequestMapping("decoderQRCode")
    public @ResponseBody
    String decoderQRCode(@RequestBody Map<String, String> map) {
        String time = map.get("time");
        byte[] bytes;//储存base64解码
        //获取图片的base64
        String imgStr = map.get("img");
        if (imgStr == null) // 图像数据为空
        {
            return "";
        }
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            // Base64解码
            bytes = decoder.decodeBuffer(imgStr);//解码
            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] < 0) {// 调整异常数据
                    bytes[i] += 256;
                }
            }
        } catch (Exception e) {
            return "";
        }
        //将字节写入流
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
        try {
            FileOutputStream fileOutputStream = new FileOutputStream("D:test.png");
            fileOutputStream.write(bytes);
            System.out.println("图片保存成功");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        MultiFormatReader formatReader = new MultiFormatReader();
//        File file = new File("D:/img.png");
        BufferedImage image = null;
        try {
            image = ImageIO.read(byteArrayInputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }


        BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image)));

        //定义二维码的参数:
        HashMap hints = new HashMap();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");//定义字符集

        Result result = null;//开始解析
        try {
            result = formatReader.decode(binaryBitmap, hints);
        } catch (NotFoundException e) {

            e.printStackTrace();
            return "";
        }
        if (result != null) {
            System.out.println("解析结果:" + result.toString());
            System.out.println("二维码的格式类型是:" + result.getBarcodeFormat());
            System.out.println("二维码的文本内容是:" + result.getText());
        }
        return " ";
    }


    ;
}
