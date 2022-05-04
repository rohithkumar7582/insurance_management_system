
package mypack;



import java.sql.*;
import java.util.*;
public class policydetails {
    ConnectionPool c;
    private int PDid;
    private int Pid;
    private String optionno;
    private String  option;
    private int Amt;

     public policydetails() {
    }

    public policydetails(int PDid, int Pid, String optionno, String option, int Amt) {
   
        this.PDid = PDid;
        this.Pid = Pid;
        this.optionno = optionno;
        this.option = option;
        this.Amt = Amt;
    }
    public int getAmt() {
        return Amt;
    }

    public void setAmt(int Amt) {
        this.Amt = Amt;
    }

   

   

    public String getOption() {
        return option;
    }

    public String getOptionno() {
        return optionno;
    }

    public int getPDid() {
        return PDid;
    }

    public int getPid() {
        return Pid;
    }

    

    public void setOption(String option) {
        this.option = option;
    }

    public void setOptionno(String optionno) {
        this.optionno = optionno;
    }

    public void setPDid(int PDid) {
        this.PDid = PDid;
    }

    public void setPid(int Pid) {
        this.Pid = Pid;
    }

    
    public boolean add() {
        int x = 0;
        int pdid=0;
        Connection conn = null;
        try {
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
           
            String sql = "insert into policydetails values(" + getPDid() + "," + getPid() + ", '" + getOptionno() +"','"+getOption()+"',"+ getAmt()+ ")";
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
            String sql = "update policydetails set Pid="+getPid()+", Op1='"+getOptionno()+"', Opt='"+getOption()+"', Amt="+getAmt()+" where PDid="+getPDid();

       //  "update policies set Compid=" + getCompid() +",Cid=" + getCid() + ",Pname='" + getPname() + "', Pdesc='" + getPdesc() + "' where Pid=" + getPid();

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
            String sql = "delete  from policydetails where PDid=" + getPDid();
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
            String sql = "Select * from policydetails";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getInt(1));
                 cr.addElement(rs.getInt(2));
                cr.addElement(rs.getString(3));
                cr.addElement(rs.getString(4));
                cr.addElement(rs.getInt(5));

                rows.addElement(cr);
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

    public static policydetails getRecord(int id) {
        policydetails obj = new policydetails();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from policydetails where PDid=" + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new policydetails(rs.getInt(1),rs.getInt(2) ,rs.getString(3), rs.getString(4),rs.getInt(5));
            c.putConnection(conn);
            System.out.println(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
    }
        public static String getPolicyDetails() {
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
            String sql = "select *  from policydetails ";
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

    

     public static Vector getReport2() {
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
            String sql = "select c.compname,p.pname,sum(pi.amt) from companies c, policies p, policyinst pi ,policydetails pd where pi.pdid=pd.pdid and pd.pid=p.pid and p.compid=c.compid group by p.pid";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                          cr.addElement(rs.getString(1));
                cr.addElement(rs.getString(2));
                cr.addElement(rs.getString(3));

                rows.addElement(cr);
            }
            c.putConnection(conn);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rows;
    }

     public static Vector getReport3() {
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
            String sql = "select p.pname,h.hname,pi.amt as installment,pd.amt as policy , (pd.amt-pi.amt) as due from  policies p, policyinst pi ,policydetails pd,holders h  where pi.pdid=pd.pdid and pd.pid=p.pid and h.pdid=pd.pdid group by pi.pinstid";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                          cr.addElement(rs.getString(1));
                cr.addElement(rs.getString(2));
                cr.addElement(rs.getInt(3));
                cr.addElement(rs.getInt(4));
                cr.addElement(rs.getInt(5));

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
//
      policydetails p= new policydetails(2,1,"abc","yearly",35000);

     p.add();

     // policydetails p1= new policydetails(12,2,"aaa","annually",35000);

    // p1.add();
     //  Vector v = policydetails.getRecords();
      // for (int i = 0; i < v.size(); i++) {
      //  System.out.println("" + v.elementAt(i));
      //  policydetails pd=policydetails.getRecord(2);
      //    System.out.println(pd.getOption());
     //  }
    }
}




