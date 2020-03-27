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
import com.google.gson.JsonObject;
import domain.Person;
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
		if(action == null){
			String destination = "index.jsp";
			RequestDispatcher view = request.getRequestDispatcher(destination);
			view.forward(request, response);
		}else {
			switch (action) {
				case "ChangeStatus":
					String status = request.getParameter("status");
					if (status.trim().isEmpty()) {
						response.getWriter().write("ONLINE");
					} else {
						if (status.equalsIgnoreCase("AWAY") || status.equalsIgnoreCase("ONLINE") || status.equalsIgnoreCase("OFFLINE")) {
							UserStatus status1 = UserStatus.valueOf(status.toUpperCase());
							request.getSession().setAttribute("statusUser", status1);
						} else {
							request.getSession().setAttribute("statusUser", status.toUpperCase());
						}
						Person user = (Person) request.getSession().getAttribute("user");
						user.setStatus(status.toUpperCase());
						response.getWriter().write(status.toUpperCase());
					}
					break;
				case "GetFriends":
					Person user = (Person) request.getSession().getAttribute("user");
					JsonObject jsonObject = model.getFriends(user.getUserId());
					response.getWriter().write(jsonObject.toString());
					break;
				default:
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
					break;
			}
		}
	}

}
