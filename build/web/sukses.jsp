<%-- 
    Document   : sukses
    Created on : Nov 27, 2020, 9:43:53 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<% 

    if(request.getParameter("submit")!=null)
    {
        String book_name = request.getParameter("book_name");
        String author_name = request.getParameter("author_name");
        String publisher_name = request.getParameter("publisher_name");
        String publish_year = request.getParameter("publish_year");
        String description = request.getParameter("description");
        String number_of_page = request.getParameter("number_of_page");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/library","root","");
        pst = con.prepareStatement("insert into listbook(book_name,author_name,publisher_name,publish_year,description,number_of_page)values(?,?,?,?,?,?)");
        pst.setString(1, book_name);
        pst.setString(2, author_name);
        pst.setString(3, publisher_name);
        pst.setString(4, publish_year);
        pst.setString(5, description);
        pst.setString(6, number_of_page);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Adddeddddd");     
    </script> 
    <%             
    }
   %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Student Registation System Crud using-JSP</h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" > 
                    
                    <div alight="left">
                        <label class="form-label">Book Name</label>
                        <input type="text" class="form-control" placeholder="Book Name" name="book_name" id="book_name" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Author Name</label>
                        <input type="text" class="form-control" placeholder="Author Name" name="author_name" id="author_name" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Publisher Name</label>
                        <input type="text" class="form-control" placeholder="Publisher Name" name="publisher_name" id="publisher_name" required >
                     </div>
                    
                     <div alight="left">
                        <label class="form-label">Publish Year</label>
                        <input type="text" class="form-control" placeholder="Publish Year" name="publish_year" id="publish_year" required >
                     </div>
                    
                     <div alight="left">
                        <label class="form-label">Description</label>
                        <input type="text" class="form-control" placeholder="Description" name="description" id="description" required >
                     </div>
                    
                     <div alight="left">
                        <label class="form-label">Number Of Page</label>
                        <input type="text" class="form-control" placeholder="Number Of Page" name="number_of_page" id="number_of_page" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Book Name</th>
                                    <th>Author Name</th>
                                    <th>Publisher Name</th>
                                    <th>Publish Year</th>
                                    <th>Description</th>
                                    <th>Number Of Page</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/library","root","");
                                
                                  String query = "select * from listbook";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("book_name") %></td>
                                 <td><%=rs.getString("author_name") %></td>
                                 <td><%=rs.getString("publisher_name") %></td>
                                 <td><%=rs.getString("publish_year") %></td>
                                 <td><%=rs.getString("description") %></td>
                                 <td><%=rs.getString("number_of_page") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>

            </div>  
        </div>

    </body>
</html>
<%
    }
%>
