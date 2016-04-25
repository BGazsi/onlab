package routing_test;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Servlet implementation class sendMessage
 */
@WebServlet("/sendMessage")
public class sendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = request.getParameter("message");
		String user = request.getParameter("user");
		
		PrintWriter out = response.getWriter();
		Connection conn = null;
        Statement  stmt = null;
      try {
         
         String sql = "INSERT INTO messages (user, message) VALUES('" + user + "', '" + message + "')";
         System.out.println(sql);
 
         // Get a connection from the pool
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlab", "root", "adminadmin");
 
         // Normal JBDC programming hereafter. Close the Connection to return it to the pool
         stmt = conn.createStatement();
         stmt.executeUpdate(sql);
         response.sendRedirect("index.jsp");
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
