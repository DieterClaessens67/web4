package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import domain.PersonService;
import domain.UserStatus;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PersonService model;
	private ControllerFactory controllerFactory;

	public Controller() {
		super();
	}

	public void init() throws ServletException {
		super.init();
		model = new PersonService();
		controllerFactory = new ControllerFactory();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equalsIgnoreCase("changeStatus")) {
			String status = request.getParameter("status");
			if(status.trim().isEmpty()){
				response.getWriter().write(request.getParameter("previous"));
			}else {
				if (status.equalsIgnoreCase("AWAY") || status.equalsIgnoreCase("ONLINE") || status.equalsIgnoreCase("OFFLINE")) {
					UserStatus status1 = UserStatus.valueOf(status.toUpperCase());
					request.getSession().setAttribute("statusUser", status1);
				} else {
					request.getSession().setAttribute("statusUser", status.toUpperCase());
				}
				response.getWriter().write(status.toUpperCase());
			}
		} else {
			String destination = "index.jsp";
			if (action != null) {
				RequestHandler handler;
				try {
					handler = controllerFactory.getController(action, model);
					destination = handler.handleRequest(request, response);
				} catch (NotAuthorizedException exc) {
					List<String> errors = new ArrayList<String>();
					errors.add(exc.getMessage());
					request.setAttribute("errors", errors);
					destination = "index.jsp";
				}
			}
			RequestDispatcher view = request.getRequestDispatcher(destination);
			view.forward(request, response);
		}
	}

	private String toJSON(UserStatus status1) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(status1);
	}

}
