import java.io.*;
import java.util.*;

import javax.servlet.*;
import java.sql.*;

public class ser extends GenericServlet 
{
    Connection con;
    PreparedStatement pt;
    ResultSet rs;
    int i=0;
    public void service(ServletRequest request, ServletResponse response)
        throws IOException, ServletException
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); i++;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javapractice","ayush","ayush");i++;
            pt = con.prepareStatement("insert into student values(?,?,?)");i++;

            pt.setString(1,request.getParameter("t1"));i++;
            pt.setString(2,request.getParameter("t2"));i++;
            pt.setString(3,request.getParameter("t3"));i++;
                        pt.executeUpdate();i++;

            con.close();i++;
            response.setContentType("text/html");i++;
        PrintWriter out = response.getWriter();i++;
        out.println("<head>");
        out.println("</head>");
        out.println("Data Submitted Successfully!!");

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



