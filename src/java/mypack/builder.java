/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;
import java.sql.*;
import java.util.*;

import mypack.Cars.CarBuilder;
/**
 *
 * @author Acer
 */
public class Cars {
    ConnectionPool c;

    String year;
    String make;
    String model;
    String vehno;
    String owner;
    int cid;
    int pid;
    int hid;

    public Cars(){

    }

    public Cars(String vehno, String make, String model,  String owner, String year, int cid, int pid, int hid) {

        this.vehno = vehno;
        this.make = make;
        this.model = model;
        this.owner = owner;
        this.year = year;
        this.cid = cid;
        this.pid = pid;
        this.hid = hid;
    }

    class CarBuilder{
    private Cars car = new Cars();
    
    /* method to get car object */
    public Cars getCar(){
        return car;
    }
    
    public CarBuilder setvehno(String vehno){
        car.vehno = vehno;
        return this;
    }
    public CarBuilder setmodel(String model){
        car.model = model;
        return this;
    }
    public CarBuilder setmake(String make){
        car.make = make;
        return this;
    }
    public CarBuilder setowner(String owner){
        car.owner = owner;
        return this;
    }
    public CarBuilder setyear(String year){
        car.year = year;
        return this;
    }
    public CarBuilder setcid(int cid){
        car.cid = cid;
        return this;
    }
    public CarBuilder setpid(int pid){
        car.pid = pid;
        return this;
    }
    public CarBuilder sethid(int hid){
        car.hid = hid;
        return this;
    }
    

    public Cars build(){
        return car;
    }
    }   
    

    //start of
    public boolean add() {
        int x = 0;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            Cars car = new Cars();
            String sql = "insert into cars values(" + car.vehno + ",'" + car.make + "','" + car.model+"','" + car.owner+"','"+ car.year+"',"+car.cid+","+car.pid+","+car.hid+")";
            System.out.println(sql);
            int y = 0;
            y = stmt.executeUpdate(sql);
            if (y == 0) {
                c.putConnection(conn);
                return false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        c.putConnection(conn);
        return true;
    }

    public boolean update() {
        int y = 0;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            
            String sql = "update cars set vehno='" + car.vehno + "', make='" + car.make +"', model='" +car.model+"', owner='" + car.owner+"', year='"+car.year+"', cid='"+car.cid+"', pid='"+car.pid+"', hid='"+car.hid;

            y = stmt.executeUpdate(sql);

            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        if (y == 0) {
            return false;
        } else {
            return true;
        }
    }

    public boolean delete() {
        int x = 0;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "delete from cars where vehno=" + car.vehno();
            x = stmt.executeUpdate(sql);
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        if (x == 0) {
            return false;
        } else {
            return true;
        }
    }
    public static Vector getRecords() {
        Vector rows = new Vector();
        ConnectionPool c = null;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "Select * from cars";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getString(1));
                cr.addElement(rs.getString(2));
                cr.addElement(rs.getString(3));
                cr.addElement(rs.getString(4));
                cr.addElement(rs.getString(5));
                cr.addElement(rs.getInt(6));
                cr.addElement(rs.getInt(7));
                cr.addElement(rs.getInt(8));
                rows.addElement(cr);
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }




    public static String getCarany()
    {
    String rows =new String();
    try{
    ConnectionPool c = null;
    Connection conn = null;
    if(c == null)
    {
    c = ConnectionPool.getInstance();
    c.initialize();
    }
    conn = c.getConnection();
    Statement stmt = conn.createStatement();
    String sql = "select *  from cars ";
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
    rows+= " <option value="+rs.getInt(1)+"> " +"  "+rs.getString(2)   +"</option>\n";
    }
    c.putConnection(conn) ;
    }
    catch(Exception e)
    {
    System.out.println(e);
    }
    return rows;
    }


    public static Cars getRecord(String vehno) {
        Cars obj = new Cars();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from cars where vehno=" + vehno;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new Cars(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
            c.putConnection(conn);
            System.out.println(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
    }
}
    public class builder{
        public static void main(String args[]){
            CarBuilder cb = new CarBuilder();
            Cars newcar = cb.setvehno("ka51mn1234").setmodel("toyota").setmake("glanza").setowner("dheeraj").setcid(5).setpid(1).sethid(8).build();
            System.out.println("Your new car is "+newcar.vehno+" in color");
        }
        }
