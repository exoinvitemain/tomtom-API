package com.codenvy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

public class TomTomServlet extends HttpServlet {


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("profile") != null
				&& request.getParameter("profile").trim() != "") {
			HttpClient client = new DefaultHttpClient();
			StringBuffer sb = null;
			try {

				String getURL = "https://api.tomtom.com/lbs/map/3/basic/"
						+ request.getParameter("style") + "/"
						+ request.getParameter("zoom") + "/"
						+ request.getParameter("x") + "/"
						+ request.getParameter("y") 
						+ request.getParameter("mimeType") + "?key="
						+ request.getParameter("profile");
			
				HttpGet req = new HttpGet(getURL);
				HttpResponse res = client.execute(req);
				HttpEntity entity = res.getEntity();

				if (entity != null) {
					EntityUtils.consume(entity);
				}

				sb = new StringBuffer(
						"<br/><h4>Call</h4><pre style=\"background-color: #F7F7F9; border: 1px solid #E1E1E8; padding: 8px;\"><span style=\"color: #006666;\">"
								+ getURL + "</span></pre>");

				Header[] requestHeaders = req.getAllHeaders();
				if (requestHeaders.length != 0) {
					sb
							.append("<h4>Request headers</h4><pre style=\"background-color: #F7F7F9; border: 1px solid #E1E1E8; padding: 8px;\">");
					for (Header header : requestHeaders) {
						sb.append("<span style=\"color: #006666;\">"
								+ header.toString() + "</span><br/>");
					}
					sb.append("</pre>");
				}

				sb
						.append("<h4>Response Headers</h4><pre style=\"background-color: #F7F7F9; border: 1px solid #E1E1E8; padding: 8px;\">");
				Header[] headers = res.getAllHeaders();
				for (Header header : headers) {
					sb.append("<span style=\"color: #006666;\">"
							+ header.toString() + "</span><br/>");
				}
				sb.append("</pre>");

				sb
						.append("<h4>Response Body</h4>"
								+ "<pre style=\"background-color: #F7F7F9; border: 1px solid #E1E1E8; padding: 8px;\">");

				sb.append("<span style=\"color: #006666;padding: 0px;\">"
						+ "<img src=\"" + getURL + "\"/>" + "</span>");

			} catch (Exception ex) {
				ex.printStackTrace();
				sb = new StringBuffer(ex.toString());
			}
			request.setAttribute("data", sb.toString());
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}

	}

}
