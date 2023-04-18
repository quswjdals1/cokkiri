package controller.pcommentController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.pcommenService.IPcommentService;
import service.pcommenService.PcommentServiceImpl;


@WebServlet("/pcommentDelete.do")
public class PcommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int pcommentId = Integer.parseInt(request.getParameter("pcommentId"));
		
		IPcommentService service = PcommentServiceImpl.getInstance();
		
		int result = service.updatePcommentIsremove(pcommentId);
		
		Gson gson = new Gson();
		
		String data = gson.toJson(result);
		response.getWriter().write(data);
		response.flushBuffer();
	}

}
