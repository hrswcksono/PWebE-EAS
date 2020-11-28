<%-- 
    Document   : logout
    Created on : Nov 27, 2020, 9:44:39 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
