package mypack;
import java.io.*;
import java.sql.*;
import java.util.*;

public class ConnectionPool
{
      static final int MAX_CONNECTIONS = 20;
      static Vector connections = null;

      static ConnectionPool instance = null;

      public synchronized void removeAllConnections()
      {
          try{
              if(connections == null)
                    return;
              int sz = connections.size();
              for(int i=0; i<sz; i++)
              {
                   Connection c = (Connection)connections.elementAt(i);
                   c.close();
              }
              connections.removeAllElements();
              connections = null;
         }catch(SQLException sqlE){System.out.println(sqlE);}
      }

      public static synchronized ConnectionPool getInstance()
      {
           if(instance == null)
                 instance = new ConnectionPool();
           return instance;
      }

      public synchronized void initialize()
      {
               String userName = "root";
               String password = "root";
               //old : jdbc:mysql://localhost:3306/insurance
               //jdbc:mysql://localhost:3306/insurance?zeroDateTimeBehavior=convertToNull [root on Default schema]
               String url = "jdbc:mysql://localhost:3306/insurance?zeroDateTimeBehavior=convertToNull&allowPublicKeyRetrieval=true&useSSL=false";
           if(connections == null)
           {
               try
               {
                   //com.mysql.jdbc.Driver
                   //com.mysql.cj.jdbc.Driver
               Class.forName ("com.mysql.cj.jdbc.Driver").newInstance ();
                   connections = new Vector();
                   int count = 0;
                   while(count < MAX_CONNECTIONS)
                   {
                       Connection c = DriverManager.getConnection(url, userName, password);
                       connections.addElement(c);
                       count++;
                   }
               }catch(Exception sqlE){
System.out.println(sqlE);
}
	System.out.println("over");
           }
      }

      public synchronized Connection getConnection()
      {
          Connection c = null;
          if(connections == null)
              return null;
          if(connections.size() > 0)
          {
                c = (Connection)connections.elementAt(0);
                connections.removeElementAt(0);
          }
          return c;
      }

      public synchronized void putConnection(Connection c)
      {
           connections.addElement(c);
           notifyAll();
      }
}
