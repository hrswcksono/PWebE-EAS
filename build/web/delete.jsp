<%-- 
    Document   : delete
    Created on : Nov 28, 2020, 1:57:15 AM
    Author     : USER
--%>

<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
Anda Belum login <br/>
<a href="index.jsp">Silahkan Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log out</a>
<%@page import="java.sql.*" %> 

        <script>
            
            alert("Record Deletee");  
       </script>

<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/library","root","");
        pst = con.prepareStatement("delete from listbook where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
        response.sendRedirect("dashboard.jsp");
        %>
        
        
<%
    }
%>