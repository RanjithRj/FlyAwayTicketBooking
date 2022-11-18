package in.co.fly.away.ticket.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.catalina.mbeans.RoleMBean;
import org.apache.log4j.Logger;

import in.co.fly.away.ticket.bean.BaseBean;
import in.co.fly.away.ticket.bean.UserBean;
import in.co.fly.away.ticket.exception.ApplicationException;
import in.co.fly.away.ticket.exception.DuplicateRecordException;
import in.co.fly.away.ticket.model.UserModel;
import in.co.fly.away.ticket.util.DataUtility;
import in.co.fly.away.ticket.util.DataValidator;
import in.co.fly.away.ticket.util.PropertyReader;
import in.co.fly.away.ticket.util.ServletUtility;



@WebServlet(name = "UserRegistrationCtl", urlPatterns = { "/UserRegistrationCtl" })
public class UserRegistrationCtl extends BaseCtl {
	public static final String OP_SIGN_UP = "SignUp";

	private static Logger log = Logger.getLogger(UserRegistrationCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {
		log.debug("UserRegistrationCtl Method validate Started");

		boolean pass = true;

		String login = request.getParameter("login");

		
		 if (DataValidator.isNull(request.getParameter("login"))) {
			request.setAttribute("login",
					PropertyReader.getValue("error.email", "Login"));
			pass = false;
		}
		
		
		if (DataValidator.isNull(request.getParameter("confirmPassword"))) {
			request.setAttribute("confirmPassword", PropertyReader.getValue(
					"error.require", "Confirm Password"));
			pass = false;
		}
		

		if (DataValidator.isNull(request.getParameter("password"))) {
			request.setAttribute("password",
					PropertyReader.getValue("error.require", "Password"));
			pass = false;

		} else if (!DataValidator.isPassword(request.getParameter("password"))) {
			request.setAttribute("password",
					PropertyReader.getValue("error.password", "Password"));
			return false;
		}else if (!DataValidator.isPassword(request.getParameter("password"))) {
			request.setAttribute("password",
					PropertyReader.getValue("error.password", "Password"));
			return false;
		}

		if (!request.getParameter("password").equals(
				request.getParameter("confirmPassword"))
				&& !"".equals(request.getParameter("confirmPassword"))) {
			
			request.setAttribute("confirmPassword", PropertyReader.getValue("error.confirmPassword","Confirm Password"));
			pass = false;
		}
		
	
		
		if (DataValidator.isNull(request.getParameter("firstName"))) {
		
			request.setAttribute("firstName", PropertyReader.getValue("error.require", "First Name"));
			pass = false;
		}
		
		if (DataValidator.isNull(request.getParameter("lastName"))) {
			request.setAttribute("lastName", PropertyReader.getValue("error.require", "Last Name"));
			pass = false;
		}
		
		
	
			log.debug("UserRegistrationCtl Method validate Ended");
		return pass;
	}
	
	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("UserRegistrationCtl Method populatebean Started");

		UserBean bean = new UserBean();

		bean.setId(DataUtility.getLong(request.getParameter("id")));

		bean.setRoleId(2L);

	
			bean.setLogin(DataUtility.getString(request.getParameter("login")));
	
			bean.setPassword(DataUtility.getString(request.getParameter("password")));
	
			bean.setConfirmPassword(DataUtility.getString(request
					.getParameter("confirmPassword")));
			bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));
			bean.setLastName(DataUtility.getString(request.getParameter("lastName")));

			populateDTO(bean, request);
	
			log.debug("UserRegistrationCtl Method populatebean Ended");
	
			return bean;
	}

	private static final long serialVersionUID = 1L;

	public UserRegistrationCtl() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("UserRegistrationCtl Method doGet Started");
		ServletUtility.forward(getView(), request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in post method");
		log.debug("UserRegistrationCtl Method doPost Started");
	
		String op = DataUtility.getString(request.getParameter("operation"));
		UserModel model = new UserModel();
		
		long id = DataUtility.getLong(request.getParameter("id"));
		
		
		if (OP_SIGN_UP.equalsIgnoreCase(op)) {
			
			UserBean bean = (UserBean) populateBean(request);
			try {
				long pk = model.registerUser(bean);
				bean.setId(pk);
				
				request.getSession().setAttribute("UserBean", bean);
				ServletUtility.setSuccessMessage("User Successfully Registered", request);
				Long bid=(Long)request.getSession().getAttribute("boId");
				if(bid>0) {
					UserBean uBean=model.findByPK(pk);
					request.getSession().setAttribute("user",uBean);
					ServletUtility.redirect(ATBView.BOOK_CTL, request, response);
					return;
				}
				ServletUtility.forward(ATBView.USER_REGISTRATION_VIEW, request, response);
				return;
			} catch (DuplicateRecordException e) {
				log.error(e);
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("Login id already exists",
						request);
				ServletUtility.forward(getView(), request, response);
			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				e.printStackTrace();
				return;
			}
		}else if (OP_RESET.equalsIgnoreCase(op)) {
			ServletUtility.redirect(ATBView.USER_REGISTRATION_CTL, request, response);
			return;
		}
		log.debug("UserRegistrationCtl Method doPost Ended");
	}

	@Override
	protected String getView() {
		return ATBView.USER_REGISTRATION_VIEW;
	}

}
