package mypack;

import java.sql.*;
import java.util.*;

public class policies {

    ConnectionPool c;
    private int Pid;
    private int Compid;
    private int Cid;
    private String Pname;
    private String Pdesc;

    public policies() {
    }

    public policies(int Pid, int Compid, int Cid, String Pname, String Pdesc) {
        this.Pid = Pid;
        this.Compid = Compid;
        this.Cid = Cid;
        this.Pname = Pname;
        this.Pdesc = Pdesc;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int Pid) {
        this.Pid = Pid;
    }

    public int getCompid() {
        return Compid;
    }

    public void setCompid(int Compid) {
        this.Compid = Compid;
    }

    public int getCid() {
        return Cid;
    }

    public void setCid(int Cid) {
        this.Cid = Cid;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String Pname) {
        this.Pname = Pname;
    }

    public String getPdesc() {
        return Pdesc;
    }

    public void setPdesc(String Pdesc) {
        this.Pdesc = Pdesc;
    }

    public boolean add() {
        int x = 0;
        int pdid = 0;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
          

            String sql = "insert into policies values(" + getPid() + "," + getCompid() + ", " + getCid() + ",'" + getPname() + "','" + getPdesc() + "')";
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
            String sql = "update policies set Compid=" + getCompid() +",Cid=" + getCid() + ",Pname='" + getPname() + "', Pdesc='" + getPdesc() + "' where Pid=" + getPid();

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
            String sql = "delete  from policies where Pid=" + getPid();
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
            String sql = "Select * from policies";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getInt(1));
                cr.addElement(rs.getInt(2));
                cr.addElement(rs.getInt(3));
                cr.addElement(rs.getString(4));
                cr.addElement(rs.getString(5));

                rows.addElement(cr);
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

    public static policies getRecord(int id) {
        policies obj = new policies();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from policies where Pid=" + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new policies(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5));
            c.putConnection(conn);
            System.out.println(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
    }


    public static String getPolicy() {
        String rows = new String();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select *  from policies ";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                rows += " <option value=" + rs.getInt(1) + "> " + "  " + rs.getString(4) + "</option>\n";
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

    /*public static String myDate2(String dt1)
    {
    int a = dt1.indexOf("-");
    int b = dt1.lastIndexOf("-");
    String yy=dt1.substring(0,a);
    String mm=dt1.substring(a+1,b);
    String dd=dt1.substring(b+1);
    String a1=dd+"-"+mm+"-"+yy;




    return a1;
    }




    public static String myDate1(String dt1)
    {
    int a = dt1.indexOf("-");
    int b = dt1.lastIndexOf("-");
    String dd=dt1.substring(0,a);
    String mm=dt1.substring(a+1,b);
    String yy=dt1.substring(b+1);
    String a1=yy+"-"+mm+"-"+dd;
    return a1;
    }


    public static String cDate(String dt)
    {
    String months[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
    int a = dt.indexOf("-");
    int b = dt.lastIndexOf("-");
    int c=dt.indexOf(" ");
    String yyyy=dt.substring(0,a);
    String mm=dt.substring(a+1,b);
    String dd=dt.substring(b+1,c);
    int x=Integer.parseInt(mm);
    String mmm=months[x-1];
    String a1=dd+"-"+mmm+"-"+yyyy;
    return a1;
    }*/

      public boolean  getCompnyrecords(int id) {
        
        ConnectionPool c = null;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "Select Pname,Pdesc from policies where Compid="+id+"";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                
               setPname(rs.getString(1));
               setPdesc(rs.getString(2));


            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return true;
    }
           public boolean  getCategoryrecords(int id) {

        ConnectionPool c = null;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "Select Pname,Pdesc from policies where cid="+id+"";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {

               setPname(rs.getString(1));
               setPdesc(rs.getString(2));


            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return true;
    }
    public static void main(String args[]) {

        policies p= new policies(2,11,3,"medical policy","insurance for medical");
        p.update();
      //  System.out.println(p.getCategoryrecords(1));
       // System.out.println(p.getPname());

        //policies p = new policies();
        //System.out.println("" + p.getPolicy());
    }
}
