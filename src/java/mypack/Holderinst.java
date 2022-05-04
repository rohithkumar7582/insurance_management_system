

package mypack;
import java.sql.*;
import java.util.*;


public class Holderinst {
   ConnectionPool c;
   private int hinstId;
   private int holderId;
   private int pinstid;
   private int amt;
   private String duedt;
   private String received;
   private String rdt;
   private int amount;
   private String mode;
   private String chno;
   private String bank;
   private String cdt;

    public Holderinst() {
    }

    public Holderinst( int HinstId, int HolderId, int Pinstid, int Amt, String Duedt, String Received, String Rdt, int Amount, String Mode, String Chno, String Bank, String Cdt) {

        this.hinstId = HinstId;
        this.holderId = HolderId;
        this.pinstid = Pinstid;
        this.amt = Amt;
        this.duedt = Duedt;
        this.received = Received;
        this.rdt = Rdt;
        this.amount = Amount;
        this.mode = Mode;
        this.chno = Chno;
        this.bank = Bank;
        this.cdt = Cdt;
    }

    public void setHinstId(int hinstId) {
        this.hinstId = hinstId;
    }

    public int getHinstId() {
        return hinstId;
    }

    public void setHolderId(int holderId) {
        this.holderId = holderId;
    }

    public int getHolderId() {
        return holderId;
    }

    public int getPinstid() {
        return pinstid;
    }

    public void setPinstid(int pinstid) {
        this.pinstid = pinstid;
    }

    public int getAmt() {
        return amt;
    }

    public void setAmt(int amt) {
        this.amt = amt;
    }

    public String getDuedt() {
        return duedt;
    }

    public void setDuedt(String duedt) {
        this.duedt = duedt;
    }

    public String getReceived() {
        return received;
    }

    public void setReceived(String received) {
        this.received = received;
    }

    public void setRdt(String rdt) {
        this.rdt = rdt;
    }

    public String getRdt() {
        return rdt;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getChno() {
        return chno;
    }

    public void setChno(String chno) {
        this.chno = chno;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getCdt() {
        return cdt;
    }

    public void setCdt(String cdt) {
        this.cdt = cdt;
    }





    //Method to Add Record

    public boolean add() {
        int x = 0;
        int id=0;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
           
            String sql = "insert into Holderinst values(" + getHinstId() + "," + getHolderId() + ", " + getPinstid() + "," + getAmt()+",'"+myDate2(getDuedt())+"','"+getReceived()+"','"+myDate2(getRdt())+"','"+ getAmount()+"','"+getMode()+"','"+getChno()+"','"+getBank()+"','"+myDate2(getCdt()) +"')";

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
            String sql = "update Holderinst set HolderId=" + getHolderId() + ",Pinstid=" + getPinstid() + ", Amt='" + getAmt() + "', Duedate='" + getDuedt() + "',Received='"+getReceived()+"',Rdate='"+getRdt()+"',Amount='"+getAmount()+"',Mode='"+getMode()+"',Chno='"+getChno()+"',Bank='"+getBank()+"',Cdate='"+getCdt()+"' where HinstId=" + getHinstId();

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
            String sql = "delete  from Holderinst where HinstId=" + getHinstId();
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
            String sql = "Select * from Holderinst";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getInt(1));
                cr.addElement(rs.getInt(2));
                cr.addElement(rs.getInt(3));
                cr.addElement(rs.getInt(4));
                cr.addElement(rs.getString(5));
                cr.addElement(rs.getString(6));
                cr.addElement(rs.getString(7));
                cr.addElement(rs.getInt(8));
                cr.addElement(rs.getString(9));
                cr.addElement(rs.getString(10));
                cr.addElement(rs.getString(11));
                cr.addElement(rs.getString(11));

                rows.addElement(cr);
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

    public static Holderinst getRecord(int id) {
        Holderinst obj = new Holderinst();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from Holderinst where Hinstid=" + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new Holderinst(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),  rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
            c.putConnection(conn);
            System.out.println(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
    }

    public static String myDate2(String dt1)
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
    }
    public static void main(String args[]) {

       Holderinst i= new Holderinst(4,3,1,555,"2010-03-01","sfdsf","1999-02-03",12312,"dfds","erewr","ewrwer","1010-00-03");
       i.add();

     
    }


}
