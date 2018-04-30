//Prodcut ki image ko IMAGE folder m save krna 00000000xy_z.jpg name se save krna.. aur image table m entry krna.

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import java.text.*; //to get date in yyyy-mm-dd format
import fetch.*;

//pacakges for image file handling 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AddImage extends HttpServlet
{
	Connection con, con_img;
	PreparedStatement st, st_img;
	ResultSet rs, rs_img;
	String s1, image_file_path, image_name;	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
	
		response.setContentType("text/html");
		

		PrintWriter out = response.getWriter();
	    Fetch.select("bechde","ayush","ayush","product_info");
	    rs = Fetch.rs;

		try
		{

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","ayush","ayush");

		    s1 = request.getSession().getAttribute("p_id").toString();
 			
			ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> ls = sf.parseRequest(request);

			image_name = s1 + "_1" + ".jpg";
			image_file_path = "C:\\Program Files\\apache-tomcat-9.0.0.M26\\webapps\\bechde\\images\\";

			for(FileItem i : ls)
			{
				i.write(new File(image_file_path + image_name));
			}
			//to Iterate through list of files uploaded.

			st = con.prepareStatement("insert into images values(?,?)");
			st.setString(1,s1);
			st.setString(2,image_name);

			st.executeUpdate();
			con.close();

			out.println("<BODY OnLoad=\"javascript:parent.window.close()\"></BODY>");
			// to close the new tab as soon as loads.
			response.sendRedirect("/bechde/display_all_products.jsp?page_no=1");
		}
		catch(Exception e)
			{					
				out.println(e.toString());
				out.println(s1);
				out.println(image_name);
				out.println(image_file_path);
				//out.println("<BODY OnLoad=\"javascript:parent.window.close()\"></BODY>");
			}
	}
}

