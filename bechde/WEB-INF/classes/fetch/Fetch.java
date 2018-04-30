package fetch;

import java.sql.*;
import java.io.*;


// Class to help with JDBC connectivity with mysql.

/* static functions h.. call krne k lye Fetch.select(parameters) this will set the value of "rs" object 
aur fir Fetch.rs ko use karlo
=> Fetch.rs.getString(1)... like this

*/
public class Fetch
{
	public static ResultSet rs;

    public static void select(String db_name,String db_user, String db_pswd,String table_name)
    {
	Connection con;
    PreparedStatement st;
    ResultSet rs1;
    String url = "jdbc:mysql://localhost:3306/";
    int i=0;
    	try
    	{
            Class.forName("com.mysql.jdbc.Driver");i++;
            con = DriverManager.getConnection(url+db_name+"?&useSSL=false",db_user,db_pswd);i++;
            st = con.prepareStatement("select * from "+table_name);i++;
            rs = st.executeQuery();i++;
            
        }
		//catch(SQLException e)
        //{
        //	System.out.println("func m error"+e.toString());
        //}
        catch(Exception e)
        {
        	System.out.println("func m error222222"+e.toString());
        }

    }

    public static void select(String db_name,String db_user, String db_pswd,String table_name,String conditon)
    {
   	Connection con;
    PreparedStatement st;
    String url = "jdbc:mysql://localhost:3306/";

    	try
    	{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url+db_name+"?&useSSL=false",db_user,db_pswd);
            st = con.prepareStatement("select * from "+table_name+" where "+conditon);
        	rs = st.executeQuery();
        }
		catch(SQLException e)
        {
        	System.out.println("func m error"+e.toString());
        }
        catch(Exception e)
        {
        	System.out.println("func m error222222"+e.toString());
        }    
    }

}

/** NOTE : condition wala call karne k lye .. last parameter m '\"' (backslash) lagana
qki SQL command m esi likhte h ** select id from table_name where name = "Ayush" **
to java m se ese jaegi ** prepareStatement("select id from table_name where name = \"Ayush\" ");
*/


/******************** Test karnne k lye **********************/
/*
class main
{
	public static void main(String []a)
	{
		Fetch.select("bechde","ayush","ayush","user_info","user_name=ayu");
		try
    	{
    	    if(Fetch.rs.next())
			{
				System.out.println(Fetch.rs.getString(1));
			}
        }
        catch(SQLException e)
        {
        	System.out.println("func m error"+e.toString());
        }
        catch(Exception e)
        {
        	System.out.println("CNF m error"+e.toString());
        }
	}
}
*/