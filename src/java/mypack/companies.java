

package mypack;
import java.sql.*;
import java.util.*;
public class companies {
    ConnectionPool c;
   
    private int Compid;
    private String Compname;
    private String Address;
    private String City;
    private String Email;
    private String web;
    private String Phone;

    public companies() {
    }

    public companies(int Compid, String Compname, String Address, String City,  String Phone, String Email, String web) {

        this.Compid = Compid;
        this.Compname = Compname;
        this.Address = Address;
        this.City = City;
        this.Email = Email;
        this.web = web;
        this.Phone=Phone;
    }

   

    public String getCompname() {
        return Compname;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getPhone() {
        return Phone;
    }

    public void setCompname(String Compname) {
        this.Compname = Compname;
    }

    public int getCompid() {
        return Compid;
    }

    public void setCompid(int Compid) {
        this.Compid = Compid;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
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
            String sql = "insert into companies values(" + getCompid() + ",'" + getCompname() + "','" + getAddress()+"','" + getCity()+"','"+ getPhone()+"','"+ getEmail() + "','"+getWeb()+"')";
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
            String sql = "update companies set Compname='" + getCompname() + "', Address='" + getAddress() +"', City='" +getCity()+"', Phone='" + getPhone()+"', Email='"+getEmail() + "',web='"+getWeb()+"' where Compid=" + getCompid();

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
            String sql = "delete  from companies where Compid=" + getCompid();
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
            String sql = "Select * from companies";
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




 public static String getCompany()
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
String sql = "select *  from companies ";
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


    public static companies getRecord(int id) {
        companies obj = new companies();
        try {
            ConnectionPool c = null;
            Connection conn = null;
            if (c == null) {
                c = ConnectionPool.getInstance();
                c.initialize();
            }
            conn = c.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from companies where Compid=" + id;
            ResultSet rs = stmt.executeQuery(sql);
            if (!rs.next()) {
                return null;
            }
            obj = new companies(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
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
//companies c= new companies(1,"vedisoft","MPnagar","bhopal","0755420281","vedisoft@ghcom","vsvdnsdin");
//c.update();
companies c1= new companies(2,"HCL","MPnagarzone1","bhopal","0755420282","vedisoft@ghcom","vsvdnsdin");
c1.add();
        
//Vector v = companies.getRecords();

//for (int i = 0; i < v.size(); i++) {
//System.out.println("" + v.elementAt(i));
  //  }    System.out.println(v);
    
       // companies c = companies.getRecord(1);
        //System.out.println(c.getAddress());
}
}
