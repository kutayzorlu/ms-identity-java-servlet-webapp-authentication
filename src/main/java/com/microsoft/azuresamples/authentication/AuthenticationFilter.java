package com.microsoft.azuresamples.authentication;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This class implements filters
 * All incoming requests go through this.
 * We don't do much here except we redirect unauthorized clients away from protected routes
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
        //
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        MsalAuthSession msalAuth = MsalAuthSession.getMsalAuthSession(request.getSession());

        // send 401 for unauthorized access to token_details endpoint
        if (request.getRequestURI().contains("token_details") && !msalAuth.getAuthenticated()) {
            req.setAttribute("bodyContent", "auth/401.jsp");
            final RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        } else {
            chain.doFilter(req, res);
        }
    }

    @Override
    public void destroy() {
        //
    }
}
