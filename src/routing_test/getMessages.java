package routing_test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getMessages")
public class getMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		Connection conn = null;
        Statement  stmt = null;
      try {
         
         String sql = "SELECT * FROM messages;";
         System.out.println(sql);
 
         // Get a connection from the pool
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_test", "root", "adminadmin");
 
         // Normal JBDC programming hereafter. Close the Connection to return it to the pool
         stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         
         while (rs.next()) {
             int id = rs.getInt("id");
             String user = rs.getString("user");
             String message = rs.getString("message");
             System.out.println(id + "\t" + user + "\t" + message);
             out.write(user);
         }
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
      }*/
		
		System.out.println("Get volt!");
		
	}

}

