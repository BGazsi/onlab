package routing_test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class sendMessage
 */
@WebServlet("/deleteMessage")
public class deleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		PrintWriter out = response.getWriter();
		Connection conn = null;
        Statement  stmt = null;
      try {
         
         String sql = "DELETE FROM messages WHERE id="+id;
         System.out.println(sql);
 
         // Get a connection from the pool
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlab?autoReconnect=true&useSSL=false", "root", "adminadmin");
 
         // Normal JBDC programming hereafter. Close the Connection to return it to the pool
         stmt = conn.createStatement();
         stmt.executeUpdate(sql);
         response.sendRedirect("admin.jsp");
      } catch (SQLException ex) {
         ex.printStackTrace();
      } finally {
         out.close();
         try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();  // return to pool
         } catch (SQLException ex) {
             ex.printStackTrace();
         }
      }
		
	}
}