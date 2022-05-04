package mypack;

import java.sql.*;
import java.util.*;

public class users {

    ConnectionPool c;
    private int UserId;
    private String Username;
    private String Userpass;

    public users() {
    }

    public users(int UserId, String Username, String Userpass) {
        this.UserId = UserId;
        this.Username = Username;
        this.Userpass = Userpass;
    }

    public String getUserpass() {
        return Userpass;
    }

    public String getUsername() {
        return Username;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserpass(String Userpass) {
        this.Userpass = Userpass;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
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
            String sql = "insert into users values(" + getUserId() + ",'" + getUsername() + "', '" + getUserpass() + ")";
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
            String sql = "update users set Username='" + getUsername() + "', Userpass='" + getUserpass() + " where UserId=" + getUserId();

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
            String sql = "delete  from users where UserId=" + getUserId();
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
            String sql = "Select * from users";
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

    public static users getRecord(int id) {
        users obj = new users();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from users where UserId=" + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new users(rs.getInt(1), rs.getString(2), rs.getString(3));
            c.putConnection(conn);
            System.out.println(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
    }
      public static String getUser() {
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
            String sql = "select Userid,Username  from users ";
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
            String sql = "select h.hname,h.hadd,h.hmobile,p.pname from users h, policies p, policydetails pd where h.pdid=pd.pdid and pd.pid=p.pid";
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
            String sql = "select * from users where hname like '"+ s +"%'";
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

         users h= new users(5,"rohith","rohith");

          System.out.println(h.getUser());
      //  Vector v = users.getRecords();
        //for (int i = 0; i < v.size(); i++) {
         //   System.out.println("" + v.elementAt(i));
          //  users h = users.getRecord(1);
           // System.out.println(h.getUserpass());
        //}
    }
}
