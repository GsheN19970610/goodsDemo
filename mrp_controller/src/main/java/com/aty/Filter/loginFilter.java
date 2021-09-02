package com.aty.Filter;


import com.aty.domain.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class loginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        User user = (User) req.getSession().getAttribute("user");
//        得到请求地址
        String uri = req.getRequestURI();
//        通过/分隔，这样，数组的最后一个值，就是页面，
        String file[] = uri.split("/");
//        就可以了。你比较下file
//        要解除某页面的过滤，用||在if里面添加就可以

        if (file[file.length-1].equals("index.jsp")||user != null ){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
            response.sendRedirect(req.getContextPath()+"/index.jsp");

    }

    @Override
    public void destroy() {

    }
}