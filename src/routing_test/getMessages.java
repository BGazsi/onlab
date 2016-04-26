package routing_test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getMessages")
public class getMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");

		PrintWriter out = response.getWriter();
		Connection conn = null;
		Statement  stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String sql = "SELECT * FROM messages;";
			System.out.println(sql);

			// Get a connection from the pool
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlab", "root", "adminadmin");

			// Normal JBDC programming hereafter. Close the Connection to return it to the pool
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("id");
				String user = rs.getString("user");
				String message = rs.getString("message");
				System.out.println(id + "\t" + user + "\t" + message);
				
				Map<String, Object> config = new HashMap<String, Object>();
				JsonBuilderFactory factory = Json.createBuilderFactory(config);
				JsonObject value = factory.createObjectBuilder()
					     .add("id", id)
					     .add("user", user)
					     .add("message", message)
					     .build();

				 JsonArray array = factory.createArrayBuilder()
				     .add(value)
				     .build();
				out.write(value.toString());
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

