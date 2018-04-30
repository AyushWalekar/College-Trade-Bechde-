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
	String s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, image_file_path;	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
	
		response.setContentType("text/html");
		

		PrintWriter out = response.getWriter();
	    Fetch.select("bechde","ayush","ayush","product_info");
	    rs = Fetch.rs;

		s2 = request.getParameter("p_name");

		s3 = "ayu";
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

		s8 = request.getParameter("category");
		try
		{

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","ayush","ayush");
		st = con.prepareStatement("insert into product_info values(?,?,?,?,?,?,?,?);");


	    rs.last();
	    s1 = Integer.toString(Integer.parseInt(rs.getString("p_id"))+1);

		st.setInt(1,Integer.parseInt(s1));
		st.setString(2,s2);
		st.setString(3,s3);
		st.setString(4,s4);
		st.setDouble(5,Double.parseDouble(s5));
		st.setString(6,s6);
		st.setString(7,s7);
		st.setString(8,s8);
		
		st.executeUpdate();
		

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



		}
		catch(Exception e)
			{					
				out.println(e.toString());
				out.println(s1);
				out.println(image_file_path);
			}
	}
}

