

package mypack;




import java.sql.*;
import java.util.*;

public class categories {

    ConnectionPool c;
    private int cid;
    private String cname;
    private String cdetails;

    public categories() {

    }

    public categories(int cid, String cname, String cdetails) {
        this.cid = cid;
        this.cname = cname;
        this.cdetails = cdetails;
    }

    public String getCdetails() {
        return cdetails;
    }

    public int getCid() {
        return cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCdetails(String cdetails) {
        this.cdetails = cdetails;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
//Method to Add Record

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
            String sql = "insert into categories values(" + getCid() + ",'" + getCname() + "', '" + getCdetails() + "')";
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
            String sql = "update categories set cname='" + getCname() + "', cdetails='" + getCdetails() + "' where cid=" + getCid();

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
            String sql = "delete  from categories where cid=" + getCid();
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
            String sql = "Select * from categories";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Vector cr = new Vector();
                cr.addElement(rs.getInt(1));
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


 public static String getCategory()
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
String sql = "select *  from categories ";
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
    public static categories getRecord(int id) {
        categories obj = new categories();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from categories where cid= " + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new categories(rs.getInt(1), rs.getString(2), rs.getString(3));
            c.putConnection(conn);
            System.out.println(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
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

       categories c= new categories(1,"home","home category");
       c.add();
       //  categories c=new categories(1,"vehicle","vehicle category");
       //  c.update();
       //Vector v = categories.getRecords();
         //for (int i = 0; i < v.size(); i++) {
         //System.out.println("" + v.elementAt(i));
        //categories c=categories.getRecord(1);
       // System.out.println(c.getCdetails());
      }
    }



