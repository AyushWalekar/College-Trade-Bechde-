//To ADD PRODUCTS to the database alon with it's details.

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.text.*; //to get date in yyyy-mm-dd format
import fetch.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.security.*;

public class AddProd extends HttpServlet
{
	Connection con, con_img;
	PreparedStatement st, st_img;
	ResultSet rs, rs_img;
	String s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, image_file_path, ses="";
	int line = 0;
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
	line = 0;
		response.setContentType("text/html");
		

        HttpSession session = request.getSession();
		if( session != null)
		{
			ses = session.getAttribute("session").toString();
		}
		else 
		{
			response.sendRedirect("/bechde/login.jsp");
		}


		PrintWriter out = response.getWriter();
	    Fetch.select("bechde","ayush","ayush","product_info");
	    rs = Fetch.rs;

		s2 = request.getParameter("p_name");

		s3 = ses;
//"ayu" is to be replaced by sessionID ..as jo upload krega wo logged in user hi krega

		s4 = request.getParameter("description");
		s5 = request.getParameter("price");
		s6 = request.getParameter("useful_for");
	   

	 //  Calendar cal = Calendar.getInstance();
		//cal.add(Calendar.DATE, 1);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		// Output "Wed Sep 26 14:23:28 EST 2012"

		String formatted = format1.format(new java.util.Date());
		//s7 = (new java.util.Date("yyyy-MM-DD")).toString();
		s7 = formatted;
//HTML k date field se date nikal kr String banana.


		s8 = request.getParameter("category");
		try
		{

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","ayush","ayush");
		st = con.prepareStatement("insert into product_info values(?,?,?,?,?,?,?,?);");

line++;
	    rs.last();
line ++;
	    s1 = Integer.toString(Integer.parseInt(rs.getString("p_id"))+1);
line++;
		st.setInt(1,Integer.parseInt(s1));
line ++;		st.setString(2,s2);
line ++;		st.setString(3,s3);
line ++;		st.setString(4,s4);
line ++;		st.setDouble(5,Double.parseDouble(s5));
line ++;		st.setString(6,s6);
line ++;		st.setString(7,s7);
line ++;		st.setString(8,s8);
		line ++;
		st.executeUpdate();
line++;		

		/*ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		List<FileItem> ls = sf.parseRequest(request);

		image_file_path = "C:\\Program Files\\apache-tomcat-9.0.0.M26\\webapps\\bechde\\images\\" + s1 + ".jsp";
		for(FileItem i : ls)
		{
			//i.write(new File(image_file_path));
		}
		
		st = con.prepareStatement("insert into images values(?,?)");
		st.setString(1,s1);
		st.setString(2,image_file_path);
	*/
		con.close();

	    Fetch.select("bechde","ayush","ayush","product_info");
	    rs = Fetch.rs;
		rs.last();               
        RequestDispatcher dispatcher = request.getRequestDispatcher("/upload_image.jsp?p_id="+ rs.getString("p_id"));
//ProductID ko Image upload krne wali jsp pr forward krna.
        
        dispatcher.forward(request,response);


		}
		catch(Exception e)
			{					
				out.println(e.toString());
				out.println(s1);
				out.println("line " + line);
				out.println(image_file_path);
			}
	}
}

