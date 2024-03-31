package com.foodstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * To check username and password using servlet.
 */
@WebServlet("/Slogin")
public class Login extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("uname");
		String password = req.getParameter("pass");
		
		
			System.out.println("Username:- "+name);
			System.out.println("Password:- "+password);
    		
    	
    		
    		if(name.equals("store816") && password.equals("store@816"))
    		{ 
    			
    			RequestDispatcher rd = req.getRequestDispatcher("productFetch.jsp");
    			rd.forward(req, resp);
    			
    		}else
    		{ 
    			
    			RequestDispatcher rd = req.getRequestDispatcher("wrongAdminLogin.jsp");
    			rd.include(req, resp);
    		}
	}
}
