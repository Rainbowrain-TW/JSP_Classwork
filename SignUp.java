

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.Name;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /*public SignUp() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		String member_name = request.getParameter("Name");
		String member_Email = request.getParameter("Email");
		String member_password = request.getParameter("Password");
		MemberUse memberUse = new MemberUse();
		
		if(member_name != null || member_name.isEmpty()) {
			if(memberUse.userIsExist(member_name)) {
				MemberData memberData = new MemberData();
				memberData.setMember_name(member_name);
				memberData.setMember_Email(member_Email);
				memberData.setMember_password(member_password);
				memberUse.saveUserData(memberData);
				//request.setAttribute("info", "註冊成功<br>");
				request.getRequestDispatcher("success.jsp").forward(request, response);
			}
			else {
				//request.setAttribute("info", "此帳號已被用過");
				request.getRequestDispatcher("fail.jsp").forward(request, response);
			}
		}
		//request.getRequestDispatcher("message.jsp").forward(request, response);
	}

}
