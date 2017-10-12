

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /*public SignIn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		String member_Email = request.getParameter("Email");
		String member_password = request.getParameter("Password");
		MemberUse memberUse = new MemberUse();
		MemberData memberData = memberUse.login(member_Email, member_password);
		if(memberData != null) {
			//request.getSession().setAttribute("user", memberData);
			request.getRequestDispatcher("Right.jsp").forward(request, response);
			
		}
		else {
			//request.setAttribute("info", "信箱或密碼不符合");
			request.getRequestDispatcher("Wrong.jsp").forward(request, response);
		}
	}

}
