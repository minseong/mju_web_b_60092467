package ok;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.util.*;
import org.apache.commons.lang3.StringUtils;
import java.lang.*;
import javax.naming.NamingException;
@WebServlet("/index")
	
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public index() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB 접속을 위한 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String errorMsg = null;
		
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/web2012?characterEncoding=utf8";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String pwd_confirm = request.getParameter("pwd_confirm");
		String name = request.getParameter("name");
		String year = request.getParameter("year");
		String gender = request.getParameter("gender");
		String status = request.getParameter("status");
		
		
		List<String> errorMsgs = new ArrayList<String>();
		int result = 0;	
		if (userid == null || userid.trim().length() == 0) {
			errorMsgs.add("ID를 반드시 입력해주세요.");
		}
		
		if (pwd == null || pwd.length() < 6) {
			errorMsgs.add("비밀번호는 6자 이상 입력해주세요.");
		} 
		
		if (!pwd.equals(pwd_confirm)) {
			errorMsgs.add("비밀번호가 일치하지 않습니다.");
		}
		
		if (name == null || name.trim().length() == 0) {
			errorMsgs.add("이름을 반드시 입력해주세요.");
		}
		
		if (gender == null || !(gender.equals("남자") || gender.equals("여자") )) {
			errorMsgs.add("성별에 적합하지 않은 값이 입력되었습니다.");
		}
		
		if (errorMsgs.size() == 0) {
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				stmt = conn.prepareStatement(
						"INSERT INTO users(userid, pwd, name, year, gender, status) " +
						"VALUES(?, ?, ?, ?, ?, ?)"
						);
				stmt.setString(1,  userid);
				stmt.setString(2,  pwd);
				stmt.setString(3,  name);
				stmt.setString(4,  year);
				stmt.setString(5,  gender);
				stmt.setString(6,  status);
			
				result = stmt.executeUpdate();
				if (result != 1) {
					errorMsgs.add("등록에 실패하였습니다.");
				}
			} catch (ClassNotFoundException e){	
			} catch (SQLException e) {
				errorMsgs.add("SQL 에러: " + e.getMessage());
			} finally {
				// 무슨 일이 있어도 리소스를 제대로 종료
				if (rs != null) try{rs.close();} catch(SQLException e) {}
				if (stmt != null) try{stmt.close();} catch(SQLException e) {}
				if (conn != null) try{conn.close();} catch(SQLException e) {}
			}
		
			response.sendRedirect("index.jsp");
		} else{
				request.setAttribute("error", errorMsgs);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
				}
	
	} 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stmtt = null;
		Statement stmtn = null;
		ResultSet rs = null;
		
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/web2012?characterEncoding=utf8";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		HttpSession session = request.getSession(true);
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String user_id = session.getAttribute("userid").toString();
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String login_flag = "1";
		PrintWriter out = response.getWriter();
		
		
		List<String> errorMsgs = new ArrayList<String>();
		int result = 0;	
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt=conn.prepareStatement("select * from location where user_id=?");
		       stmt.setString(1, user_id);
		       
		       rs=stmt.executeQuery();
		       String flag="";
		       if(rs.next()){
		    	   flag=rs.getString("login_flag");
		       }
		       if(flag==""){
		    	   stmt = conn.prepareStatement(
							"INSERT INTO location(user_id, lat, lng, login_flag) " +
							"VALUES(?, ?, ?, ?)"
							);
					stmt.setString(1,  user_id);
					stmt.setString(2,  lat);
					stmt.setString(3,  lng);
					stmt.setString(4,  login_flag);
		    	    
		       }else{
		    	   stmt = conn.prepareStatement(
		     				"UPDATE location " +
		     				"SET lat=?, lng=?, login_flag=? " +
		     				"WHERE user_id=?"
		     				);
		     		stmt.setString(1,  lat);
		     		stmt.setString(2,  lng);
		     		stmt.setString(3,  login_flag);
		     		stmt.setString(4,  user_id);
		       }
		       String sql="SELECT * FROM users, location WHERE users.userid = location.user_id and location.login_flag = '1' and user_id not in (?)";
	     		stmtt = conn.prepareStatement(sql);
	     		stmtt.setString(1,  user_id);
	     		rs = stmtt.executeQuery();
		       while(rs.next())
				{
					out.println(
					 rs.getString("users.name") +","
					+rs.getString("users.year") +","
					+rs.getString("users.gender") +","
					+rs.getString("users.status") +","
					+rs.getString("location.user_id") +","
					+rs.getString("location.lat") +","
					+rs.getString("location.lng") +","
					);
									
				}
				
				rs.close();
				
		       
		       
		       
			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("등록에 실패하였습니다.");
			}
			
	
		} catch (ClassNotFoundException e){	
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}

}
}


	


