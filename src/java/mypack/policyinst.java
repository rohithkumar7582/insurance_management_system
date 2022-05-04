 package mypack;
import java.sql.*;
import java.util.*;

public class policyinst {

ConnectionPool c;
    private int Pinstid;
    private int PDid;
    private int Instno;
    private int amt;
    private String Insttype;

    public policyinst() {
    }

    public policyinst(int Pinstid, int PDid, int Instno, int amt, String Insttype) {
        this.Pinstid = Pinstid;
        this.PDid = PDid;
        this.Instno = Instno;
        this.amt = amt;
        this.Insttype = Insttype;
    }

    public int getInstno() {
        return Instno;
    }

    public void setInstno(int Instno) {
        this.Instno = Instno;
    }

    public void setInsttype(String Insttype) {
        this.Insttype = Insttype;
    }

    public void setPDid(int PDid) {
        this.PDid = PDid;
    }

    public void setPinstid(int Pinstid) {
        this.Pinstid = Pinstid;
    }

    public void setAmt(int amt) {
        this.amt = amt;
    }

    public String getInsttype() {
        return Insttype;
    }

    public int getPDid() {
        return PDid;
    }

    public int getPinstid() {
        return Pinstid;
    }

    public int getAmt() {
        return amt;
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
            String sql = "insert into policyinst values(" + getPinstid() + "," + getPDid() + ", " + getInstno() +","+getAmt()+",'"+ getInsttype()+ "')";
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
            String sql = "update policyinst set PDid=" + getPDid() +",Instno=" + getInstno() + ", amt=" + getAmt() + ",Insttype='"+ getInsttype() + "' where Pinstid=" + getPinstid();

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
            String sql = "delete  from policyinst where Pinstid=" + getPinstid();
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
            String sql = "Select * from policyinst";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getInt(1));
                 cr.addElement(rs.getInt(2));
                  cr.addElement(rs.getInt(3));
                   cr.addElement(rs.getInt(4));
                cr.addElement(rs.getString(5));
              

                rows.addElement(cr);
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

    public static policyinst getRecord(int id) {
        policyinst obj = new policyinst();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from policyinst  where Pinstid=" + id ;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new policyinst(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4), rs.getString(5));
            c.putConnection(conn);
            System.out.println(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
    }
    public static String getPolicyInst() {
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
            String sql = "select Pinstid,Instno from policyinst ";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                rows += "<option value=" + rs.getInt(1) + "> " + "  " + rs.getInt(2) + "</option>\n";
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
    String a1=yy+"-"+mm+"-"+dd;Name
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
   policyinst p= new policyinst(3,2,333,5345,"fgh");
        System.out.println(p.getPolicyInst());
       // p.add();
//p.getRecord(2);
//        System.out.println("Amt"+p.getAmt());
//       p.update();
//        //Vector v = policyinst.getRecords();
//        // for (int i = 0; i < v.size(); i++) {
//        //   System.out.println("" + v.elementAt(i));
        //  }
    }
}

    


