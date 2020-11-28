<%-- 
    Document   : index
    Created on : Nov 27, 2020, 9:00:02 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Login</title>
            <link rel="stylesheet" href="assets/css/login.css">

    </head>
    <body>
    <div class="login-page">
  <div class="form">
    <form class="login-form" method="post" action="login.jsp">
      <input type="text" placeholder="username" name="username" value=""/>
      <input type="password" placeholder="password" name="password" value=""/>
      <button type="submit" value="Login">login</button>
      <p class="message">Not registered? <a href="registrasi.jsp">Create an account</a></p>
    </form>

  </div>
</div>
        
    </body>
</html>