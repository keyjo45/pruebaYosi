package com.gruponutresa.prisma.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;


public class CORSFilter implements Filter {
	

    public static final String ACCESS_CONTROL_ALLOW_ORIGIN = "Access-Control-Allow-Origin";
    public static final String ACCESS_CONTROL_ALLOW_ORIGIN_VALUE = "*";
    public static final String ACCESS_CONTROL_ALLOW_HEADERS = "Access-Control-Allow-Headers";
    public static final String ACCESS_CONTROL_ALLOW_HEADERS_VALUE = "Cache-Control, Origin, Authorization, Content-Type, X-Requested-With, Accept, token, locale, usage-os, usage-browser, usage-device, usage-ip";
    public static final String ACCESS_CONTROL_ALLOW_METHODS = "Access-Control-Allow-Methods";
    public static final String ACCESS_CONTROL_ALLOW_METHODS_VALUE = "GET, POST, PUT, DELETE, OPTIONS, HEAD";
    private static final String ACCESS_CONTROL_ALLOW_CREDENTIALS = "Access-Control-Allow-Credentials";
    public static final String[] ALL_HEADERs = {
            ACCESS_CONTROL_ALLOW_ORIGIN,
            ACCESS_CONTROL_ALLOW_CREDENTIALS,
            ACCESS_CONTROL_ALLOW_HEADERS,
            ACCESS_CONTROL_ALLOW_METHODS
    };
    private static final String ACCESS_CONTROL_ALLOW_CREDENTIALS_VALUE = "true";
    public static final String[] ALL_HEADER_VALUEs = {
            ACCESS_CONTROL_ALLOW_ORIGIN_VALUE,
            ACCESS_CONTROL_ALLOW_CREDENTIALS_VALUE,
            ACCESS_CONTROL_ALLOW_HEADERS_VALUE,
            ACCESS_CONTROL_ALLOW_METHODS_VALUE
    };
   

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;
        for (int i = 0; i < ALL_HEADERs.length; i++) {
            String value;
            if (ALL_HEADERs[i].equalsIgnoreCase(ACCESS_CONTROL_ALLOW_ORIGIN)) {
                value = ACCESS_CONTROL_ALLOW_ORIGIN_VALUE;
            } else {
                value = ALL_HEADER_VALUEs[i];
            }
            response.setHeader(ALL_HEADERs[i], value);
        }


        chain.doFilter(req, res);

    }

    @Override
    public void destroy() {

    }

}
