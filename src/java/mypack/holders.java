package mypack;

import java.sql.*;
import java.util.*;

public class holders {

    ConnectionPool c;
    private int HolderId;
    private String Hname;
    private String Hadd;
    private String Hcity;
    private String Hstate;
    private String Hemail;
    private String Hmobile;
    private int PDid;

    public holders() {
    }

    public holders(int HolderId, String Hname, String Hadd, String Hcity, String Hstate, String Hemail, String Hmobile, int PDid) {
        this.HolderId = HolderId;
        this.Hname = Hname;
        this.Hadd = Hadd;
        this.Hcity = Hcity;
        this.Hstate = Hstate;
        this.Hemail = Hemail;
        this.Hmobile = Hmobile;
        this.PDid = PDid;
    }

    public String getHadd() {
        return Hadd;
    }

    public String getHcity() {
        return Hcity;
    }

    public String getHemail() {
        return Hemail;
    }

    public String getHmobile() {
        return Hmobile;
    }

    public String getHname() {
        return Hname;
    }

    public int getHolderId() {
        return HolderId;
    }

    public int getPDid() {
        return PDid;
    }

    public void setHadd(String Hadd) {
        this.Hadd = Hadd;
    }

    public void setHcity(String Hcity) {
        this.Hcity = Hcity;
    }

    public void setHemail(String Hemail) {
        this.Hemail = Hemail;
    }

    public void setHmobile(String Hmobile) {
        this.Hmobile = Hmobile;
    }

    public void setHname(String Hname) {
        this.Hname = Hname;
    }

    public void setHolderId(int HolderId) {
        this.HolderId = HolderId;
    }

    public void setHstate(String Hstate) {
        this.Hstate = Hstate;
    }

    public String getHstate() {
        return Hstate;
    }

    public void setPDid(int PDid) {
        this.PDid = PDid;

    }

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
            String sql = "insert into holders values(" + getHolderId() + ",'" + getHname() + "', '" + getHadd() + "','" + getHcity() + "','" + getHstate() + "','" + getHemail() + "','" + getHmobile() + "'," + getPDid() + ")";
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
            String sql = "update holders set Hname='" + getHname() + "', Hadd='" + getHadd() + "',Hcity='" + getHcity() + "',Hstate='" + getHstate() + "',Hemail='" + getHemail() + "',Hmobile='" + getHmobile() + "',PDid=" + getPDid() + " where HolderId=" + getHolderId();

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
            String sql = "delete  from holders where HolderId=" + getHolderId();
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
            String sql = "Select * from holders";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getInt(1));
                cr.addElement(rs.getString(2));
                cr.addElement(rs.getString(3));
                cr.addElement(rs.getString(4));
                cr.addElement(rs.getString(5));
                cr.addElement(rs.getString(6));
                cr.addElement(rs.getString(7));
                cr.addElement(rs.getInt(8));
                rows.addElement(cr);
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

    public static holders getRecord(int id) {
        holders obj = new holders();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from holders where HolderId=" + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new holders(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
            c.putConnection(conn);
            System.out.println(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
    }
      public static String getHolder() {
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
            String sql = "select Holderid,Hname  from holders ";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                rows += " <option value=" + rs.getInt(1) + "> " + "  " + rs.getString(2) + "</option>\n";
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

    public static Vector getRecords1() {
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
            String sql = "select h.hname,h.hadd,h.hmobile,p.pname from holders h, policies p, policydetails pd where h.pdid=pd.pdid and pd.pid=p.pid";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getString(1));
            cr.addElement(rs.getString(2));
                 cr.addElement(rs.getString(3));
                cr.addElement(rs.getString(4));
               

                rows.addElement(cr);
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

 public static Vector getRecords2(String s) {
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
            String sql = "select * from holders where hname like '"+ s +"%'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getInt(1));
            cr.addElement(rs.getString(2));
                 cr.addElement(rs.getString(3));
                cr.addElement(rs.getString(4));
                 cr.addElement(rs.getString(5));
                  cr.addElement(rs.getString(6));
                   cr.addElement(rs.getString(7));


                rows.addElement(cr);
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
    public static void main(String args[]) {

         holders h= new holders(5,"sss","bhel","bhopal","mp","sk@yahoo","7879065",1);

          System.out.println(h.getHolder());
      //  Vector v = holders.getRecords();
        //for (int i = 0; i < v.size(); i++) {
         //   System.out.println("" + v.elementAt(i));
          //  holders h = holders.getRecord(1);
           // System.out.println(h.getHadd());
        //}
    }
}
