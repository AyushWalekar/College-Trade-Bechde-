import java.io.*;
import java.util.*;

import javax.servlet.http.*;
import java.sql.*;

public class query extends HttpServlet 
{
    Connection con;
    PreparedStatement st;
    ResultSet rs;
    int i=0;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException
    {
        try
        {i=0;
            Class.forName("com.mysql.jdbc.Driver"); i++;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javapractice?&useSSL=false","ayush","ayush");i++;
            st = con.prepareStatement("select * from student where name=?");i++;
           // st = con.createStatement();i++;

            st.setString(1,request.getParameter("t1"));
            rs = st.executeQuery();i++;
        response.setContentType("text/html");i++;
        PrintWriter out = response.getWriter();i++;
        
        out.println("<head>");i++;
        out.println("</head>");i++;
        if(rs.next())
        {out.println("Name ="+rs.getString("name"));i++;
        out.println("</br>");i++;
        out.println("Phone = " + rs.getString("phone"));i++;
        out.println("</br>");i++;
        out.println("Branch = " + rs.getString("branch"));i++;
        }
        out.println("</br>");i++;

        out.println("</body>");
        out.println("</html>");
        out.close();
        }
        catch(Exception e){
response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<head>");
        out.println("</head>");
        out.println(i);

        out.println("</body>");
        out.println("</html>");
    
            
        }




        }
}



